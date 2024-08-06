use super::basetype::*;
use super::common::*;
use super::elastic::*;
use super::env::*;
use core::panic;
use multimap::MultiMap;
use serde_json::Value;
use std::collections::{HashMap, HashSet, VecDeque};
use std::error::Error;
use std::iter::zip;
use std::vec;

#[derive(Debug, Clone)]
struct Handshake {
    assign: Vec<Assignment>,
    _args: Vec<String>,
    sinks: Vec<String>,
}

impl Handshake {
    fn new(ir: &Value, args: Vec<String>) -> Self {
        Handshake {
            assign: ir["graph"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| {
                    let mut assign = Assignment::new(x);
                    assign.src = assign
                        .src
                        .replace("dataIn", "data_in")
                        .replace("dataOut", "data_out");
                    assign.dst = assign
                        .dst
                        .replace("dataIn", "data_in")
                        .replace("dataOut", "data_out");
                    assign
                })
                .collect(),
            _args: args,
            sinks: construct(&ir["sinks"])
                .iter()
                .map(|s| {
                    s.replace("dataIn", "data_in")
                        .replace("dataOut", "data_out")
                })
                .collect(),
        }
    }
}

#[derive(Debug, Clone)]
struct Stage {
    ops: Vec<Operation>,
    streams: Vec<String>,
    name: String,
}

impl Stage {
    fn check_stream(&self) -> bool {
        for name in &self.streams {
            let (a, b) = name.split_once(".").unwrap();
            let fifo = unsafe { &mut *FIFO }.get(&a.to_string()).unwrap();
            if b == "r_en" {
                if fifo.is_empty() {
                    println!("Stall for reading {}", a);
                    return false;
                }
            }
            if b == "w_en" {
                if fifo.is_full() {
                    println!("Stall for writing {}", a);
                    return false;
                }
            }
        }
        true
    }

    fn new(ir: &Value) -> Self {
        Stage {
            ops: ir["ops"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| Operation::new(x))
                .collect(),
            streams: ir["ops"]
                .as_array()
                .unwrap()
                .iter()
                .filter(|x| {
                    x["op_type"].as_str().unwrap() == "enable"
                        && x["stream"].as_bool().is_some()
                        && x["stream"].as_bool().unwrap()
                })
                .map(|x| x["port"].as_str().unwrap().to_string())
                .collect(),
            name: ir["stage"].as_str().unwrap().to_string(),
        }
    }
}

#[derive(Debug, Clone)]
struct PipeFor {
    inits: Vec<(String, String)>,
    stages: Vec<Stage>,
    cur_stages: VecDeque<usize>,
    ii: usize,
    control: Vec<VALUE>,
    args: Vec<String>,
}

impl PipeFor {
    fn new(ir: &Value, args: Vec<String>) -> Self {
        assert_eq!(ir["wires"]["name"].as_str().unwrap(), "i");
        PipeFor {
            inits: ir["inits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| {
                    (
                        String::from(x["dst"].as_str().unwrap()),
                        String::from(x["src"].as_str().unwrap()),
                    )
                })
                .collect(),
            stages: ir["stages"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| Stage::new(x))
                .collect(),
            cur_stages: VecDeque::new(),
            ii: ir["ii"].as_u64().unwrap() as usize,
            control: vec![],
            args: args,
        }
    }

    fn check_stream(&self) -> bool {
        let cur_stages = &self.cur_stages;
        for cur in cur_stages.iter() {
            let stage = &self.stages[*cur];
            if !stage.check_stream() {
                return false;
            }
        }
        true
    }

    fn step(&mut self, env: &mut StaticEnv) -> bool {
        let cur_stages = &mut self.cur_stages;

        env.set_value(&"done".to_string(), VALUE::Bool(false));

        if cur_stages.is_empty() {
            return false;
        }

        let stage_num = cur_stages.len();

        for cur in cur_stages.iter_mut() {
            let stage = &self.stages[*cur];
            for op in &stage.ops {
                if let EVAL::Deliver(deliver) = &op.eval(env) {
                    let val = env.get_value(&deliver.src);
                    if stage_num > 1 {
                        env.set_value(&deliver.dst_reg, val);
                    } else {
                        env.set_value(&deliver.dst_port, val);
                    }
                }
            }
            *cur = *cur + 1;
        }

        if *cur_stages.front().unwrap() == self.ii {
            let iter = env.get_value(&"i".to_string());
            let new_iter = add(&iter.get_type(), vec![iter, self.control[2]].as_ref());
            if let VALUE::Bool(true) = cmp_lte(vec![new_iter, self.control[1]].as_ref()) {
                env.set_value(&"i".to_string(), new_iter);
                cur_stages.push_front(0);
            }
        }

        if *cur_stages.back().unwrap() == self.stages.len() {
            cur_stages.pop_back();
            if cur_stages.is_empty() {
                env.set_value(&"done".to_string(), VALUE::Bool(true));
                return false;
            }
        }
        true
    }

    fn mark(&self) -> bool {
        for cur in &self.cur_stages {
            if test_breakpoint(&self.stages[*cur].name) {
                return true;
            }
        }
        false
    }

    fn init(&mut self, env: &mut StaticEnv) {
        self.control = self.args[..=2]
            .iter()
            .map(|arg| env.get_value_inner(arg))
            .collect();

        if let VALUE::Bool(true) = cmp_lte(vec![self.control[0], self.control[1]].as_ref()) {
            self.cur_stages = VecDeque::from(vec![0]);
            for (dst, src) in &self.inits {
                env.set_value(dst, env.get_value(src))
            }
            env.set_value(&"i".to_string(), self.control[0]);
            env.set_value(&"done".to_string(), VALUE::Bool(false));
        } else {
            env.set_value(&"done".to_string(), VALUE::Bool(true));
        }
    }
}

#[derive(Debug, Clone)]
enum Strategy {
    STG(STG),
    PipelineFor(PipeFor),
    Pipeline,
    Handshake(Handshake),
    _TEMP,
}

#[derive(Debug, Clone)]
struct Go {
    instance: String,
}

impl Go {
    fn new(ir: &Value) -> Self {
        Go {
            instance: String::from(ir["instance"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct Deliver {
    dst_port: String,
    dst_reg: String,
    src: String,
}

impl Deliver {
    fn new(ir: &Value) -> Self {
        Deliver {
            dst_port: String::from(ir["dst_port"].as_str().unwrap()),
            dst_reg: String::from(ir["dst_reg"].as_str().unwrap()),
            src: String::from(ir["src"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct Assignment {
    dst: String,
    src: String,
    guard: Option<String>,
}

impl Assignment {
    fn new(ir: &Value) -> Self {
        Assignment {
            dst: ir["dst"].as_str().unwrap().to_string(),
            src: ir["src"].as_str().unwrap().to_string(),
            guard: ir["condition"].as_str().map(|s| s.to_string()),
        }
    }
}

#[derive(Debug, Clone)]
enum Operation {
    Enable(String),
    Assign(Assignment),
    Compute(Computation),
    Go(Go),
    Deliver(Deliver),
}

enum EVAL {
    Nothing,
    Go(String),
    Deliver(Deliver),
}

impl Operation {
    fn new(ir: &Value) -> Self {
        match ir["op_type"].as_str().unwrap() {
            "go" => Operation::Go(Go::new(ir)),
            "deliver" => Operation::Deliver(Deliver::new(ir)),
            "assign" => Operation::Assign(Assignment::new(ir)),
            "enable" => Operation::Enable(ir["port"].as_str().unwrap().to_string()),
            _ => Operation::Compute(Computation::new(ir)),
        }
    }

    fn eval(&self, env: &mut StaticEnv) -> EVAL {
        match self {
            Operation::Compute(compute) => {
                operation_env(compute, env);
                EVAL::Nothing
            }
            Operation::Go(go) => EVAL::Go(go.instance.to_owned()),
            Operation::Deliver(deliver) => EVAL::Deliver(deliver.clone()),
            Operation::Assign(assign) => {
                if let Some(cond) = &assign.guard {
                    if env.get_value(cond) != VALUE::Bool(true) {
                        return EVAL::Nothing;
                    }
                }
                env.set_value(&assign.dst, env.get_value(&assign.src));
                EVAL::Nothing
            }
            Operation::Enable(port) => {
                env.set_value(port, VALUE::Bool(true));
                // env.print(0);
                EVAL::Nothing
            }
        }
    }
}

#[derive(Debug, Clone)]
struct State {
    ops: Vec<Operation>,
    streams: Vec<String>,
    default: Option<String>,
    transition: Vec<(String, String)>,
    done: Option<Vec<String>>,
}

impl State {
    fn check_stream(&self) -> bool {
        for name in &self.streams {
            let (a, b) = name.split_once(".").unwrap();
            let fifo = unsafe { &mut *FIFO }.get(&a.to_string()).unwrap();
            if b == "r_en" {
                if fifo.is_empty() {
                    println!("Stall for reading {}", a);
                    return false;
                }
            }
            if b == "w_en" {
                if fifo.is_full() {
                    println!("Stall for writing {}", a);
                    return false;
                }
            }
        }
        true
    }

    fn new(ir: &Value) -> Self {
        State {
            ops: ir["ops"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| Operation::new(x))
                .collect(),
            streams: ir["ops"]
                .as_array()
                .unwrap()
                .iter()
                .filter(|x| {
                    x["op_type"].as_str().unwrap() == "enable"
                        && x["stream"].as_bool().is_some()
                        && x["stream"].as_bool().unwrap()
                })
                .map(|x| x["port"].as_str().unwrap().to_string())
                .collect(),
            default: ir["transition"]["default"].as_str().map(|s| s.to_string()),
            transition: match ir["transition"]["jump"].as_array() {
                None => vec![],
                Some(jump) => jump
                    .iter()
                    .map(|x| {
                        (
                            String::from(x["dest"].as_str().unwrap()),
                            String::from(x["cond"].as_str().unwrap()),
                        )
                    })
                    .collect(),
            },
            done: ir["transition"]["done"].as_array().map(|done| {
                done.iter()
                    .map(|val| val.as_str().unwrap().to_string().to_owned())
                    .collect()
            }),
        }
    }
}

#[derive(Debug, Clone)]
struct STG {
    stg: HashMap<String, State>,
    _init_state: String,
    state: String,
    args: Vec<String>,
    num_in: usize,
}

impl STG {
    fn new(ir: &Value, args: Vec<String>, num_in: usize) -> Self {
        let mut stg = HashMap::new();
        ir["states"].as_array().unwrap().iter().for_each(|x| {
            stg.insert(String::from(x["state"].as_str().unwrap()), State::new(x));
        });
        let init_state = ir["init_state"].as_str().unwrap().to_string();
        STG {
            stg,
            _init_state: init_state.clone(),
            state: init_state,
            args: args,
            num_in,
        }
    }

    fn check_stream(&self) -> bool {
        let cur_state = &self.state;
        let state = self.stg.get(cur_state).unwrap();
        match &state.done {
            None => state.check_stream(),
            _ => true,
        }
    }

    fn step(&mut self, env: &mut StaticEnv) -> bool {
        let cur_state = &mut self.state;
        env.set_value(&"done".to_string(), VALUE::Bool(false));

        let state = self.stg.get(cur_state).unwrap();
        match &state.done {
            None => {
                for op in &state.ops {
                    if let EVAL::Go(instance_name) = op.eval(env) {
                        if let Component::Module(module_ref) =
                            env.sub_env.get(&instance_name).unwrap()
                        {
                            let mut module = module_ref.borrow_mut();
                            match &mut *module {
                                Instance::Static(instance, _) => {
                                    if !instance.active {
                                        instance.active = true;
                                        // instance
                                        //     .env
                                        //     .set_value(&"done".to_string(), VALUE::Bool(false));
                                        instance.stg.step(&mut instance.env);
                                        unsafe { &mut (*ACTIVE) }.push(module_ref.clone());
                                        unsafe { &mut (*NEW_INSTANCE) }.push(module_ref.clone());
                                    }
                                }
                                Instance::PipeFor(instance, _) => {
                                    if !instance.active {
                                        instance.active = true;
                                        // instance.pipeline.init(&mut instance.env);
                                        instance
                                            .env
                                            .set_value(&"done".to_string(), VALUE::Bool(false));
                                        // instance.pipeline.step(&mut instance.env);
                                        unsafe { &mut (*ACTIVE) }.push(module_ref.clone());
                                        unsafe { &mut (*NEW_INSTANCE) }.push(module_ref.clone());
                                    }
                                }
                            }
                        }
                    }
                }

                let mut has_jump = false;
                for (jump, cond) in &state.transition {
                    if env.get_value(cond) == VALUE::Bool(true) {
                        *cur_state = jump.to_owned();
                        has_jump = true;
                        break;
                    }
                }
                if !has_jump {
                    if let Some(state) = &state.default {
                        *cur_state = state.to_owned();
                    }
                }
                true
            }
            Some(done) => {
                let return_val: Vec<VALUE> = done.iter().map(|val| env.get_value(val)).collect();
                // println!("Return {:?}", return_val);
                for (arg, val) in zip(&self.args[self.num_in..self.args.len() - 1], return_val) {
                    env.set_value(arg, val)
                }
                env.set_value(&"done".to_string(), VALUE::Bool(true));
                *cur_state = self._init_state.clone();
                false
            }
        }
    }

    fn mark(&self) -> bool {
        test_breakpoint(&self.state)
    }

    fn _init(&mut self) {
        self.state = self._init_state.clone()
    }
}

#[derive(Debug, Clone)]
struct Submodule {
    name: String,
    module_name: String,
}

impl Submodule {
    fn new(ir: &Value) -> Self {
        Submodule {
            name: String::from(ir["instance_name"].as_str().unwrap()),
            module_name: String::from(ir["module_name"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct Module {
    strategy: Strategy,
    args: Vec<String>,
    types: Vec<String>,
    units: Vec<Unit>,
    instances: Vec<Submodule>,
    _num_in: usize,
    name: String,
}

impl Module {
    fn new(ir: &Value) -> Self {
        let strategy = match ir["style"].as_str().unwrap() {
            "dataflow" | "STG" => Strategy::STG(STG::new(
                ir,
                construct(&ir["args"]),
                ir["num_in"].as_u64().unwrap() as usize,
            )),
            "pipeline" => match ir["pipeline_style"].as_str().unwrap() {
                "for" => Strategy::PipelineFor(PipeFor::new(ir, construct(&ir["args"]))),
                "function" => Strategy::Pipeline,
                _ => Strategy::_TEMP,
            },
            "handshake" => Strategy::Handshake(Handshake::new(ir, construct(&ir["args"]))),
            _str => Strategy::_TEMP,
        };
        Module {
            strategy,
            args: construct(&ir["args"]),
            types: construct(&ir["types"]),
            units: ir["units"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| Unit::new(x))
                .collect(),
            instances: ir["instances"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| Submodule::new(x))
                .collect(),
            _num_in: ir["num_in"].as_u64().unwrap() as usize,
            name: ir["name"].as_str().unwrap().to_string(),
        }
    }
}

#[derive(Debug)]
struct STGInstance {
    stg: STG,
    active: bool,
    env: StaticEnv,
    stall: bool,
}

#[derive(Debug)]
struct PipeForInstance {
    pipeline: PipeFor,
    active: bool,
    env: StaticEnv,
    stall: bool,
}

#[derive(Debug)]
struct HandshakeInstance {}

use std::cell::RefCell;
use std::sync::Arc;

static mut MODULE: *mut HashMap<String, Module> = std::ptr::null_mut();
static mut MEMORY: *mut HashMap<String, HardwareMemory> = std::ptr::null_mut();
static mut FIFO: *mut HashMap<String, FIFO> = std::ptr::null_mut();
static mut CONSTANT: *mut HashMap<String, VALUE> = std::ptr::null_mut();
static mut ACTIVE: *mut Vec<Arc<RefCell<Instance>>> = std::ptr::null_mut();
static mut NEW_INSTANCE: *mut Vec<Arc<RefCell<Instance>>> = std::ptr::null_mut();
static mut TOP_DYNAMIC: Option<HandshakeEnv> = None;

static mut EQUALPOINT: *mut HashMap<String, HashSet<String>> = std::ptr::null_mut();
static mut EQUALVALUE: *mut HashMap<(String, String), VALUE> = std::ptr::null_mut();

pub fn set_equalpoint(state: String, op: String) {
    if let Some(ops) = unsafe { &mut (*EQUALPOINT) }.get_mut(&state) {
        ops.insert(op);
    } else {
        let mut ops = HashSet::new();
        ops.insert(op);
        unsafe { &mut (*EQUALPOINT) }.insert(state, ops);
    }
}

pub fn have_equalpoint() -> bool {
    !unsafe { &*EQUALPOINT }.is_empty()
}

pub fn contain_equalpoint(state: &String, op: &String) -> bool {
    if let Some(ops) = unsafe { &*EQUALPOINT }.get(state) {
        ops.contains(op)
    } else {
        false
    }
}

#[derive(Debug)]
enum Instance {
    Static(STGInstance, Option<Arc<RefCell<Instance>>>),
    PipeFor(PipeForInstance, Option<Arc<RefCell<Instance>>>),
}

impl Instance {
    fn step(&mut self) -> bool {
        match self {
            Instance::Static(instance, _) => {
                if instance.stg.check_stream() {
                    instance.stall = false;
                    let step = instance.stg.step(&mut instance.env);
                    if !step {
                        instance.active = false;
                    }
                    step
                } else {
                    instance
                        .env
                        .set_value(&"done".to_string(), VALUE::Bool(false));
                    instance.stall = true;
                    true
                }
            }
            Instance::PipeFor(instance, _) => {
                if instance.pipeline.cur_stages.is_empty() {
                    instance.pipeline.init(&mut instance.env);
                }
                if instance.pipeline.check_stream() {
                    instance.stall = false;
                    let step = instance.pipeline.step(&mut instance.env);
                    if !step {
                        instance.active = false;
                    }
                    step
                } else {
                    instance
                        .env
                        .set_value(&"done".to_string(), VALUE::Bool(false));
                    instance.stall = true;
                    true
                }
            }
        }
    }

    fn update(&mut self) {
        match self {
            Instance::Static(instance, _) => {
                if !instance.stall {
                    instance.env.update(false)
                }
            }
            Instance::PipeFor(instance, _) => {
                if !instance.stall {
                    instance.env.update(true)
                }
            }
        }
    }

    fn get_env(&self) -> &StaticEnv {
        match self {
            Instance::Static(instance, _) => &instance.env,
            Instance::PipeFor(instance, _) => &instance.env,
        }
    }

    fn get_env_mut(&mut self) -> &mut StaticEnv {
        match self {
            Instance::Static(instance, _) => &mut instance.env,
            Instance::PipeFor(instance, _) => &mut instance.env,
        }
    }

    fn mark(&self) -> bool {
        match self {
            Instance::Static(instance, _) => instance.stg.mark(),
            Instance::PipeFor(instance, _) => instance.pipeline.mark(),
        }
    }
}

pub fn parse_hec(ir: &Value) -> Result<(), Box<dyn Error>> {
    unsafe {
        init_global(&mut MODULE);
        init_global(&mut MEMORY);
        init_global(&mut FIFO);
        init_global(&mut CONSTANT);
        init_global(&mut ACTIVE);
        init_global(&mut NEW_INSTANCE);

        init_global(&mut EQUALPOINT);
        init_global(&mut EQUALVALUE);
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
                        HardwareMemory::new(vec![VALUE::I32(0); size as usize], &"i32".to_string()),
                    ),
                    "i64" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(vec![VALUE::I64(0); size as usize], &"i64".to_string()),
                    ),
                    "u32" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(vec![VALUE::U32(0); size as usize], &"u32".to_string()),
                    ),
                    "u64" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(vec![VALUE::U64(0); size as usize], &"u64".to_string()),
                    ),
                    "f32" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(
                            vec![VALUE::F32(0.0); size as usize],
                            &"f32".to_string(),
                        ),
                    ),
                    "f64" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(
                            vec![VALUE::F64(0.0); size as usize],
                            &"f64".to_string(),
                        ),
                    ),
                    "bool" => (*MEMORY).insert(
                        String::from(name),
                        HardwareMemory::new(
                            vec![VALUE::Bool(false); size as usize],
                            &"bool".to_string(),
                        ),
                    ),
                    _ => None,
                };
            }
        }
    }

    if let Value::Array(streams) = &ir["stream"] {
        for stream in streams {
            let name = stream["name"].as_str().unwrap();
            let depth = stream["depth"].as_u64().unwrap();
            let data_type = stream["type"].as_str().unwrap();
            unsafe {
                (*FIFO).insert(
                    String::from(name),
                    FIFO::new(depth as usize, &data_type.to_string()),
                );
            }
        }
    }

    if let Value::Array(constants) = &ir["constants"] {
        for constant in constants {
            let constant = Constant::new(&constant);
            unsafe {
                (*CONSTANT).insert(
                    constant.name,
                    build_value(&constant.ret_type, &constant.value),
                );
            }
        }
    }

    if let Value::Array(modules) = &ir["modules"] {
        for module in modules {
            unsafe {
                (*MODULE).insert(
                    String::from(module["name"].as_str().unwrap()),
                    Module::new(&module),
                );
            }
        }
    }

    Ok(())
}

#[derive(Debug)]
enum Component {
    Primitive(UnitEnv),
    Module(Arc<RefCell<Instance>>),
}

impl Component {
    fn update(&mut self) {
        match self {
            Component::Primitive(env) => env.update(),
            _ => (),
        }
    }

    fn print(&self, depth: usize) {
        match self {
            Component::Primitive(env) => {
                if env.has_value() {
                    println!("{}{:?}", " ".repeat(depth), env);
                }
            }
            _ => (),
        }
    }

    fn clear(&mut self) {
        match self {
            Component::Primitive(env) => env.clear(),
            Component::Module(instance_ref) => {
                let mut instance = instance_ref.borrow_mut();
                instance.get_env_mut().clear();
            }
        }
    }
}

#[derive(Debug)]
struct StaticEnv {
    env: HashMap<String, VALUE>,
    sub_env: HashMap<String, Component>,
    name: String,
}

impl IsEnv for StaticEnv {
    fn set_value(&mut self, port: &String, val: VALUE) {
        // println!("Set {} {:?}", port, val);
        match port.split_once(".") {
            Some((a, b)) => {
                if let Some(mem) = unsafe { &mut *MEMORY }.get_mut(&a.to_string()) {
                    mem.set_port(&b.to_string(), val);
                } else if let Some(fifo) = unsafe { &mut *FIFO }.get_mut(&a.to_string()) {
                    fifo.set_port(&b.to_string(), val);
                } else {
                    let component = self.sub_env.get_mut(&a.to_string()).unwrap();
                    match component {
                        Component::Primitive(env) => env.set_value(&b.to_string(), val),
                        Component::Module(instance_ref) => {
                            let mut instance = instance_ref.borrow_mut();
                            let env = instance.get_env_mut();
                            env.set_value(&b.to_string(), val)
                        }
                    }
                }
            }
            None => {
                self.env.insert(port.to_owned(), val);
            }
        }
    }

    fn get_value(&self, port: &String) -> VALUE {
        if let Some(val) = unsafe { &*CONSTANT }.get(port) {
            val.clone()
        } else {
            self.get_value_inner(port)
        }
    }

    fn get_all_value(&self, ops: &Vec<String>) -> Vec<VALUE> {
        ops.iter().map(|x| self.get_value(x)).collect()
    }
}

fn create_function_same_type(op_type: &str) -> fn(&Vec<VALUE>) -> VALUE {
    match op_type {
        "add_integer" | "add_float" => move |v| add(&v.first().unwrap().get_type(), v),
        "sub_integer" | "sub_float" => move |v| sub(&v.first().unwrap().get_type(), v),
        "mul_float" | "mul_integer" => move |v| mul(&v.first().unwrap().get_type(), v),
        "shift_left" => move |v| shift_left(&v.first().unwrap().get_type(), v),
        "cmp_integer_sle" => cmp_sle,
        "cmp_integer_ne" => cmp_ne,
        "cmp_float_ugt" => cmp_gt,
        "and" => move |v: &Vec<VALUE>| and(&v.first().unwrap().get_type(), v),
        "div_float" => move |v| div(&v.first().unwrap().get_type(), v),
        str => panic!("Undefined module: {}", str),
    }
}

fn create_handshake(unit: &Unit) -> Box<dyn IsHandshake> {
    match &unit.op_type as &str {
        "branch" => Box::new(Branch::set()),
        "buffer" => Box::new(ElasticBuffer::set()),
        "constant" => Box::new(ConstantElastic::new()),
        "mux_dynamic" => Box::new(MuxDynamic::set()),
        "control_merge" => Box::new(ControlMerge::set()),
        "mul_integer" => Box::new(BinaryUnitSeq::set(
            create_function_same_type(&unit.op_type),
            4,
        )),
        "div_float" | "mul_float" => Box::new(BinaryUnitSeq::set(
            create_function_same_type(&unit.op_type),
            9,
        )),
        "sub_float" | "add_float" => Box::new(BinaryUnitSeq::set(
            create_function_same_type(&unit.op_type),
            13,
        )),
        "cmp_float_ugt" => Box::new(BinaryUnitSeq::set(
            create_function_same_type(&unit.op_type),
            2,
        )),
        "trunc_integer" => Box::new(Trunc::new()),
        "select" => Box::new(Select::set()),
        str => {
            if str.starts_with("fork") {
                if let Some((_, b)) = str.split_once(":") {
                    Box::new(Fork::set(b.parse::<usize>().unwrap()))
                } else {
                    Box::new(Fork::set(2))
                }
            } else if str.starts_with("fifo") {
                if let Some((_, b)) = str.split_once(":") {
                    Box::new(ElasticFIFO::set(b.parse::<usize>().unwrap()))
                } else {
                    Box::new(ElasticFIFO::set(2))
                }
            } else if str.starts_with("dyn_Mem") {
                let setting = str.split_once(":").unwrap().1;
                let (port, size) = setting.split_once("#").unwrap();
                let (load, store) = port.split_once(",").unwrap();
                Box::new(DynMem::set(
                    load.parse::<usize>().unwrap(),
                    store.parse::<usize>().unwrap(),
                    size.parse::<usize>().unwrap(),
                    &unit.types[1],
                ))
            } else if str.starts_with("load") {
                Box::new(Load::new())
            } else if str.starts_with("store") {
                Box::new(Store::new())
            } else {
                Box::new(BinaryUnit::set(create_function_same_type(str)))
            }
        }
    }
}

impl HandshakeEnv {
    fn new(module: &Module) -> Self {
        let mut env = HashMap::new();
        for unit in &module.units {
            let mut new_module = create_handshake(unit);
            new_module.init();
            env.insert(unit.name.clone(), new_module);
        }
        let mut assign_map = MultiMap::new();
        if let Strategy::Handshake(handshake) = &module.strategy {
            for assign in &handshake.assign {
                if !assign.src.contains(".") {
                    // println!("{}", assign.src);
                    if let Some(val) = unsafe { &mut *CONSTANT }.get(&assign.src) {
                        if let Some((unit_name, port)) = assign.dst.split_once(".") {
                            let unit = env.get_mut(unit_name).unwrap();
                            let constant = unit.downcast_mut::<ConstantElastic>().unwrap();
                            assert_eq!(port, "data_in");
                            constant.data_in = val.to_owned();
                        } else {
                        }
                    } else {
                        assign_map.insert(assign.src.clone(), assign.dst.clone());
                        assign_map.insert(assign.dst.clone(), assign.src.clone());
                    }
                } else {
                    assign_map.insert(assign.src.clone(), assign.dst.clone());
                    assign_map.insert(assign.dst.clone(), assign.src.clone());
                }
            }
            let mut env = HandshakeEnv::create_env(env, assign_map);
            for sink in &handshake.sinks {
                if !env.assign.contains_key(sink) {
                    env.set_port_ready(sink, true);
                }
            }
            env
        } else {
            panic!()
        }

        // for arg in &module.args {
        //     env.set_value(arg, HandshakeValue::empty());
        // }
    }
}

impl StaticEnv {
    fn new(module: &Module) -> Self {
        let mut dsp = 0;
        let mut sub_env = HashMap::new();
        for unit in &module.units {
            sub_env.insert(unit.name.clone(), Component::Primitive(UnitEnv::new(unit)));
            match &unit.op_type as &str {
                "mul_integer" => dsp = dsp + 2,
                "add_float" | "sub_float" => dsp = dsp + 3,
                "mul_float" => dsp = dsp + 11,
                _ => (),
            }
        }
        // println!("DSP: {}", dsp);
        for instance in &module.instances {
            let sub_module = unsafe { &(*MODULE) }.get(&instance.module_name).unwrap();
            let module_env = StaticEnv::new(sub_module);

            match &sub_module.strategy {
                Strategy::STG(stg) => {
                    let new_module = STGInstance {
                        stg: stg.clone(),
                        active: false,
                        env: module_env,
                        stall: false,
                    };
                    let new_instance = Instance::Static(new_module, None);
                    sub_env.insert(
                        instance.name.to_owned(),
                        Component::Module(Arc::new(RefCell::new(new_instance))),
                    );
                }
                Strategy::PipelineFor(pipeline) => {
                    let new_module = PipeForInstance {
                        pipeline: pipeline.clone(),
                        active: false,
                        env: module_env,
                        stall: false,
                    };
                    let new_instance = Instance::PipeFor(new_module, None);
                    sub_env.insert(
                        instance.name.to_owned(),
                        Component::Module(Arc::new(RefCell::new(new_instance))),
                    );
                }
                _ => (),
            }
        }
        StaticEnv {
            env: HashMap::new(),
            sub_env,
            name: module.name.clone(),
        }
    }

    fn get_value_inner(&self, port: &String) -> VALUE {
        // println!("Get value: {:?}", port);
        match port.split_once(".") {
            Some((a, b)) => {
                if let Some(mem) = unsafe { &mut *MEMORY }.get_mut(&a.to_string()) {
                    // assert_eq!(b, "r_data");
                    mem.get_value(&b.to_string())
                } else if let Some(fifo) = unsafe { &mut *FIFO }.get_mut(&a.to_string()) {
                    assert_eq!(b, "r_data");
                    fifo.get_value()
                } else {
                    let component = self.sub_env.get(&a.to_string()).unwrap();
                    match component {
                        Component::Primitive(env) => env.get_value(&b.to_string()),
                        Component::Module(instance_ref) => {
                            let mut instance = instance_ref.borrow_mut();
                            let env = instance.get_env_mut();
                            env.get_value_inner(&b.to_string())
                        }
                    }
                }
            }
            None => match self.env.get(port) {
                Some(val) => val.clone(),
                None => panic!("{:?} {}", self.env, port),
            },
        }
    }

    fn update(&mut self, keep: bool) {
        if keep {
            let i = self.env.get("i").copied();
            if let Some(i) = i {
                self.env.clear();
                self.env.insert("i".to_string(), i.to_owned());
            }
        } else {
            self.env.clear();
        }
        for item in &mut self.sub_env {
            item.1.update();
        }
    }

    fn print(&self, depth: usize, vars: &[&str]) {
        for var in &self.env {
            println!("{}{} {:?}", " ".repeat(depth), var.0, var.1);
        }
        if vars.len() == 0 {
            for submodule in &self.sub_env {
                println!("{}{}:", " ".repeat(depth), submodule.0);
                submodule.1.print(depth + 1)
            }
        } else {
            for var in vars {
                if let Some(submodule) = self.sub_env.get(*var) {
                    println!("{}{}:", " ".repeat(depth), var);
                    submodule.print(depth + 1)
                }
            }
        }
    }

    fn clear(&mut self) {
        self.env.clear();
        self.set_value(&"done".to_string(), VALUE::Bool(false));

        for item in &mut self.sub_env {
            item.1.clear();
        }
    }
}

pub fn call_function(function_name: &str, args: &[&str]) -> Result<(), String> {
    // println!("Call {} with arguments: {:?}", function_name, args);
    let function = unsafe { (*MODULE).get(&String::from(function_name)) };
    match function {
        None => Err(String::from("!!Undefined function")),
        Some(module) => {
            if let Strategy::Handshake(_) = &module.strategy {
                unsafe {
                    TOP_DYNAMIC = Some(HandshakeEnv::new(module));
                }
                return Ok(());
            }
            let mut env = StaticEnv::new(module);
            for ((arg, arg_type), value) in zip(zip(&module.args, &module.types), args) {
                env.set_value(arg, build_value(arg_type, &String::from(value.to_owned())))
            }

            match &module.strategy {
                Strategy::STG(stg) => {
                    let new_module = STGInstance {
                        stg: stg.clone(),
                        active: true,
                        env,
                        stall: false,
                    };
                    let instance = Instance::Static(new_module, None);
                    unsafe { &mut (*ACTIVE) }.push(Arc::new(RefCell::new(instance)));
                }
                Strategy::PipelineFor(pipefor) => {
                    let mut pipeline = pipefor.clone();
                    pipeline.init(&mut env);
                    let new_module = PipeForInstance {
                        pipeline,
                        active: true,
                        env,
                        stall: false,
                    };
                    let instance = Instance::PipeFor(new_module, None);
                    unsafe { &mut (*ACTIVE) }.push(Arc::new(RefCell::new(instance)));
                }
                _ => (),
            }
            Ok(())
        }
    }
}

pub fn step(depth: usize, breakpoint: bool) -> bool {
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        for cycle in 0..depth {
            handshake.propagate();
            handshake.update();
            if cycle < depth - 1 {
                let mut flag = false;
                for unit in handshake.env.values() {
                    if unit.is_valid() {
                        flag = true;
                        break;
                    }
                }
                if !flag {
                    println!("Cycle count: {}", cycle);
                    return false;
                }
            }
        }
        return true;
    }
    for cycle in 0..depth {
        if unsafe { &(*ACTIVE) }.is_empty() {
            if breakpoint {
                println!("Cycle count: {}", cycle);
            }
            return false;
        }

        if breakpoint {
            for instance_ref in unsafe { &mut (*ACTIVE) } {
                let instance = instance_ref.borrow();
                if instance.mark() {
                    println!("Break with cycle count: {}", cycle);
                    return false;
                }
            }
        }

        let mut instances = vec![];
        let mut clear_instances = vec![];

        // unsafe {
        //     println!("Old Active");
        //     for active in &mut *ACTIVE {
        //         print!("{:?}", active.borrow_mut().get_env_mut().name);
        //     }
        //     println!("");
        // }

        let old_active: Vec<_> = unsafe { &mut (*ACTIVE) }.drain(..).collect();
        old_active.iter().for_each(|instance| {
            // println!("Pop {:?}", instance.borrow().get_env().name);
            let step = instance.borrow_mut().step();
            if step {
                // println!("Push {:?}", instance.borrow().get_env().name);
                instances.push(instance.clone());
                unsafe { &mut (*ACTIVE) }.push(instance.to_owned());
            } else {
                // println!("Clear {:?}", instance.borrow().get_env().name);
                clear_instances.push(instance.clone());
            }
        });

        // unsafe {
        //     println!("New Active");
        //     for active in &mut *ACTIVE {
        //         print!("{:?}", active.borrow_mut().get_env_mut().name);
        //     }
        //     println!("");
        // }

        instances.drain(..).for_each(|instance| {
            instance.borrow_mut().update();
        });

        clear_instances.drain(..).for_each(|instance| {
            instance.borrow_mut().get_env_mut().clear();
        });

        // unsafe {
        //     println!("New");
        //     for new in &mut *NEW_INSTANCE {
        //         print!("{:?}", new.borrow_mut().get_env_mut().name);
        //     }
        //     println!("");
        // }

        unsafe { &mut (*NEW_INSTANCE) }
            .drain(..)
            .for_each(|instance| {
                instance.borrow_mut().update();
            });

        // show_memory(&[]);

        unsafe { &mut *MEMORY }
            .iter_mut()
            .for_each(|mem| mem.1.update());

        unsafe { &mut *FIFO }
            .iter_mut()
            .for_each(|fifo: (&String, &mut FIFO)| fifo.1.update());

        // show_memory(&[]);
        if unsafe { !(*get_watchpoint()).is_empty() } {
            let vars: Vec<&str> = unsafe { &*get_watchpoint() }
                .iter()
                .map(|s| s.as_str())
                .collect();
            for instance in unsafe { &(*ACTIVE) }.iter() {
                match &*(instance.borrow()) {
                    Instance::Static(instance, _) => instance.env.print(0, &vars[..]),
                    Instance::PipeFor(instance, _) => instance.env.print(0, &vars[..]),
                }
            }
        }

        if have_equalpoint() {
            for instance in unsafe { &(*ACTIVE) }.iter() {
                match &*(instance.borrow()) {
                    Instance::Static(instance, _) => {
                        if let Some(ops) = unsafe { &*EQUALPOINT }.get(&instance.stg.state) {
                            for op in ops {
                                unsafe { &mut *EQUALVALUE }.insert(
                                    (instance.stg.state.clone(), op.clone()),
                                    instance.env.get_value_inner(&(op.clone() + ".result")),
                                );
                            }
                        }
                    }
                    Instance::PipeFor(instance, _) => (),
                }
            }
        }
    }
    if breakpoint {
        println!("Cycle count (finish): {}", depth);
    }
    true
}

pub fn load_memory(memory: &str, store: &[&str]) {
    if let Some(memory) = unsafe { (*MEMORY).get_mut(memory) } {
        memory.set(store)
    } else {
        if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
            let unit = handshake.env.get_mut(memory).unwrap();
            let memory = unit.downcast_mut::<DynMem>().unwrap();
            memory.set_mem(store);
        }
    }
}

pub fn ready(port: &str) {
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        handshake.set_ready(&port.to_string(), true);
    }
}

pub fn valid(port: &str, val: &str) {
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        match val {
            "control" => handshake.set_valid(&port.to_string(), VALUE::Control, true),
            _ => panic!(),
        }
    }
}

pub fn invalid(port: &str) {
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        handshake.set_valid(&port.to_string(), VALUE::ERROR, false);
    }
}

pub fn show_memory(memorys: &[&str]) {
    println!("!!SHOW MEMORY:");
    if memorys.len() == 0 {
        for (mem, value) in unsafe { &(*MEMORY) }.iter() {
            println!("\t{} {:?}", mem, value)
        }
        for (fifo, value) in unsafe { &(*FIFO) }.iter() {
            println!("\t{} {:?}", fifo, value)
        }
    } else {
        for mem in memorys {
            if let Some(memory) = unsafe { &(*MEMORY) }.get(*mem) {
                println!("\t{} {:?}", mem, memory);
            }
            if let Some(stream) = unsafe { &(*FIFO) }.get(*mem) {
                println!("\t{} {:?}", mem, stream);
            }
        }
    }
}

pub fn show_variable(vars: &[&str]) {
    println!("!!SHOW VALUE:");
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        if vars.len() == 0 {
            for (unit_name, unit) in handshake.env.iter_mut() {
                if let Some(memory) = unit.downcast_mut::<DynMem>() {
                    println!("Load address: {:?}", memory.load_address);
                    println!("Load data: {:?}", memory.load_data);
                    println!("Store address: {:?}", memory.store_address);
                    println!("Store data: {:?}", memory.store_data);
                } else {
                    println!("{} {:#?}", unit_name, unit);
                }
            }
        } else {
            for unit_name in vars {
                let unit = handshake.env.get_mut(&unit_name.to_string()).unwrap();
                if let Some(memory) = unit.downcast_mut::<DynMem>() {
                    println!("Load address: {:?}", memory.load_address);
                    println!("Load data: {:?}", memory.load_data);
                    println!("Store address: {:?}", memory.store_address);
                    println!("Store data: {:?}", memory.store_data);
                } else {
                    println!("{} {:#?}", unit_name, unit);
                }
            }
        }
    } else {
        for instance in unsafe { &(*ACTIVE) }.iter() {
            match &*(instance.borrow()) {
                Instance::Static(instance, _) => instance.env.print(0, vars),
                Instance::PipeFor(instance, _) => instance.env.print(0, vars),
            }
        }
    }
}

pub fn show_active() {
    if let Some(handshake) = unsafe { &mut TOP_DYNAMIC } {
        let mut active = Vec::new();
        for (unit_name, unit) in &handshake.env {
            if unit.is_valid() {
                // println!("{} {:#?}", unit_name, *unit);
                active.push(unit_name.to_owned());
            }
        }
        active.sort();
        println!("{:?}", active);
    }
    for instance_ref in unsafe { &(*ACTIVE) }.iter() {
        let instance = instance_ref.borrow();
        print!("{:?}: ", instance.get_env().name);
        match &*instance {
            Instance::Static(stg, _) => {
                println!("{}", stg.stg.state);
            }
            Instance::PipeFor(pipeline, _) => {
                println!("{:?}", pipeline.pipeline.cur_stages);
            }
        }
    }
}

pub fn execute_continue() {
    step(1000000000, true);
}

pub fn finish() -> bool {
    unsafe { &(*ACTIVE) }.is_empty()
}

pub fn get_equalvalue() -> *mut HashMap<(String, String), VALUE> {
    unsafe { EQUALVALUE }
}
