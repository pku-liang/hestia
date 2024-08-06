use super::common::*;

#[derive(Debug)]
pub struct Memory {
    store: Vec<VALUE>,
}

impl Memory {
    pub fn update(&mut self, index: usize, value: VALUE) {
        self.store[index] = value.clone();
    }

    pub fn get_value(&self, index: usize) -> VALUE {
        self.store[index]
    }

    pub fn set(&mut self, store: &[&str]) {
        let data_type = self.store[0].get_type();
        for (store, value) in self.store.iter_mut().zip(store) {
            *store = build_value(&data_type, &String::from(value.to_owned()));
        }
    }

    pub fn new(store: Vec<VALUE>) -> Self {
        Memory { store: store }
    }
}

#[derive(Debug)]
pub struct Stream {
    store: VecDeque<VALUE>,
    depth: usize,
}

impl Stream {
    pub fn is_empty(&self) -> bool {
        self.store.is_empty()
    }

    pub fn is_full(&self) -> bool {
        self.store.len() == self.depth
    }

    pub fn push(&mut self, value: VALUE) {
        self.store.push_back(value)
    }

    pub fn pop(&mut self) -> VALUE {
        self.store.pop_front().unwrap()
    }

    pub fn new(depth: usize) -> Self {
        Stream {
            store: VecDeque::with_capacity(depth),
            depth: depth,
        }
    }
}

#[derive(Debug)]
pub struct FIFO {
    store: VecDeque<VALUE>,
    depth: usize,
    r_en: ValueTiming,
    w_en: ValueTiming,
    r_data: VALUE,
    w_data: ValueTiming,
}

impl FIFO {
    pub fn update(&mut self) {
        if self.r_en.get_value() == VALUE::Bool(true) {
            let data = self.store.pop_front();
            assert!(data.is_some());
            self.r_data = data.unwrap();
        }
        if self.w_en.get_value() == VALUE::Bool(true) {
            self.store.push_back(self.w_data.get_value())
        }
        self.r_en.update();
        self.w_en.update();
        self.w_data.update();
    }

    pub fn set_port(&mut self, port: &String, val: VALUE) {
        match port as &str {
            "r_en" => self.r_en.set_value(val),
            "w_en" => self.w_en.set_value(val),
            "w_data" => self.w_data.set_value(val),
            _ => (),
        }
    }

    pub fn get_value(&self) -> VALUE {
        self.r_data
    }

    pub fn is_empty(&self) -> bool {
        self.store.is_empty()
    }

    pub fn is_full(&self) -> bool {
        self.store.len() == self.depth
    }

    pub fn new(depth: usize, data_type: &String) -> Self {
        FIFO {
            store: VecDeque::with_capacity(depth),
            depth: depth,
            r_en: ValueTiming::new(0, &"bool".to_string()),
            w_en: ValueTiming::new(0, &"bool".to_string()),
            r_data: VALUE::ERROR,
            w_data: ValueTiming::new(0, data_type),
        }
    }
}

#[derive(Debug)]
pub struct HardwareMemory {
    store: Vec<VALUE>,
    r_en: ValueTiming,
    w_en: ValueTiming,
    addr: ValueTiming,
    data: ValueTiming,
    r_en2: ValueTiming,
    w_en2: ValueTiming,
    addr2: ValueTiming,
    data2: ValueTiming,
}

impl HardwareMemory {
    pub fn update(&mut self) {
        if self.w_en.get_value() == VALUE::Bool(true) {
            self.store[self.addr.get_new_value().as_u64() as usize] = self.data.get_value();
        }
        if self.w_en2.get_value() == VALUE::Bool(true) {
            self.store[self.addr2.get_new_value().as_u64() as usize] = self.data2.get_value();
        }

        self.r_en.update();
        self.w_en.update();
        self.addr.update();
        self.data.update();
        self.r_en2.update();
        self.w_en2.update();
        self.addr2.update();
        self.data2.update();
    }

    pub fn set_port(&mut self, port: &String, val: VALUE) {
        // println!("{} {:?}", port, val);
        match port as &str {
            "r_en" => self.r_en.set_value(val),
            "w_en" => self.w_en.set_value(val),
            "addr" => self.addr.set_value(val),
            "w_data" => self.data.set_value(val),
            "r_en2" => self.r_en2.set_value(val),
            "w_en2" => self.w_en2.set_value(val),
            "addr2" => self.addr2.set_value(val),
            "w_data2" => self.data2.set_value(val),
            _ => (),
        }
    }

    pub fn get_value(&self, port: &String) -> VALUE {
        // println!("{:?} {:?}", self.addr.get_value(), self.store[self.addr.get_value().as_u64() as usize]);
        match port as &str {
            "r_data" => self.store[self.addr.get_value().as_u64() as usize],
            "r_data2" => self.store[self.addr2.get_value().as_u64() as usize],
            _ => panic!("can only get value from r_data or r_Data2, not {:?}", port),
        }
    }

    pub fn set(&mut self, store: &[&str]) {
        let data_type = self.store[0].get_type();
        for (store, value) in self.store.iter_mut().zip(store) {
            *store = build_value(&data_type, &String::from(value.to_owned()));
        }
    }

    pub fn new(store: Vec<VALUE>, data_type: &String) -> Self {
        HardwareMemory {
            store,
            r_en: ValueTiming::new(1, &"bool".to_string()),
            w_en: ValueTiming::new(0, &"bool".to_string()),
            addr: ValueTiming::new(1, &"u32".to_string()),
            data: ValueTiming::new(0, data_type),
            r_en2: ValueTiming::new(1, &"bool".to_string()),
            w_en2: ValueTiming::new(0, &"bool".to_string()),
            addr2: ValueTiming::new(1, &"u32".to_string()),
            data2: ValueTiming::new(0, data_type),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum VALUE {
    Bool(bool),
    U32(u32),
    I32(i32),
    U64(u64),
    I64(i64),
    F32(f32),
    F64(f64),
    Control,
    ERROR,
}

impl VALUE {
    pub fn get_type(&self) -> String {
        String::from(match &self {
            VALUE::Bool(_) => "bool",
            VALUE::U32(_) => "u32",
            VALUE::U64(_) => "u64",
            VALUE::I32(_) => "i32",
            VALUE::I64(_) => "i64",
            VALUE::F32(_) => "f32",
            VALUE::F64(_) => "f64",
            VALUE::Control => "i1000",
            _ => "error",
        })
    }
}

pub fn convert(old_value: VALUE, new_type: &String) -> VALUE {
    match &new_type as &str {
        "bool" => VALUE::Bool(old_value.as_bool()),
        "i32" => VALUE::I32(old_value.as_i32()),
        "u32" => VALUE::U32(old_value.as_u32()),
        "f32" => VALUE::F32(old_value.as_f32()),
        "i64" => VALUE::I64(old_value.as_i64()),
        "u64" => VALUE::U64(old_value.as_u64()),
        "f64" => VALUE::F64(old_value.as_f64()),
        _ => VALUE::ERROR,
    }
}

pub fn build_value(data_type: &String, value: &String) -> VALUE {
    match &data_type as &str {
        "i32" => VALUE::I32(value.parse::<i32>().unwrap()),
        "i64" => VALUE::I64(value.parse::<i64>().unwrap()),
        "u32" => VALUE::U32(value.parse::<u32>().unwrap()),
        "u64" => VALUE::U64(value.parse::<u64>().unwrap()),
        "f32" => VALUE::F32(value.parse::<f32>().unwrap()),
        "f64" => VALUE::F64(value.parse::<f64>().unwrap()),
        "bool" => match value as &str {
            "0" => VALUE::Bool(false),
            "1" => VALUE::Bool(true),
            _ => VALUE::Bool(value.parse::<bool>().unwrap()),
        },
        _ => VALUE::ERROR,
    }
}

macro_rules! value_type {
    ($func_name: ident, $x: ty) => {
        pub fn $func_name(&self) -> $x {
            match &self {
                VALUE::U32(x) => *x as $x,
                VALUE::I32(x) => *x as $x,
                VALUE::U64(x) => *x as $x,
                VALUE::I64(x) => *x as $x,
                VALUE::Bool(x) => *x as $x,
                VALUE::ERROR => 0,
                _ => panic!(),
            }
        }
    };
}

impl VALUE {
    value_type!(as_u32, u32);
    value_type!(as_u64, u64);
    value_type!(as_i32, i32);
    value_type!(as_i64, i64);

    pub fn as_bool(&self) -> bool {
        match &self {
            VALUE::U32(x) => *x != 0,
            VALUE::I32(x) => *x != 0,
            VALUE::U64(x) => *x != 0,
            VALUE::I64(x) => *x != 0,
            VALUE::Bool(x) => *x,
            VALUE::ERROR => false,
            _ => panic!(),
        }
    }

    pub fn as_f32(&self) -> f32 {
        match &self {
            VALUE::F32(x) => *x,
            VALUE::F64(x) => *x as f32,
            VALUE::U32(x) => *x as f32,
            VALUE::I32(x) => *x as f32,
            VALUE::U64(x) => *x as f32,
            VALUE::I64(x) => *x as f32,
            _ => 0.0,
        }
    }

    pub fn as_f64(&self) -> f64 {
        match &self {
            VALUE::F32(x) => *x as f64,
            VALUE::F64(x) => *x,
            VALUE::U32(x) => *x as f64,
            VALUE::I32(x) => *x as f64,
            VALUE::U64(x) => *x as f64,
            VALUE::I64(x) => *x as f64,
            _ => 0.0,
        }
    }
}

macro_rules! binary_operation {
    ($func_name: ident, $x: expr) => {
        pub fn $func_name(ret_type: &String, values: &Vec<VALUE>) -> VALUE {
            match &ret_type as &str {
                "u32" => VALUE::U32($x(values[0].as_u32(), values[1].as_u32())),
                "u64" => VALUE::U64($x(values[0].as_u64(), values[1].as_u64())),
                "i32" => VALUE::I32($x(values[0].as_i32(), values[1].as_i32())),
                "i64" => VALUE::I64($x(values[0].as_i64(), values[1].as_i64())),
                _ => VALUE::ERROR,
            }
        }
    };
}

macro_rules! binary_operation_fp {
    ($func_name: ident, $x: expr) => {
        pub fn $func_name(ret_type: &String, values: &Vec<VALUE>) -> VALUE {
            match &ret_type as &str {
                "u32" => VALUE::U32($x(values[0].as_u32(), values[1].as_u32())),
                "u64" => VALUE::U64($x(values[0].as_u64(), values[1].as_u64())),
                "i32" => VALUE::I32($x(values[0].as_i32(), values[1].as_i32())),
                "i64" => VALUE::I64($x(values[0].as_i64(), values[1].as_i64())),
                "f32" => VALUE::F32($x(values[0].as_f32(), values[1].as_f32())),
                "f64" => VALUE::F64($x(values[0].as_f64(), values[1].as_f64())),
                _ => VALUE::ERROR,
            }
        }
    };
}

macro_rules! boolean_binary_operation {
    ($func_name: ident, $x: expr) => {
        pub fn $func_name(ret_type: &String, values: &Vec<VALUE>) -> VALUE {
            match &ret_type as &str {
                "u32" => VALUE::U32($x(values[0].as_u32(), values[1].as_u32())),
                "u64" => VALUE::U64($x(values[0].as_u64(), values[1].as_u64())),
                "i32" => VALUE::I32($x(values[0].as_i32(), values[1].as_i32())),
                "i64" => VALUE::I64($x(values[0].as_i64(), values[1].as_i64())),
                "bool" => VALUE::Bool($x(values[0].as_bool(), values[1].as_bool())),
                _ => VALUE::ERROR,
            }
        }
    };
}

pub fn merge_type(x: VALUE, y: VALUE) -> String {
    let str = match x {
        VALUE::U32(_) => match y {
            VALUE::U32(_) => "u32",
            VALUE::U64(_) => "u64",
            _ => "error",
        },
        VALUE::U64(_) => match y {
            VALUE::U32(_) | VALUE::U64(_) => "u64",
            _ => "error",
        },
        VALUE::I32(_) => match y {
            VALUE::I32(_) => "i32",
            VALUE::I64(_) => "i64",
            _ => "error",
        },
        VALUE::I64(_) => match y {
            VALUE::I32(_) | VALUE::I64(_) => "i64",
            _ => "error",
        },
        VALUE::F32(_) => match y {
            VALUE::F32(_) => "f32",
            _ => "error",
        },
        VALUE::F64(_) => match y {
            VALUE::F64(_) => "f64",
            _ => "error",
        },
        _ => "error",
    };
    String::from(str)
}

macro_rules! boolean_operation {
    ($func_name: ident, $x: expr) => {
        pub fn $func_name(values: &Vec<VALUE>) -> VALUE {
            let operand_type = merge_type(values[0], values[1]);
            match &operand_type as &str {
                "u32" => VALUE::Bool($x(values[0].as_u32(), values[1].as_u32())),
                "u64" => VALUE::Bool($x(values[0].as_u64(), values[1].as_u64())),
                "i32" => VALUE::Bool($x(values[0].as_i32(), values[1].as_i32())),
                "i64" => VALUE::Bool($x(values[0].as_i64(), values[1].as_i64())),
                "bool" => VALUE::Bool($x(values[0].as_bool(), values[1].as_bool())),
                "f32" => VALUE::Bool($x(values[0].as_f32(), values[1].as_f32())),
                "f64" => VALUE::Bool($x(values[0].as_f64(), values[1].as_f64())),
                _ => VALUE::ERROR,
            }
        }
    };
}

binary_operation!(shift_left, |x, y| x << y);
binary_operation!(shift_right, |x, y| x >> y);
binary_operation!(divsi, |x, y| x / y);
binary_operation_fp!(add, |x, y| x + y);
binary_operation_fp!(sub, |x, y| x - y);
binary_operation_fp!(mul, |x, y| x * y);
binary_operation_fp!(div, |x, y| x / y);
boolean_binary_operation!(and, |x, y| x & y);
boolean_binary_operation!(or, |x, y| x | y);
boolean_operation!(cmp_gte, |x, y| x >= y);
boolean_operation!(cmp_gt, |x, y| x > y);
boolean_operation!(cmp_lte, |x, y| x <= y);
boolean_operation!(cmp_lt, |x, y| x < y);
boolean_operation!(cmp_eq, |x, y| x == y);
boolean_operation!(cmp_sle, |x, y| x <= y);
boolean_operation!(cmp_ne, |x, y| x != y);

pub fn not(values: &Vec<VALUE>) -> VALUE {
    VALUE::Bool(!(values[0].as_bool()))
}

pub fn exp(values: &Vec<VALUE>) -> VALUE {
    match &values[0].get_type() as &str {
        "f32" => VALUE::F32(f32::powf(2.71828, values[0].as_f32())),
        "f64" => VALUE::F64(f64::powf(2.71828, values[0].as_f64())),
        _ => VALUE::ERROR,
    }
}

pub fn erf(values: &Vec<VALUE>) -> VALUE {
    match &values[0].get_type() as &str {
        "f32" => VALUE::F32(0.0),
        "f64" => VALUE::F64(0.0),
        _ => VALUE::ERROR,
    }
}

pub fn sqrt(values: &Vec<VALUE>) -> VALUE {
    match &values[0].get_type() as &str {
        "f32" => VALUE::F32(f32::sqrt(values[0].as_f32())),
        "f64" => VALUE::F64(f64::sqrt(values[0].as_f64())),
        _ => VALUE::ERROR,
    }
}

pub fn powf(values: &Vec<VALUE>) -> VALUE {
    match &values[0].get_type() as &str {
        "f32" => VALUE::F32(f32::powf(values[0].as_f32(), values[1].as_f32())),
        "f64" => VALUE::F64(f64::powf(values[0].as_f64(), values[1].as_f64())),
        _ => VALUE::ERROR,
    }
}

pub fn select(values: &Vec<VALUE>) -> VALUE {
    if values[0].as_bool() {
        values[1]
    } else {
        values[2]
    }
}

use std::collections::VecDeque;

#[derive(Debug, Clone)]
pub struct ValueTiming {
    depth: usize,
    data_type: String,
    queue: VecDeque<VALUE>,
    new_value: VALUE,
}

impl ValueTiming {
    pub fn new(depth: usize, data_type: &String) -> Self {
        ValueTiming {
            depth,
            data_type: data_type.clone(),
            queue: VecDeque::from(vec![VALUE::ERROR; depth]),
            new_value: VALUE::ERROR,
        }
    }

    pub fn set_value(&mut self, val: VALUE) {
        self.new_value = val;
    }

    pub fn get_value(&self) -> VALUE {
        if self.depth > 0 {
            self.queue.front().unwrap().clone()
        } else {
            self.new_value
        }
    }

    pub fn get_type(&self) -> String {
        self.data_type.clone()
    }

    pub fn get_new_value(&self) -> VALUE {
        self.new_value
    }

    pub fn update(&mut self) {
        if self.depth > 0 {
            self.queue.pop_front();
            self.queue.push_back(self.new_value);
            self.new_value = VALUE::ERROR;
        } else {
            self.new_value = VALUE::ERROR;
        }
    }

    pub fn clear(&mut self) {
        self.new_value = VALUE::ERROR;
        for val in self.queue.iter_mut() {
            *val = VALUE::ERROR;
        }
    }

    pub fn has_value(&self) -> bool {
        for val in &self.queue {
            if *val != VALUE::ERROR {
                return true;
            }
        }
        false
    }
}

use serde_json::Value;

#[derive(Debug, Clone)]
pub struct Constant {
    pub name: String,
    pub value: String,
    pub ret_type: String,
}

impl Constant {
    pub fn new(ir: &Value) -> Self {
        Constant {
            name: String::from(ir["name"].as_str().unwrap()),
            value: String::from(ir["operands"].as_str().unwrap()),
            ret_type: String::from(ir["type"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
pub struct Computation {
    pub operands: Vec<String>,
    pub op_type: String,
    pub name: String,
    pub ret_type: String,
}

impl Computation {
    pub fn new(ir: &Value) -> Self {
        Computation {
            name: String::from(ir["name"].as_str().unwrap()),
            op_type: String::from(ir["op_type"].as_str().unwrap()),
            ret_type: String::from(ir["type"].as_str().unwrap()),
            operands: construct(&ir["operands"]),
        }
    }
}

pub trait IsEnv {
    fn set_value(&mut self, port: &String, val: VALUE);
    fn get_all_value(&self, ops: &Vec<String>) -> Vec<VALUE>;
    fn get_value(&self, port: &String) -> VALUE;
}

pub fn operation_env(compute: &Computation, env: &mut impl IsEnv) {
    let name = &compute.name;
    let ret_type = &compute.ret_type;
    let ops = &compute.operands;
    match &(compute.op_type) as &str {
        "constant" => env.set_value(name, build_value(ret_type, &ops[0])),
        "shift_left" => env.set_value(name, shift_left(ret_type, &env.get_all_value(ops))),
        "shift_right" => env.set_value(name, shift_right(ret_type, &env.get_all_value(ops))),
        "shrsi" => env.set_value(name, shift_right(ret_type, &env.get_all_value(ops))),
        "add" => env.set_value(name, add(ret_type, &env.get_all_value(ops))),
        "sub" => env.set_value(name, sub(ret_type, &env.get_all_value(ops))),
        "mul" => env.set_value(name, mul(ret_type, &env.get_all_value(ops))),
        "div" => env.set_value(name, div(ret_type, &env.get_all_value(ops))),
        "divsi" => env.set_value(name, divsi(ret_type, &env.get_all_value(ops))),
        "and" => env.set_value(name, and(ret_type, &env.get_all_value(ops))),
        "or" => env.set_value(name, or(ret_type, &env.get_all_value(ops))),
        "cmp_gte" | "cmp_oge" | "cmp_sge" => env.set_value(name, cmp_gte(&env.get_all_value(ops))),
        "cmp_gt" | "cmp_ugt" | "cmp_sgt" | "cmp_ogt" => {
            env.set_value(name, cmp_gt(&env.get_all_value(ops)))
        }
        "cmp_lte" => env.set_value(name, cmp_lte(&env.get_all_value(ops))),
        "cmp_lt" | "cmp_ult" | "cmp_slt" | "cmp_olt" => {
            env.set_value(name, cmp_lt(&env.get_all_value(ops)))
        }
        "cmp_eq" => env.set_value(name, cmp_eq(&env.get_all_value(ops))),
        "cmp_sle" => env.set_value(name, cmp_sle(&env.get_all_value(ops))),
        "cmp_ne" => env.set_value(name, cmp_ne(&env.get_all_value(ops))),
        "not" => env.set_value(name, not(&env.get_all_value(ops))),
        "index_cast" => env.set_value(name, env.get_value(&ops[0])),
        "select" => env.set_value(name, select(&env.get_all_value(ops))),
        "exp" => env.set_value(name, exp(&env.get_all_value(ops))),
        "erf" => env.set_value(name, erf(&env.get_all_value(ops))),
        "sqrt" => env.set_value(name, sqrt(&env.get_all_value(ops))),
        "powf" => env.set_value(name, powf(&env.get_all_value(ops))),
        "sitofp" => match ret_type as &str {
            "f64" => env.set_value(name, VALUE::F64(env.get_value(&ops[0]).as_f64())),
            "f32" => env.set_value(name, VALUE::F32(env.get_value(&ops[0]).as_f32())),
            _ => panic!(),
        },
        "trunc" => match ret_type as &str {
            "bool" => env.set_value(name, VALUE::Bool(env.get_value(&ops[0]).as_bool())),
            _ => panic!(),
        },
        _ => {
            panic!("{:#?}", compute);
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct HandshakeValue {
    pub valid: bool,
    pub ready: bool,
    pub data: VALUE,
}

impl HandshakeValue {
    pub fn new(val: VALUE) -> Self {
        HandshakeValue {
            valid: false,
            ready: false,
            data: val,
        }
    }

    pub fn empty() -> Self {
        HandshakeValue::new(VALUE::ERROR)
    }

    pub fn set_valid(&mut self, new_valid: bool, data: VALUE) -> bool {
        if self.valid != new_valid || self.data != data {
            self.valid = new_valid;
            self.data = data;
            true
        } else {
            false
        }
    }

    pub fn set_valid_from(&mut self, token: HandshakeValue) -> bool {
        self.set_valid(token.valid, token.data)
    }

    pub fn set_valid_only(&mut self, token: HandshakeValue) -> bool {
        self.set_valid(token.valid, VALUE::ERROR)
    }

    pub fn set_ready(&mut self, new_ready: bool) -> bool {
        if self.ready != new_ready {
            self.ready = new_ready;
            true
        } else {
            false
        }
    }

    pub fn set_ready_from(&mut self, token: HandshakeValue) -> bool {
        self.set_ready(token.ready)
    }
}
