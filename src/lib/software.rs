use super::basetype::*;
use super::common::*;
use serde_json::Value;
use std::collections::HashMap;
use std::error::Error;
use std::iter::zip;

#[inline]
fn construct_body(ir: &Value) -> Vec<Operation> {
    ir.as_array()
        .unwrap()
        .iter()
        .map(|x| match x["op_type"].as_str().unwrap() {
            "for" => Operation::For(ForOp::new(x)),
            "if" => Operation::If(IfOp::new(x)),
            "return" => Operation::Return(ReturnOp::new(x)),
            "yield" => Operation::Yield(YieldOp::new(x)),
            "load" => Operation::Load(LoadOp::new(x)),
            "store" => Operation::Store(StoreOp::new(x)),
            "call" => Operation::Call(CallOp::new(x)),
            _ => Operation::Compute(Computation::new(x)),
        })
        .collect()
}

#[derive(Debug, Clone)]
struct CallOp {
    names: Vec<String>,
    function: String,
    operands: Vec<String>,
}

impl CallOp {
    fn new(ir: &Value) -> Self {
        CallOp {
            names: construct(&ir["names"]),
            function: String::from(ir["function"].as_str().unwrap()),
            operands: construct(&ir["operands"]),
        }
    }
}

#[derive(Debug, Clone)]
struct ReturnOp {
    operands: Vec<String>,
}

impl ReturnOp {
    fn new(ir: &Value) -> Self {
        ReturnOp {
            operands: construct(&ir["operands"]),
        }
    }
}

#[derive(Debug, Clone)]
struct YieldOp {
    operands: Vec<String>,
}

impl YieldOp {
    fn new(ir: &Value) -> Self {
        YieldOp {
            operands: construct(&ir["operands"]),
        }
    }
}

#[derive(Debug, Clone)]
struct LoadOp {
    name: String,
    index: String,
    memory: String,
}

impl LoadOp {
    fn new(ir: &Value) -> Self {
        LoadOp {
            name: String::from(ir["name"].as_str().unwrap()),
            index: String::from(ir["index"].as_str().unwrap()),
            memory: String::from(ir["memory"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct StoreOp {
    value: String,
    index: String,
    memory: String,
}

impl StoreOp {
    fn new(ir: &Value) -> Self {
        StoreOp {
            value: String::from(ir["value"].as_str().unwrap()),
            index: String::from(ir["index"].as_str().unwrap()),
            memory: String::from(ir["memory"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct ForOp {
    ops: Vec<Operation>,
    iter_args: Vec<String>,
    iter_inits: Vec<String>,
    lb: String,
    ub: String,
    step: String,
    names: Vec<String>,
    iter_name: String,
    op_now: usize,
}

impl ForOp {
    fn new(ir: &Value) -> Self {
        ForOp {
            iter_args: construct(&ir["iter_args"]),
            iter_inits: construct(&ir["iter_inits"]),
            lb: String::from(ir["lb"].as_str().unwrap()),
            ub: String::from(ir["ub"].as_str().unwrap()),
            step: String::from(ir["step"].as_str().unwrap()),
            iter_name: String::from(ir["iter_name"].as_str().unwrap()),
            names: construct(&ir["names"]),
            ops: construct_body(&ir["body"]),
            op_now: 0,
        }
    }
}

#[derive(Debug, Clone)]
struct IfOp {
    ops: [Vec<Operation>; 2],
    condition: String,
    names: Vec<String>,
    op_now: (usize, usize),
}

impl IfOp {
    fn new(ir: &Value) -> Self {
        IfOp {
            condition: String::from(ir["condition"].as_str().unwrap()),
            names: construct(&ir["names"]),
            ops: [construct_body(&ir["body0"]), construct_body(&ir["body1"])],
            op_now: (0, 0),
        }
    }
}

#[derive(Debug, Clone)]
enum Operation {
    Compute(Computation),
    Return(ReturnOp),
    For(ForOp),
    If(IfOp),
    Yield(YieldOp),
    Load(LoadOp),
    Store(StoreOp),
    Call(CallOp),
    _TEMP,
}

enum EVAL {
    Nothing,
    Return(Vec<VALUE>),
    Yield(Vec<VALUE>),
}

impl Operation {
    fn mark(&self) -> bool {
        match self {
            Operation::Compute(compute) => test_breakpoint(&compute.name),
            Operation::Load(load) => test_breakpoint(&load.name),
            Operation::Store(_) => false,
            Operation::Yield(_) => false,
            Operation::Return(_) => false,
            Operation::For(for_op) => {
                let names = &for_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            Operation::If(if_op) => {
                let names = &if_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            _ => false,
        }
    }
    fn eval(&mut self) -> EVAL {
        match self {
            Operation::Compute(compute) => {
                operation_env(compute, &mut FakeEnv {});
                EVAL::Nothing
            }
            Operation::Load(load) => {
                let name = &load.name;
                let memory = &load.memory;
                let index = get_value(&load.index);
                set_value(name, get_mem_value(memory, index.as_u64() as usize));
                EVAL::Nothing
            }
            Operation::Store(store) => {
                let value = &store.value;
                let memory = &store.memory;
                let index = get_value(&store.index);
                set_mem_value(memory, index.as_u64() as usize, get_value(value));
                EVAL::Nothing
            }
            Operation::Yield(yield_op) => EVAL::Yield(get_all_value(&yield_op.operands)),
            Operation::Return(return_op) => EVAL::Return(get_all_value(&return_op.operands)),
            Operation::For(for_op) => {
                for_op.op_now = 0;
                let lb = get_value(&for_op.lb);
                let ub = get_value(&for_op.ub);
                if let VALUE::Bool(true) = cmp_lt(vec![lb, ub].as_ref()) {
                    set_value(&for_op.iter_name, lb);
                    for (arg, init) in zip(&for_op.iter_args, &for_op.iter_inits) {
                        set_value(arg, get_value(init));
                    }
                    unsafe { &mut (*CURRENT_STACK) }
                        .push(Controller::For(RefCell::new(for_op.clone())));
                }
                EVAL::Nothing
            }
            Operation::If(if_op) => {
                let condition = get_value(&if_op.condition);
                if let VALUE::Bool(true) = condition {
                    if_op.op_now = (0, 0);
                } else {
                    if_op.op_now = (1, 0);
                }
                unsafe { &mut (*CURRENT_STACK) }.push(Controller::If(RefCell::new(if_op.clone())));
                EVAL::Nothing
            }
            Operation::Call(call_op) => {
                let function = unsafe { (*FUNCTION).get(&String::from(&call_op.function)) };
                let operands = get_all_value(&call_op.operands);
                match function {
                    Some(module) => {
                        for (arg, value) in zip(&module.borrow().args, operands) {
                            set_value(arg, value)
                        }
                        unsafe { &mut (*CURRENT_STACK) }.push(Controller::Call(
                            RefCell::new(call_op.clone()),
                            module.clone(),
                        ));
                    }
                    None => panic!("Unfound function {:?}", call_op.function),
                }
                EVAL::Nothing
            }
            _ => EVAL::Nothing,
        }
    }

    fn drop(&self) {
        match self {
            Operation::Compute(compute) => drop_value(&compute.name),
            Operation::Load(load) => drop_value(&load.name),
            Operation::For(for_op) => {
                for name in for_op.names.iter() {
                    drop_value(&name);
                }
            }
            Operation::If(if_op) => {
                for name in if_op.names.iter() {
                    drop_value(&name);
                }
            }
            _ => (),
        }
    }
}

#[derive(Debug, Clone)]
struct Function {
    ops: Vec<Operation>,
    args: Vec<String>,
    types: Vec<String>,
    op_now: usize,
}

impl Function {
    fn new(ir: &Value) -> Self {
        Function {
            args: construct(&ir["args"]),
            types: construct(&ir["types"]),
            ops: construct_body(&ir["body"]),
            op_now: 0,
        }
    }
}

use std::cell::RefCell;

#[derive(Debug, Clone)]
enum Controller {
    Function(RefCell<Function>),
    For(RefCell<ForOp>),
    If(RefCell<IfOp>),
    Call(RefCell<CallOp>, RefCell<Function>),
    _TEMP,
}

static mut MEMORY: *mut HashMap<String, Memory> = std::ptr::null_mut();
static mut VARIABLE_VALUE: *mut HashMap<String, VALUE> = std::ptr::null_mut();
static mut FUNCTION: *mut HashMap<String, RefCell<Function>> = std::ptr::null_mut();
static mut OPERATION_STACK: *mut Vec<Controller> = std::ptr::null_mut();
static mut CURRENT_STACK: *mut Vec<Controller> = std::ptr::null_mut();

fn get_mem_value(var: &String, index: usize) -> VALUE {
    unsafe { &(*MEMORY) }.get(var).unwrap().get_value(index)
}

fn set_mem_value(var: &String, index: usize, value: VALUE) {
    unsafe { &mut (*MEMORY) }
        .get_mut(var)
        .unwrap()
        .update(index, value.clone());
}

struct FakeEnv {}

fn get_value(var: &String) -> VALUE {
    unsafe { &(*VARIABLE_VALUE) }.get(var).unwrap().clone()
}

fn set_value(var: &String, value: VALUE) {
    unsafe { &mut (*VARIABLE_VALUE) }.insert(var.to_owned(), value);
}

fn get_all_value(ops: &Vec<String>) -> Vec<VALUE> {
    ops.iter().map(|x| get_value(x)).collect()
}

impl IsEnv for FakeEnv {
    fn get_value(&self, var: &String) -> VALUE {
        get_value(var)
    }

    fn set_value(&mut self, var: &String, value: VALUE) {
        set_value(var, value)
    }

    fn get_all_value(&self, ops: &Vec<String>) -> Vec<VALUE> {
        get_all_value(ops)
    }
}

fn drop_value(var: &String) {
    unsafe { &mut (*VARIABLE_VALUE) }.remove(var);
}

pub fn parse_software(ir: &Value) -> Result<(), Box<dyn Error>> {
    unsafe {
        init_global(&mut MEMORY);
        init_global(&mut FUNCTION);
        init_global(&mut VARIABLE_VALUE);
        init_global(&mut OPERATION_STACK);
        init_global(&mut CURRENT_STACK);
    }
    if let Value::Array(memorys) = &ir["memory"] {
        for memory in memorys {
            let name = memory["name"].as_str().unwrap();
            let size = memory["size"].as_u64().unwrap();
            unsafe {
                let data_type = memory["type"].as_str().unwrap();
                match data_type {
                    "i32" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::I32(0); size as usize]),
                    ),
                    "i64" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::I64(0); size as usize]),
                    ),
                    "u32" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::U32(0); size as usize]),
                    ),
                    "u64" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::U64(0); size as usize]),
                    ),
                    "bool" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::Bool(false); size as usize]),
                    ),
                    "f32" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::F32(0.0); size as usize]),
                    ),
                    "f64" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::F64(0.0); size as usize]),
                    ),
                    _ => None,
                };
            }
        }
    }
    if let Value::Array(modules) = &ir["modules"] {
        for module in modules {
            unsafe {
                (*FUNCTION).insert(
                    String::from(module["name"].as_str().unwrap()),
                    RefCell::new(Function::new(&module)),
                );
            }
        }
    }
    Ok(())
}

#[inline]
fn drop_body(ops: &Vec<Operation>) {
    for op in ops {
        op.drop();
    }
}

enum STEP {
    Normal,
    Yield,
    Return(Vec<VALUE>),
}

impl Controller {
    fn mark(&self) -> bool {
        match self {
            Controller::Function(function_ref) => {
                let function = function_ref.borrow_mut();
                let now = function.op_now;
                function.ops[now].mark()
            }
            Controller::For(for_ref) => {
                let for_op = for_ref.borrow_mut();
                let now = for_op.op_now;
                for_op.ops[now].mark()
            }
            _ => false,
        }
    }
    fn step(&self) -> STEP {
        match self {
            Controller::Function(function_ref) => {
                let mut function = function_ref.borrow_mut();
                let now = function.op_now;
                match function.ops[now].eval() {
                    EVAL::Return(return_vals) => STEP::Return(return_vals),
                    EVAL::Nothing => {
                        function.op_now = now + 1;
                        STEP::Normal
                    }
                    _ => STEP::Normal,
                }
            }
            Controller::Call(_, function_ref) => {
                let mut function = function_ref.borrow_mut();
                let now = function.op_now;
                match function.ops[now].eval() {
                    EVAL::Return(return_vals) => STEP::Return(return_vals),
                    EVAL::Nothing => {
                        function.op_now = now + 1;
                        STEP::Normal
                    }
                    _ => STEP::Normal,
                }
            }
            Controller::For(for_ref) => {
                let mut for_op = for_ref.borrow_mut();
                let now = for_op.op_now;
                match for_op.ops[now].eval() {
                    EVAL::Yield(return_vals) => {
                        let iter_type = get_value(&for_op.lb).get_type();
                        let iter_name = get_value(&for_op.iter_name);
                        let step = get_value(&for_op.step);
                        let new_iter = add(&iter_type, vec![iter_name, step].as_ref());
                        let ub = get_value(&for_op.ub);
                        if let VALUE::Bool(true) = cmp_lt(vec![new_iter, ub].as_ref()) {
                            set_value(&for_op.iter_name, new_iter);
                            for (arg, new_arg) in zip(&for_op.iter_args, return_vals) {
                                set_value(arg, new_arg);
                            }
                            for_op.op_now = 0;
                            STEP::Normal
                        } else {
                            for (name, value) in zip(&for_op.names, return_vals) {
                                set_value(&name, value);
                                println!("{:?}", name);
                            }
                            drop(for_op);
                            self.drop();
                            STEP::Yield
                        }
                    }
                    EVAL::Return(return_vals) => STEP::Return(return_vals),
                    EVAL::Nothing => {
                        for_op.op_now = now + 1;
                        STEP::Normal
                    }
                }
            }
            Controller::If(if_ref) => {
                let mut if_op = if_ref.borrow_mut();
                let now = if_op.op_now;
                match if_op.ops[now.0][now.1].eval() {
                    EVAL::Yield(return_vals) => {
                        for (name, value) in zip(&if_op.names, return_vals) {
                            set_value(&name, value);
                        }
                        drop(if_op);
                        self.drop();
                        STEP::Yield
                    }
                    EVAL::Return(return_vals) => STEP::Return(return_vals),
                    EVAL::Nothing => {
                        if_op.op_now = (now.0, now.1 + 1);
                        STEP::Normal
                    }
                }
            }
            _ => STEP::Normal,
        }
    }
    fn drop(&self) {
        match self {
            Controller::Function(function_ref) => {
                let function = function_ref.borrow();
                drop_body(&function.ops);
            }
            Controller::Call(_, function_ref) => {
                let function = function_ref.borrow();
                drop_body(&function.ops);
            }
            Controller::For(for_ref) => {
                let for_op = for_ref.borrow();
                drop_body(&for_op.ops);
                drop_value(&for_op.iter_name);
                for iter_arg in for_op.iter_args.iter() {
                    drop_value(iter_arg);
                }
            }
            Controller::If(if_ref) => {
                let if_op = if_ref.borrow();
                drop_body(&if_op.ops[0]);
                drop_body(&if_op.ops[1]);
            }
            _ => (),
        }
    }
}

#[inline]
pub fn show_function() {
    for (function, _) in unsafe { &(*FUNCTION) }.iter() {
        println!("{}", function)
    }
}

#[inline]
pub fn show_variable(vars: &[&str]) {
    println!("!!SHOW VALUE:");
    if vars.len() == 0 {
        for (var, value) in unsafe { &(*VARIABLE_VALUE) }.iter() {
            println!("\t{} {:?}", var, value)
        }
    } else {
        for var in vars {
            println!(
                "\t{} {:?}",
                var,
                unsafe { &(*VARIABLE_VALUE) }.get(*var).unwrap()
            );
        }
    }
}

pub fn show_memory(memorys: &[&str]) {
    println!("!!SHOW MEMORY:");
    if memorys.len() == 0 {
        for (mem, value) in unsafe { &(*MEMORY) }.iter() {
            println!("\t{} {:?}", mem, value)
        }
    } else {
        for mem in memorys {
            println!("\t{} {:?}", mem, unsafe { &(*MEMORY) }.get(*mem).unwrap());
        }
    }
}

pub fn show_stack() {
    for controller in unsafe { &(*OPERATION_STACK) }.iter() {
        println!("{:#?}", controller)
    }
}

pub fn call_function(function_name: &str, args: &[&str]) -> Result<(), String> {
    println!("Call {} with arguments: {:?}", function_name, args);
    let function = unsafe { (*FUNCTION).get(&String::from(function_name)) };
    match function {
        None => Err(String::from("!!Undefined function")),
        Some(module) => {
            for ((arg, arg_type), value) in
                zip(zip(&module.borrow().args, &module.borrow().types), args)
            {
                set_value(arg, build_value(arg_type, &String::from(value.to_owned())))
            }
            unsafe {
                (*OPERATION_STACK).push(Controller::Function(module.clone()));
            }
            Ok(())
        }
    }
}

pub fn step(depth: usize, breakpoint: bool) -> bool {
    for _ in 0..depth {
        let top = unsafe { (*OPERATION_STACK).pop() };
        if top.is_none() {
            return false;
        }
        let top = top.unwrap();
        if breakpoint && top.mark() {
            unsafe {
                (*OPERATION_STACK).push(top);
            }
            return false;
        }
        let eval = top.step();
        match eval {
            STEP::Normal => {
                let mut tmp: Vec<Controller> = vec![];
                unsafe {
                    (*OPERATION_STACK).push(top);
                    while !(*CURRENT_STACK).is_empty() {
                        tmp.push((*CURRENT_STACK).pop().unwrap());
                    }
                    while !tmp.is_empty() {
                        (*OPERATION_STACK).push(tmp.pop().unwrap());
                    }
                }
            }
            STEP::Return(return_val) => {
                unsafe { &mut (*OPERATION_STACK) }.push(top);
                loop {
                    let top = unsafe { (*OPERATION_STACK).pop() }.unwrap();
                    match &top {
                        Controller::Function(function_ref) => {
                            let _function = function_ref.borrow();
                            top.drop();
                            println!("RETURN: ");
                            for val in &return_val {
                                println!("{:?}", val);
                            }
                            break;
                        }
                        Controller::Call(call_op, _) => {
                            let call_op = call_op.borrow();
                            for (ret, val) in zip(&call_op.names, &return_val) {
                                set_value(&ret, val.clone())
                            }
                            top.drop();
                            break;
                        }
                        _ => (),
                    }
                }
            }
            _ => (),
        }
        unsafe {
            assert!((*CURRENT_STACK).is_empty());
        }
        for var in unsafe { &*get_watchpoint() } {
            if let Some(value) = unsafe { &(*VARIABLE_VALUE) }.get(var) {
                println!("\t{} {:?}", var, value);
            }
        }
    }
    true
}

pub fn show_operation() {
    let top = unsafe { (*OPERATION_STACK).pop() };
    if top.is_none() {
        return;
    }
    match top.as_ref().unwrap() {
        Controller::Function(function_ref) => {
            let function = function_ref.borrow();
            if function.op_now < function.ops.len() {
                println!("{:?}", function.ops[function.op_now]);
            } else {
                println!("Function error");
            }
        }
        Controller::Call(_, function_ref) => {
            let function = function_ref.borrow();
            if function.op_now < function.ops.len() {
                println!("{:?}", function.ops[function.op_now]);
            } else {
                println!("Function error");
            }
        }
        Controller::For(for_ref) => {
            let for_op = for_ref.borrow();
            if for_op.op_now < for_op.ops.len() {
                println!("{:?}", for_op.ops[for_op.op_now]);
            } else {
                println!("For error");
            }
        }
        Controller::If(if_ref) => {
            let if_op = if_ref.borrow();
            if if_op.op_now.1 < if_op.ops[if_op.op_now.0].len() {
                println!("{:?}", if_op.ops[if_op.op_now.0][if_op.op_now.1]);
            } else {
                println!("If error");
            }
        }
        _ => (),
    }
    unsafe {
        (*OPERATION_STACK).push(top.unwrap());
    }
}

pub fn execute_continue() {
    let mut step_num = 0;
    while step(1, true) {
        step_num += 1;
    }
    // println!("Step size: {}", step_num);
}

pub fn load_memory(memory: &str, store: &[&str]) {
    let memory = unsafe { &mut (*MEMORY) }.get_mut(memory).unwrap();
    memory.set(store)
}
