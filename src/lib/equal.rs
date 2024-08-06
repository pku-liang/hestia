use super::basetype::*;
use super::common::*;
use super::hec;
use super::tor;
use serde_json::Value;
use std::collections::VecDeque;
use std::collections::{HashMap, HashSet};
use std::error::Error;

#[derive(Debug, Clone)]
struct Mapping {
    start: String,
    end: String,
    start_node: u64,
    end_node: u64,
    op: String,
    primitive: String,
}

impl Mapping {
    fn new(ir: &Value) -> Self {
        Mapping {
            start: String::from(ir["start"].as_str().unwrap()),
            end: String::from(ir["end"].as_str().unwrap()),
            start_node: ir["start_node"].as_u64().unwrap(),
            end_node: ir["end_node"].as_u64().unwrap(),
            op: String::from(ir["op"].as_str().unwrap()),
            primitive: String::from(ir["primitive"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct Compare {
    store: VecDeque<VALUE>,
    high: bool,
    op: String,
    state: String,
    primitive: String,
}

impl Compare {
    fn new(op: String, state: String, primitive: String) -> Self {
        Compare {
            store: VecDeque::new(),
            high: true,
            op: op,
            state: state,
            primitive: primitive,
        }
    }

    fn size(&self) -> isize {
        if self.high {
            self.store.len() as isize
        } else {
            -(self.store.len() as isize)
        }
    }

    fn is_high(&self) -> bool {
        self.size() >= 0
    }

    fn is_low(&self) -> bool {
        self.size() <= 0
    }

    fn push_high(&mut self, value: VALUE) {
        if self.high {
            self.store.push_back(value)
        } else {
            if self.store.is_empty() {
                self.high = true;
                self.store.push_back(value)
            } else {
                assert_eq!(
                    self.store.pop_front().unwrap(),
                    value,
                    "Value Mismatch: operation \"{}\" and primitive \"{}\" at state @{}",
                    self.op,
                    self.primitive,
                    self.state
                )
            }
        }
    }

    fn push_low(&mut self, value: VALUE) {
        if !self.high {
            self.store.push_back(value)
        } else {
            if self.store.is_empty() {
                self.high = false;
                self.store.push_back(value)
            } else {
                assert_eq!(self.store.pop_front().unwrap(), value)
            }
        }
    }
}

static mut LOW_MAPPING: *mut HashMap<(String, String), Mapping> = std::ptr::null_mut();
static mut HIGH_MAPPING: *mut HashMap<String, Mapping> = std::ptr::null_mut();
static mut COMPARISON: *mut HashMap<String, Compare> = std::ptr::null_mut();

pub fn parse_equal(ir: &Value) -> Result<(), Box<dyn Error>> {
    unsafe {
        init_global(&mut LOW_MAPPING);
        init_global(&mut HIGH_MAPPING);
        init_global(&mut COMPARISON);
    }
    if let Value::Array(mappings) = &ir {
        for mapping in mappings {
            let map = Mapping::new(mapping);
            tor::set_equalpoint(map.op.clone());
            hec::set_equalpoint(map.end.clone(), map.primitive.clone());
            unsafe { &mut *LOW_MAPPING }
                .insert((map.end.clone(), map.primitive.clone()), map.clone());
            unsafe { &mut *HIGH_MAPPING }.insert(map.op.clone(), map.clone());
            unsafe { &mut *COMPARISON }.insert(
                map.op.clone(),
                Compare::new(map.op.clone(), map.end.clone(), map.primitive.clone()),
            );
        }
    }
    //unsafe {
    //    println!("{:#?}", *COMPARISON);
    //}
    Ok(())
}

pub fn cosim() {
    while true {
        let high = tor::finish();
        let low = hec::finish();
        if high && low {
            break;
        }
        let mut sim_high = false;
        let mut sim_low = false;
        for compare in unsafe { &mut *COMPARISON }.values() {
            let size = compare.size();
            if size < 10 {
                sim_low = true;
            }
            if size > -10 {
                sim_high = true;
            }
        }
        if !high && sim_high {
            tor::step(1, false);
            let high_value = tor::get_equalvalue();
            unsafe {
                for pair in (*high_value).iter() {
                    if let Some(compare) = (&mut *COMPARISON).get_mut(pair.0) {
                        compare.push_high(pair.1.clone())
                    }
                }
                (*high_value).clear();
            }
        }
        if !low && sim_low {
            hec::step(1, false);
            let low_value = hec::get_equalvalue();
            unsafe {
                for pair in (*low_value).iter() {
                    if let Some(compare) =
                        (&mut *COMPARISON).get_mut(&(*LOW_MAPPING).get(pair.0).unwrap().op)
                    {
                        compare.push_low(pair.1.clone())
                    }
                }
                (*low_value).clear();
            }
        }
    }
    println!("Cosimulation success");
}
