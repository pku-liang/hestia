use super::basetype::*;
use super::common::*;
use super::elastic::*;
use multimap::MultiMap;
use serde_json::Value;
use std::collections::VecDeque;
use std::collections::{HashMap, HashSet};
use std::iter::zip;
use std::vec;

#[derive(Debug, Clone)]
pub struct Unit {
    pub op_type: String,
    pub name: String,
    pub types: Vec<String>,
}

impl Unit {
    pub fn new(ir: &Value) -> Self {
        Unit {
            op_type: String::from(ir["op_type"].as_str().unwrap()),
            name: String::from(ir["name"].as_str().unwrap()),
            types: construct(&ir["types"]),
        }
    }
}

#[derive(Debug, Clone)]
pub struct UnitEnv {
    op_type: String,
    env: HashMap<String, ValueTiming>,
}

impl UnitEnv {
    pub fn new(unit: &Unit) -> Self {
        let latency = match &unit.op_type as &str {
            "register" => 1,
            "mul_integer" => 3,
            "truncf" | "extf" | "sitofp" => 2,
            "div_integer" => 10,
            "sub_float" | "add_float" => match &unit.types[2] as &str {
                "f64" => 13,
                "f32" => 8,
                _ => panic!(),
            },
            "mul_float" => match &unit.types[2] as &str {
                "f64" => 9,
                "f32" => 4,
                _ => panic!(),
            },
            "div_float" => match &unit.types[2] as &str {
                "f64" => 30,
                "f32" => 20,
                _ => panic!(),
            },
            str => {
                if str.starts_with("cmp_float") {
                    2
                } else {
                    panic!("{:#?}", unit);
                }
            }
        };

        let values = match &unit.op_type as &str {
            "register" => vec![("reg", 1)],
            "div_float" | "mul_float" | "sub_float" | "add_float" | "mul_integer"
            | "div_integer" => {
                vec![("operand0", 0), ("operand1", 0), ("result", latency)]
            }
            "truncf" | "sitofp" | "extf" => vec![("operand", 0), ("result", latency)],
            str => {
                if str.starts_with("cmp_float") {
                    vec![("operand0", 0), ("operand1", 0), ("result", latency)]
                } else {
                    panic!()
                }
            }
        };

        let mut env = HashMap::new();
        for (data_type, (name, depth)) in zip(&unit.types, values) {
            let value_timing = ValueTiming::new(depth, data_type);
            env.insert(String::from(name), value_timing);
        }

        UnitEnv {
            op_type: unit.op_type.clone(),
            env,
        }
    }

    pub fn set_value(&mut self, port: &String, val: VALUE) {
        let val_timing = self.env.get_mut(port).unwrap();
        val_timing.set_value(val);
    }

    pub fn get_value(&self, port: &String) -> VALUE {
        self.env.get(port).unwrap().get_value()
    }

    pub fn get_new_value(&self, port: &String) -> VALUE {
        self.env.get(port).unwrap().get_new_value()
    }

    pub fn get_type(&self, port: &String) -> String {
        self.env.get(port).unwrap().get_type()
    }

    pub fn update(&mut self) {
        match &self.op_type as &str {
            "div_float" | "div_integer" | "mul_float" | "sub_float" | "add_float"
            | "mul_integer" | "cmp_float_ugt" | "cmp_float_oge" | "cmp_float_ogt"
            | "cmp_float_olt" | "cmp_float_une" => {
                let op0 = self.get_value(&"operand0".to_string());
                let op1 = self.get_value(&"operand1".to_string());
                if op0 != VALUE::ERROR && op1 != VALUE::ERROR {
                    let result = match &self.op_type as &str {
                        "div_float" | "div_integer" => {
                            div(&self.get_type(&"result".to_string()), &vec![op0, op1])
                        }
                        "mul_float" | "mul_integer" => {
                            mul(&self.get_type(&"result".to_string()), &vec![op0, op1])
                        }

                        "add_float" => add(&self.get_type(&"result".to_string()), &vec![op0, op1]),
                        "sub_float" => sub(&self.get_type(&"result".to_string()), &vec![op0, op1]),
                        "cmp_float_ugt" | "cmp_float_ogt" => cmp_gt(&vec![op0, op1]),
                        "cmp_float_oge" => cmp_gte(&vec![op0, op1]),
                        "cmp_float_olt" => cmp_lt(&vec![op0, op1]),
                        "cmp_float_une" => cmp_ne(&vec![op0, op1]),
                        _ => panic!(),
                    };
                    self.set_value(&"result".to_string(), result);
                }
            }
            "register" => {
                if let VALUE::ERROR = self.get_new_value(&"reg".to_string()) {
                    return;
                }
            }
            "truncf" | "sitofp" | "extf" => {
                let op = self.get_value(&"operand".to_string());
                if op != VALUE::ERROR {
                    let result = match &self.op_type as &str {
                        "truncf" | "sitofp" | "extf" => {
                            convert(op, &self.get_type(&"result".to_string()))
                        }
                        _ => panic!("{:#?}", self),
                    };
                    self.set_value(&"result".to_string(), result);
                }
            }
            _ => {
                panic!("{:#?}", self);
            }
        }

        for item in &mut self.env {
            item.1.update();
        }
    }

    pub fn clear(&mut self) {
        for item in &mut self.env {
            item.1.clear();
        }
    }

    pub fn has_value(&self) -> bool {
        for item in &self.env {
            if item.1.has_value() {
                return true;
            }
        }
        false
    }
}

#[derive(Debug)]
pub struct HandshakeEnv {
    pub env: HashMap<String, Box<dyn IsHandshake>>,
    pub assign: MultiMap<String, String>,
    pub update_list: VecDeque<String>,
    pub visit: HashSet<String>,
    pub need_update: HashSet<String>,
}

impl HandshakeEnv {
    pub fn create_env(
        env: HashMap<String, Box<dyn IsHandshake>>,
        assign: MultiMap<String, String>,
    ) -> Self {
        let mut update_list = VecDeque::new();
        let mut visit = HashSet::new();
        for name in env.keys() {
            update_list.push_back(name.to_owned());
            visit.insert(name.to_owned());
        }
        HandshakeEnv {
            env,
            assign,
            update_list,
            visit,
            need_update: HashSet::new(),
        }
    }

    pub fn propagate(&mut self) {
        while !self.update_list.is_empty() {
            let unit_name = self.update_list.pop_front().unwrap();
            self.visit.remove(&unit_name);
            let unit = self.env.get_mut(&unit_name).unwrap();
            // println!("Propagate: {}", unit_name);
            let update_port = unit.propagate();
            // println!("Changed: {:?}", update_port);
            let value = update_port
                .iter()
                .map(|name| unit.get_value(name))
                .collect::<Vec<HandshakeValue>>();
            // println!("Value {:?}", value);
            zip(update_port, value).for_each(|(name, val)| {
                let port_name = unit_name.clone() + "." + &name;
                // println!("{}", port_name);
                let pairs = self.assign.get_vec(&port_name);
                match pairs {
                    None => {
                        // println!("Not found {}", port_name);
                    }
                    Some(ports) => {
                        assert!(!ports.is_empty());
                        for port in ports {
                            if let Some((a, b)) = port.split_once(".") {
                                // println!("Found {} {}", a, b);
                                self.env.get_mut(a).unwrap().set_value(b, val);
                                let unit_name = a.to_string();
                                // self.need_update.insert(unit_name.clone());
                                if !self.visit.contains(&unit_name) {
                                    self.update_list.push_back(unit_name.clone());
                                    self.visit.insert(unit_name);
                                }
                            } else {
                                if val.valid {
                                    println!("{} {:?}", port, val.data);
                                }
                            }
                        }
                    }
                }
            });
        }
    }

    pub fn update(&mut self) {
        for (unit_name, unit) in self.env.iter_mut() {
            if unit.update() {
                self.update_list.push_back(unit_name.to_owned());
                self.visit.insert(unit_name.to_owned());
            }
        }
    }

    pub fn set_port_ready(&mut self, port: &String, ready: bool) {
        if let Some((unit_name, port)) = port.split_once('.') {
            let unit = self.env.get_mut(unit_name).unwrap();
            let mut value = unit.get_value(port);
            if value.set_ready(ready) {
                unit.set_value(port, value);
                if !self.visit.contains(unit_name) {
                    self.update_list.push_back(unit_name.to_owned());
                    self.visit.insert(unit_name.to_owned());
                }
            }
        }
    }

    pub fn set_port_valid(&mut self, port: &String, data: VALUE, valid: bool) {
        if let Some((unit_name, port)) = port.split_once('.') {
            let unit = self.env.get_mut(unit_name).unwrap();
            let mut value = unit.get_value(port);
            if value.set_valid(valid, data) {
                unit.set_value(port, value);
                if !self.visit.contains(unit_name) {
                    self.update_list.push_back(unit_name.to_owned());
                    self.visit.insert(unit_name.to_owned());
                }
            }
        }
    }

    pub fn set_ready(&mut self, port: &String, ready: bool) {
        let port_list = self.assign.get_vec(port);
        if let Some(port_list) = port_list {
            for port in port_list.to_owned() {
                self.set_port_ready(&port, ready);
            }
        }
    }

    pub fn set_valid(&mut self, port: &String, data: VALUE, valid: bool) {
        let port_list = self.assign.get_vec(port);
        if let Some(port_list) = port_list {
            for port in port_list.to_owned() {
                self.set_port_valid(&port, data, valid);
            }
        }
    }
}
