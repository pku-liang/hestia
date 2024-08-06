use super::equal;
use super::hec;
use super::software;
use super::tor;
use serde_json::Value;
use std::collections::HashSet;
use std::error::Error;
use std::fs::File;
use std::io::BufReader;
use std::io::Read;

static mut HAS_SOFTWARE: bool = false;
static mut HAS_TOR: bool = false;
static mut HAS_HEC: bool = false;

enum State {
    Software,
    ToR,
    HEC,
    Cosim,
}

static mut DEBUG_STATE: State = State::Software;

pub fn construct(ir: &Value) -> Vec<String> {
    let ops = ir.as_array().unwrap();
    ops.iter()
        .map(|x| String::from(x.as_str().unwrap()))
        .collect()
}

pub fn parse_file(path: &str) -> Result<(), Box<dyn Error>> {
    let file = File::open(path)?;
    let reader = BufReader::new(file);
    let ir: Value = serde_json::from_reader(reader)?;
    match ir["level"].as_str().unwrap() {
        "software" => {
            unsafe {
                HAS_SOFTWARE = true;
                DEBUG_STATE = State::Software;
            }
            software::parse_software(&ir)
        }
        "tor" => {
            unsafe {
                HAS_TOR = true;
                DEBUG_STATE = State::ToR;
            }
            tor::parse_tor(&ir)
        }
        "hec" => {
            unsafe {
                HAS_HEC = true;
                DEBUG_STATE = State::HEC;
            }
            hec::parse_hec(&ir)
        }
        _ => Ok(()),
    }
}

use std::alloc::Layout;

pub fn init_global<T, C: Default + std::iter::FromIterator<T>>(var: &mut *mut C) {
    unsafe {
        let layout = Layout::new::<C>();
        let ptr = std::alloc::alloc(layout) as *mut C;
        std::ptr::write(ptr, C::default());
        *var = ptr;
    }
}

pub fn show_variable(vars: &[&str]) {
    match unsafe { &DEBUG_STATE } {
        State::Software => software::show_variable(vars),
        State::ToR => tor::show_variable(vars),
        State::HEC => hec::show_variable(vars),
        _ => panic!("Cosim mode"),
    }
}

pub fn load_memory(memory: &str, store: &[&str]) {
    match unsafe { &DEBUG_STATE } {
        State::HEC => hec::load_memory(memory, store),
        _ => {
            if unsafe { HAS_SOFTWARE } {
                software::load_memory(memory, store);
            }
            if unsafe { HAS_TOR } {
                tor::load_memory(memory, store);
            }
        }
    }
}

pub fn show_memory(memorys: &[&str]) {
    match unsafe { &DEBUG_STATE } {
        State::Software => software::show_memory(memorys),
        State::ToR => tor::show_memory(memorys),
        State::HEC => hec::show_memory(memorys),
        _ => panic!("Cosim mode"),
    }
}

pub fn execute_continue() {
    match unsafe { &DEBUG_STATE } {
        State::Software => software::execute_continue(),
        State::ToR => tor::execute_continue(),
        State::HEC => hec::execute_continue(),
        _ => (),
    }
}

pub fn show_active() {
    match unsafe { &DEBUG_STATE } {
        State::Software => (),
        State::ToR => tor::show_active(),
        State::HEC => hec::show_active(),
        _ => panic!("Cosim mode"),
    }
}

pub fn call_function(function_name: &str, args: &[&str]) -> Result<(), String> {
    match unsafe { &DEBUG_STATE } {
        State::Software => software::call_function(function_name, args),
        State::ToR => tor::call_function(function_name, args),
        State::HEC => hec::call_function(function_name, args),
        _ => panic!("Cosim mode"),
    }
}

pub fn step(depth: usize) {
    match unsafe { &DEBUG_STATE } {
        State::Software => {
            software::step(depth, false);
        }
        State::ToR => {
            tor::step(depth, false);
        }
        State::HEC => {
            hec::step(depth, false);
        }
        _ => (),
    }
}

static mut BREAKPOINT: *mut HashSet<String> = std::ptr::null_mut();
static mut WATCHPOINT: *mut HashSet<String> = std::ptr::null_mut();

pub fn set_breakpoint(b: String) {
    unsafe { &mut (*BREAKPOINT) }.insert(b);
}

pub fn unset_breakpoint(b: &str) {
    unsafe { &mut (*BREAKPOINT) }.remove(b);
}

pub fn show_breakpoint() {
    for b in unsafe { &(*BREAKPOINT) }.iter() {
        println!("{}", b)
    }
}

pub fn test_breakpoint(b: &String) -> bool {
    unsafe {
        return (*BREAKPOINT).get(b).is_some();
    }
}

pub fn get_watchpoint() -> *mut HashSet<String> {
    unsafe { WATCHPOINT }
}

pub fn set_watchpoint(b: String) {
    unsafe { &mut (*WATCHPOINT) }.insert(b);
}

pub fn unset_watchpoint(b: &str) {
    unsafe { &mut (*WATCHPOINT) }.remove(b);
}

pub fn show_watchpoint() {
    for b in unsafe { &(*WATCHPOINT) }.iter() {
        println!("{}", b)
    }
}

pub fn test_watchpoint(b: &String) -> bool {
    unsafe {
        return (*WATCHPOINT).get(b).is_some();
    }
}

pub fn init() {
    unsafe {
        init_global(&mut BREAKPOINT);
        init_global(&mut WATCHPOINT);
    }
}

pub fn switch(str: &str) {
    match str {
        "software" => unsafe { DEBUG_STATE = State::Software },
        "tor" => unsafe { DEBUG_STATE = State::ToR },
        "hec" => unsafe { DEBUG_STATE = State::HEC },
        _ => (),
    }
}

pub fn cosim() {
    unsafe { DEBUG_STATE = State::Cosim }
    equal::cosim()
}

pub fn load_memory_file(memory: &str, path: &str) -> std::io::Result<()> {
    let mut file = File::open(path)?;
    let mut lines = String::new();
    file.read_to_string(&mut lines).unwrap();
    let store = lines.split_whitespace().collect::<Vec<&str>>();
    load_memory(memory, &store);
    Ok(())
}

pub fn parse_equal(path: &str) -> Result<(), Box<dyn Error>> {
    let file = File::open(path)?;
    let reader = BufReader::new(file);
    let ir: Value = serde_json::from_reader(reader)?;
    equal::parse_equal(&ir)
}
