use super::basetype::*;
use super::common::*;
use serde_json::Value;
use std::cmp::max;
use std::collections::VecDeque;
use std::collections::{HashMap, HashSet};
use std::error::Error;
use std::iter::zip;
use std::vec;

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
struct ReadOp {
    name: String,
    stream: String,
}

impl ReadOp {
    fn new(ir: &Value) -> Self {
        ReadOp {
            name: String::from(ir["name"].as_str().unwrap()),
            stream: String::from(ir["stream"].as_str().unwrap()),
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
struct WriteOp {
    value: String,
    stream: String,
}

impl WriteOp {
    fn new(ir: &Value) -> Self {
        WriteOp {
            value: String::from(ir["data"].as_str().unwrap()),
            stream: String::from(ir["stream"].as_str().unwrap()),
        }
    }
}

#[derive(Debug, Clone)]
struct ForOp {
    iter_args: Vec<String>,
    iter_inits: Vec<String>,
    lb: String,
    ub: String,
    step: String,
    names: Vec<String>,
    iter_name: String,
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
        }
    }
}

#[derive(Debug, Clone)]
struct IfOp {
    _start: usize,
    end: usize,
    condition: String,
    names: Vec<String>,
    latency: Option<u32>,
}

impl IfOp {
    fn new(ir: &Value) -> Self {
        IfOp {
            _start: ir["start"].as_u64().unwrap() as usize,
            end: ir["end"].as_u64().unwrap() as usize,
            condition: String::from(ir["condition"].as_str().unwrap()),
            names: construct(&ir["names"]),
            latency: None,
        }
    }
}

#[derive(Debug, Clone)]
enum Operation {
    Compute(Computation),
    For(ForOp),
    // If(IfOp),
    Load(LoadOp),
    Store(StoreOp),
    Read(ReadOp),
    Write(WriteOp),
    _TEMP,
}

impl Operation {
    fn eval(&self, env: &mut Env) {
        // println!("Begin EVAL {:?}", self);
        match self {
            Operation::Compute(compute) => {
                operation_env(compute, env);
                if have_equalpoint() && contain_equalpoint(&compute.name) {
                    unsafe { &mut *EQUALVALUE }
                        .insert(compute.name.clone(), env.get_value(&compute.name));
                }
            }
            Operation::Load(load) => {
                let name = &load.name;
                let memory = &load.memory;
                let index = env.get_value(&load.index);
                env.set_value(name, get_mem_value(memory, index.as_u64() as usize));
            }
            Operation::Store(store) => {
                let value = &store.value;
                let memory = &store.memory;
                let index = env.get_value(&store.index);
                set_mem_value(memory, index.as_u64() as usize, env.get_value(value));
            }
            Operation::Read(read) => {
                let name = &read.name;
                let stream = &read.stream;
                env.set_value(name, pop_stream_value(stream));
            }
            Operation::Write(write) => {
                let value = &write.value;
                let stream = &write.stream;
                push_stream_value(stream, env.get_value(value));
            }
            _ => (),
        }
    }

    fn mark(&self) -> bool {
        match self {
            Operation::Compute(compute) => test_breakpoint(&compute.name),
            Operation::Load(load) => test_breakpoint(&load.name),
            Operation::Store(_) => false,
            _ => false,
        }
    }
}

#[derive(Debug, Clone)]
enum Strategy {
    Static(TimeGraph),
    PipelineFor(TimeGraph, u32),
    PipelineFunc(u32),
    Dynamic,
    Dataflow(Vec<String>),
    _TEMP,
}

#[derive(Debug, Clone)]
struct Edge {
    to: usize,
    edge_type: String,
    ops: Vec<Operation>,
    stream: Vec<StreamOperation>,
}

#[derive(Debug, Clone)]
enum StreamOperation {
    Read(ReadOp),
    Write(WriteOp),
}

impl StreamOperation {
    fn check(&self) -> bool {
        match self {
            StreamOperation::Read(read) => !stream_empty(&read.stream),
            StreamOperation::Write(write) => !stream_full(&write.stream),
        }
    }
}

impl Edge {
    fn new(ir: &Value) -> Self {
        Edge {
            to: ir["to"].as_u64().unwrap() as usize,
            edge_type: String::from(ir["type"].as_str().unwrap()),
            ops: vec![],
            stream: vec![],
        }
    }

    fn get_latency(&self) -> u32 {
        if self.edge_type.contains(":") {
            let str = self.edge_type.split(":").collect::<Vec<&str>>();
            str[1].parse::<u32>().unwrap()
        } else {
            1
        }
    }

    fn check_stream(&self) -> bool {
        for stream in &self.stream {
            if !stream.check() {
                println!("Stall for {:?}", &stream);
                return false;
            }
        }
        true
    }
}

#[derive(Debug, Clone)]
struct TimeGraph {
    start: usize,
    end: usize,
    current: (usize, u32),
    graph: Vec<Vec<Edge>>,
    node: Vec<Control>,
    if_node: Vec<Option<(IfOp, Vec<YieldOp>, bool)>>,
    name: String,
}

#[derive(Debug, Clone)]
struct PipelineTimeGraph {
    _start: usize,
    end: usize,
    stages: Vec<(usize, u32, u32, bool)>,
    graph: Vec<Vec<Edge>>,
    node: Vec<Control>,
    if_node: Vec<Option<(IfOp, Vec<YieldOp>, bool)>>,
    finish: bool,
    for_id: usize,
    name: String,
}

impl PipelineTimeGraph {
    fn new(graph: &TimeGraph) -> Self {
        let mut own = PipelineTimeGraph {
            _start: graph.start,
            end: graph.end,
            stages: vec![(graph.start, 0, 0, false)],
            graph: graph.graph.clone(),
            node: graph.node.clone(),
            if_node: graph.if_node.clone(),
            finish: false,
            for_id: 0,
            name: graph.name.clone(),
        };

        for idx in 0..own.node.len() {
            if let Control::BeginIf(_) = own.node[idx] {
                own.get_aligned_latency(idx);
            }
        }

        own
    }

    fn check_stream_one_stage(&self, index: usize, cur: usize, env: &Vec<Env>) -> bool {
        if let Some((_, _, flag)) = &self.if_node[cur] {
            if !self.stages[index].3 {
                return true;
            }
        }
        match &self.node[cur] {
            Control::Normal => self.graph[cur][0].check_stream(),
            Control::BeginFor(for_op) => {
                let lb = env[index].get_value(&for_op.lb);
                let ub = env[index].get_value(&for_op.ub);
                if let VALUE::Bool(true) = cmp_lte(vec![lb, ub].as_ref()) {
                    for edge in &self.graph[cur] {
                        if edge.edge_type != "static-for" {
                            return self.check_stream_one_stage(index, edge.to, env);
                        }
                    }
                } else {
                    return true;
                }
                panic!("not found edge")
            }
            Control::BeginIf(if_op) => {
                let cond = env[index].get_value(&if_op.condition);
                if let VALUE::Bool(true) = cond {
                    if self.graph[cur][0].edge_type == "static"
                        || self.stages[index].1 > self.graph[cur][0].get_latency()
                    {
                        return self.check_stream_one_stage(index, self.graph[cur][0].to, env);
                    }
                } else {
                    if self.graph[cur].len() > 1 {
                        if self.graph[cur][1].edge_type == "static"
                            || self.stages[index].1 > self.graph[cur][1].get_latency()
                        {
                            return self.check_stream_one_stage(index, self.graph[cur][1].to, env);
                        }
                    } else {
                        if self.stages[index].1 > if_op.latency.unwrap() {
                            return self.check_stream_one_stage(index, if_op.end, env);
                        }
                    }
                }
                true
            }
            _ => true,
        }
    }

    fn check_stream(&self, env: &mut Vec<Env>) -> bool {
        for index in 0..self.stages.len() {
            if !self.check_stream_one_stage(index, self.stages[index].0, env) {
                return false;
            }
        }
        true
    }

    fn step_one_stage(&mut self, index: usize, env: &mut Vec<Env>) -> STEP {
        let cur = self.stages[index];
        println!("STEP {} {:?}", index, cur);
        if let Some((if_op, yield_op, _)) = &mut self.if_node[cur.0] {
            if !cur.3 {
                let cond = env[index].get_value(&if_op.condition);
                let branch = if let VALUE::Bool(true) = cond { 0 } else { 1 };
                if yield_op.len() > 1 {
                    let values = yield_op[branch]
                        .operands
                        .iter()
                        .map(|x| env[index].get_value(x))
                        .collect::<Vec<VALUE>>();
                    for (name, value) in zip(&if_op.names, values) {
                        env[index].set_value(&name, value);
                    }
                }
                self.stages[index].3 = true;
                return STEP::Nothing;
            } else {
            }
        }
        match &mut self.node[cur.0] {
            Control::Normal => {
                let edge = &self.graph[cur.0][0];
                /*if edge.ops.len() == 0 {
                    self.stages[index] = (edge.to, 0, cur.2);
                    return self.step_one_stage(index, env);
                } else */
                {
                    self.stages[index].1 += 1;
                    self.stages[index].2 += 1;
                    if cur.1 + 1 == edge.get_latency() {
                        for op in &edge.ops {
                            op.eval(&mut env[index]);
                        }
                        self.stages[index].0 = edge.to;
                        self.stages[index].1 = 0;
                        self.stages[index].3 = false;
                    }
                }
            }
            Control::BeginFor(for_op) => {
                self.stages[index].2 += 1;
                self.for_id = cur.0;
                let lb = env[index].get_value(&for_op.lb);
                let ub = env[index].get_value(&for_op.ub);
                if let VALUE::Bool(true) = cmp_lte(vec![lb, ub].as_ref()) {
                    env[index].set_value(&for_op.iter_name, lb);
                    for (arg, init) in zip(&for_op.iter_args, &for_op.iter_inits) {
                        let value = env[index].get_value(init);
                        env[index].set_value(arg, value);
                    }
                    for edge in &self.graph[cur.0] {
                        if edge.edge_type != "static-for" {
                            self.stages[index].0 = edge.to;
                            self.stages[index].1 = 0;
                            self.stages[index].3 = false;
                            break;
                        }
                    }
                } else {
                    for edge in &self.graph[cur.0] {
                        if edge.edge_type == "static-for" {
                            self.stages[index].0 = edge.to;
                            self.stages[index].1 = 0;
                            self.stages[index].3 = false;
                            break;
                        }
                    }
                }
                return self.step_one_stage(index, env);
            }
            Control::BeginIf(if_op) => {
                self.stages[index].2 += 1;
                let cond = env[index].get_value(&if_op.condition);
                if let VALUE::Bool(true) = cond {
                    self.stages[index].1 += 1;
                    if self.graph[cur.0][0].edge_type == "static"
                        || self.stages[index].1 > self.graph[cur.0][0].get_latency()
                    {
                        self.stages[index].0 = self.graph[cur.0][0].to;
                        self.stages[index].1 = 0;
                        self.stages[index].3 = false;
                        return self.step_one_stage(index, env);
                    }
                } else {
                    self.stages[index].1 += 1;
                    if self.graph[cur.0].len() > 1 {
                        if self.graph[cur.0][1].edge_type == "static"
                            || self.stages[index].1 > self.graph[cur.0][1].get_latency()
                        {
                            self.stages[index].0 = self.graph[cur.0][1].to;
                            self.stages[index].1 = 0;
                            self.stages[index].3 = false;
                            return self.step_one_stage(index, env);
                        }
                    } else {
                        if self.stages[index].1 > if_op.latency.unwrap() {
                            self.stages[index].0 = if_op.end;
                            self.stages[index].1 = 0;
                            self.stages[index].3 = false;
                            return self.step_one_stage(index, env);
                        }
                    }
                }
            }
            Control::Call(_call_op) => panic!("Call"),
            Control::EndFor(for_op, yield_op, start) => {
                self.stages[index].2 += 1;
                let values = yield_op
                    .as_ref()
                    .unwrap()
                    .operands
                    .iter()
                    .map(|x| env[index].get_value(x))
                    .collect::<Vec<VALUE>>();
                if self.stages.len() == 1 {
                    for (name, value) in zip(&for_op.names, values) {
                        env[index].set_value(&name, value);
                    }
                } else {
                    for (arg, value) in zip(&for_op.iter_args, values) {
                        env[index + 1].set_value(arg, value);
                    }
                }
                for edge in &self.graph[*start] {
                    if edge.edge_type == "static-for" {
                        self.stages[index].0 = edge.to;
                        self.stages[index].1 = 0;
                        self.stages[index].3 = false;
                        break;
                    }
                }
            }
            Control::Return(return_op) => {
                let values = return_op
                    .operands
                    .iter()
                    .map(|op| env[index].get_value(op))
                    .collect();
                return STEP::Return(values);
            }
        }
        STEP::Nothing
    }

    fn step(&mut self, env: &mut Vec<Env>, ii: u32) -> STEP {
        if !self.check_stream(env) {
            return STEP::Nothing;
        }
        let mut step = STEP::Nothing;
        for index in 0..self.stages.len() {
            let step_one_stage = self.step_one_stage(index, env);
            if let STEP::Return(_) = step_one_stage {
                step = step_one_stage;
            }
        }
        self.pipeline(ii, env);
        step
    }

    fn mark_one_stage(&self, index: usize) -> bool {
        let cur = self.stages[index];

        match &self.node[cur.0] {
            Control::Normal => {
                let edge = &self.graph[cur.0][0];
                if edge.ops.len() > 0 {
                    if cur.1 + 1 == edge.get_latency() {
                        for op in &edge.ops {
                            if op.mark() {
                                return true;
                            }
                        }
                    }
                }
                false
            }
            Control::BeginFor(for_op) => {
                let names = &for_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            Control::BeginIf(if_op) => {
                let names = &if_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            Control::Call(_call_op) => panic!("Call"),
            _ => false,
        }
    }

    fn mark(&self) -> bool {
        for index in 0..self.stages.len() {
            if self.mark_one_stage(index) {
                return true;
            }
        }
        false
    }

    fn pipeline(&mut self, ii: u32, env: &mut Vec<Env>) {
        if !self.finish {
            let last_stage = self.stages.last().unwrap();
            if last_stage.2 == ii + 1 {
                if let Control::BeginFor(for_op) = &self.node[self.for_id] {
                    let iter_type = env.last().unwrap().get_value(&for_op.lb).get_type();
                    let iter_name = env.last().unwrap().get_value(&for_op.iter_name);
                    let step = env.last().unwrap().get_value(&for_op.step);
                    let new_iter = add(&iter_type, vec![iter_name, step].as_ref());
                    let ub = env.last().unwrap().get_value(&for_op.ub);
                    if let VALUE::Bool(true) = cmp_lte(vec![new_iter, ub].as_ref()) {
                        let mut new_env = env.last().unwrap().clone();
                        new_env.set_value(&for_op.iter_name, new_iter);
                        env.push(new_env);
                        for edge in &self.graph[self.for_id] {
                            if edge.edge_type != "static-for" {
                                self.stages.push((edge.to, 0, 1, false));
                                break;
                            }
                        }
                    } else {
                        self.finish = true;
                    }
                }
            }
        }
    }

    fn get_latency(&mut self, start: usize, end: usize) -> u32 {
        if start == end {
            return 0;
        }
        let mut queue = VecDeque::from(vec![start]);
        let mut dis = HashMap::new();
        dis.insert(start, 0);

        while !queue.is_empty() {
            let cur = queue.pop_front().unwrap();
            let cur_dis = dis.get(&cur).unwrap().to_owned();
            if let Control::BeginIf(if_op) = &self.node[cur].clone() {
                let aligned_dis = self.get_aligned_latency(cur);
                queue.push_back(if_op.end);
                dis.insert(if_op.end, cur_dis + aligned_dis);
                if let Control::BeginIf(if_op) = &mut self.node[cur] {
                    if_op.latency = Some(aligned_dis);
                }
            } else {
                for edge in &self.graph[cur] {
                    if edge.to == end {
                        return edge.get_latency() + cur_dis;
                    }
                    if dis.get(&edge.to).is_none() {
                        queue.push_back(edge.to);
                        dis.insert(edge.to, cur_dis + edge.get_latency());
                    }
                }
            }
        }
        panic!("Latency Not Found")
    }

    fn get_aligned_latency(&mut self, node: usize) -> u32 {
        if let Control::BeginIf(if_op) = &self.node[node].clone() {
            let path0 = self.get_latency(self.graph[node][0].to, if_op.end);
            let path1 = if self.graph[node].len() == 1 {
                0
            } else {
                self.get_latency(self.graph[node][1].to, if_op.end)
            };
            if path0 > path1 {
                if self.graph[node].len() > 1 {
                    self.graph[node][1].edge_type =
                        String::from("static:") + &(path0 - path1).to_string();
                }
            } else if path0 < path1 {
                self.graph[node][0].edge_type =
                    String::from("static:") + &(path1 - path0).to_string();
            }

            max(path0, path1)
        } else {
            panic!("Latency Not Found")
        }
    }

    fn drop(&mut self, env: &mut Vec<Env>) -> STEP {
        if self.stages.len() > 1 {
            let first_stage = self.stages.first().unwrap();
            if first_stage.0 == self.end {
                self.stages.remove(0);
                env.remove(0);
            }
        } else {
            let first_stage = self.stages.first().unwrap();
            if first_stage.0 == self.end {
                return self.step_one_stage(0, env);
            }
        }
        STEP::Nothing
    }
}

#[derive(Debug, Clone)]
enum Control {
    BeginFor(ForOp),
    EndFor(ForOp, Option<YieldOp>, usize),
    BeginIf(IfOp),
    Return(ReturnOp),
    Call(CallOp),
    Normal,
}

#[derive(Debug, Clone)]
enum STEP {
    Nothing,
    Count(u32),
    Return(Vec<VALUE>),
    Call(String, Vec<VALUE>),
}

impl TimeGraph {
    fn new(ir: &Value) -> Self {
        let timegraph = &ir["graph"];
        let start = timegraph["start"].as_u64().unwrap() as usize;
        let end = timegraph["end"].as_u64().unwrap() as usize;
        let mut graph = TimeGraph {
            start,
            end,
            current: (start, 0),
            graph: vec![Vec::new(); end as usize + 1],
            node: vec![Control::Normal; end as usize + 1],
            if_node: vec![None; end as usize + 1],
            name: ir["name"].as_str().unwrap().to_string(),
        };
        for edge in timegraph["edge"].as_array().unwrap() {
            graph.add_edge(edge)
        }
        graph
    }

    fn add_edge(&mut self, ir: &Value) {
        let edge = Edge::new(&ir);
        let from = ir["from"].as_u64().unwrap() as usize;
        self.graph[from].push(edge)
    }

    fn add_operation(&mut self, start: usize, end: usize, op: Operation) {
        let mut queue = VecDeque::from(vec![start]);
        let mut vis = HashSet::new();

        while !queue.is_empty() {
            let cur = queue.pop_front().unwrap();
            vis.insert(cur);
            for edge in &mut self.graph[cur] {
                if edge.to == end {
                    match op.clone() {
                        Operation::Read(read) => edge.stream.push(StreamOperation::Read(read)),
                        Operation::Write(write) => edge.stream.push(StreamOperation::Write(write)),
                        _ => (),
                    };
                    edge.ops.push(op);
                    return;
                }
                if vis.get(&edge.to).is_none() {
                    queue.push_back(edge.to);
                }
            }
        }
        panic!("{:?}", op);
    }

    fn insert_time(&mut self, ir: &Value, op: Operation) {
        let start = ir["start"].as_u64().unwrap() as usize;
        let end = ir["end"].as_u64().unwrap() as usize;
        for edge in &mut self.graph[start] {
            if edge.to == end {
                match op.clone() {
                    Operation::Read(read) => edge.stream.push(StreamOperation::Read(read)),
                    Operation::Write(write) => edge.stream.push(StreamOperation::Write(write)),
                    _ => (),
                };
                edge.ops.push(op);
                return;
            }
        }
        self.add_operation(start, end, op);
    }

    fn bind_operation(&mut self, ir: &Value) {
        match ir["op_type"].as_str().unwrap() {
            "for" => {
                let start = ir["start"].as_u64().unwrap() as usize;
                let end = ir["end"].as_u64().unwrap() as usize;
                let for_op = ForOp::new(&ir);
                self.node[start] = Control::BeginFor(for_op.clone());
                self.node[end] = Control::EndFor(for_op.clone(), None, 0);
                for edge in &mut self.graph[start] {
                    if edge.edge_type != "static-for" {
                        edge.ops.push(Operation::For(for_op));
                        break;
                    }
                }
                ir["body"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .for_each(|x| self.bind_operation(x));
            }
            "if" => {
                let start = ir["start"].as_u64().unwrap() as usize;
                let end = ir["end"].as_u64().unwrap() as usize;
                let if_op = IfOp::new(&ir);
                self.node[start] = Control::BeginIf(if_op.clone());
                self.if_node[end] = Some((if_op.clone(), vec![], false));
                ir["body0"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .for_each(|x| self.bind_operation(x));
                ir["body1"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .for_each(|x| self.bind_operation(x));
            }
            "return" => {
                let time = ir["time"].as_u64().unwrap() as usize;
                self.node[time] = Control::Return(ReturnOp::new(&ir));
            }
            "yield" => {
                let time = ir["time"].as_u64().unwrap() as usize;
                if let Some((_, op, _)) = &mut self.if_node[time] {
                    if op.len() < 2 {
                        op.push(YieldOp::new(&ir));
                        return;
                    }
                }
                if let Control::EndFor(_, op, start) = &mut self.node[time] {
                    *op = Some(YieldOp::new(&ir));
                    *start = ir["jump"].as_u64().unwrap() as usize;
                }
            }
            "call" => {
                let time = ir["start"].as_u64().unwrap() as usize;
                self.node[time] = Control::Call(CallOp::new(&ir));
            }
            "load" => self.insert_time(ir, Operation::Load(LoadOp::new(&ir))),
            "store" => self.insert_time(ir, Operation::Store(StoreOp::new(&ir))),
            "read" => self.insert_time(ir, Operation::Read(ReadOp::new(&ir))),
            "write" => self.insert_time(ir, Operation::Write(WriteOp::new(&ir))),
            _ => self.insert_time(ir, Operation::Compute(Computation::new(&ir))),
        }
    }

    fn get_call(&mut self, values: Vec<VALUE>, env: &mut Env) {
        if let Control::Call(call_op) = &self.node[self.current.0] {
            for (name, value) in zip(&call_op.names, values) {
                env.set_value(name, value);
            }
            self.current = (self.graph[self.current.0][0].to, 0);
        }
    }

    fn step(&mut self, mini: bool, env: &mut Env) -> STEP {
        let cur = self.current;
        if let Some((if_op, yield_op, flag)) = &mut self.if_node[cur.0] {
            if cur.1 == 0 {
                let cond = env.get_value(&if_op.condition);
                let branch = if let VALUE::Bool(true) = cond { 0 } else { 1 };
                if yield_op.len() > 1 {
                    let values = yield_op[branch]
                        .operands
                        .iter()
                        .map(|x| env.get_value(x))
                        .collect::<Vec<VALUE>>();
                    for (name, value) in zip(&if_op.names, values) {
                        env.set_value(&name, value);
                    }
                }
                *flag = true;
                // return STEP::Nothing;
            } /* else {
                  *flag = false;
              }*/
        }
        match &self.node[cur.0] {
            Control::Normal => {
                let edge = &self.graph[cur.0][0];
                /*if edge.ops.len() == 0 {
                    self.current = (edge.to, 0);
                    return self.step(mini, env);
                } else */
                if edge.check_stream() {
                    if mini {
                        self.current.1 += 1;
                    }
                    if (!mini) || (self.current.1 == edge.get_latency()) {
                        let last_cycle = self.current.1;
                        for op in &edge.ops {
                            // println!("{:?}", op);
                            op.eval(env);
                        }
                        self.current = (edge.to, 0);
                        if !mini {
                            return STEP::Count(edge.get_latency() - last_cycle);
                        }
                    }
                }
                STEP::Nothing
            }
            Control::BeginFor(for_op) => {
                let lb = env.get_value(&for_op.lb);
                let ub = env.get_value(&for_op.ub);
                if let VALUE::Bool(true) = cmp_lte(vec![lb, ub].as_ref()) {
                    env.set_value(&for_op.iter_name, lb);
                    for (arg, init) in zip(&for_op.iter_args, &for_op.iter_inits) {
                        env.set_value(arg, env.get_value(init));
                    }
                    for edge in &self.graph[cur.0] {
                        if edge.edge_type != "static-for" {
                            self.current = (edge.to, 0);
                            break;
                        }
                    }
                } else {
                    for edge in &self.graph[cur.0] {
                        if edge.edge_type == "static-for" {
                            self.current = (edge.to, 0);
                            break;
                        }
                    }
                }
                STEP::Nothing
            }
            Control::BeginIf(if_op) => {
                let cond = env.get_value(&if_op.condition);
                if let VALUE::Bool(true) = cond {
                    self.current = (self.graph[cur.0][0].to, 0);
                    // return self.step(mini, env);
                } else {
                    if self.graph[cur.0].len() == 1 {
                        self.current = (if_op.end, 0);
                    } else {
                        self.current = (self.graph[cur.0][1].to, 0);
                    }
                    // return self.step(mini, env);
                }
                STEP::Nothing
            }
            Control::Call(call_op) => STEP::Call(
                call_op.function.clone(),
                call_op
                    .operands
                    .iter()
                    .map(|op| env.get_value(op))
                    .collect(),
            ),
            Control::EndFor(for_op, yield_op, start) => {
                if mini && self.current.1 == 0 {
                    self.current.1 += 1;
                    return STEP::Nothing;
                }

                let cycle = self.current.1;
                let values = yield_op
                    .as_ref()
                    .unwrap()
                    .operands
                    .iter()
                    .map(|x| env.get_value(x))
                    .collect::<Vec<VALUE>>();
                let iter_type = env.get_value(&for_op.lb).get_type();
                let iter_name = env.get_value(&for_op.iter_name);
                let step = env.get_value(&for_op.step);
                let new_iter = add(&iter_type, vec![iter_name, step].as_ref());
                let ub = env.get_value(&for_op.ub);
                if let VALUE::Bool(true) = cmp_lte(vec![new_iter, ub].as_ref()) {
                    env.set_value(&for_op.iter_name, new_iter);
                    for (arg, value) in zip(&for_op.iter_args, values) {
                        env.set_value(arg, value);
                    }
                    for edge in &self.graph[*start] {
                        if edge.edge_type != "static-for" {
                            self.current = (edge.to, 0);
                            break;
                        }
                    }
                } else {
                    for (name, value) in zip(&for_op.names, values) {
                        env.set_value(&name, value);
                    }
                    for edge in &self.graph[*start] {
                        if edge.edge_type == "static-for" {
                            self.current = (edge.to, 0);
                            break;
                        }
                    }
                }
                STEP::Count(2 - cycle)
            }
            Control::Return(return_op) => STEP::Return(
                return_op
                    .operands
                    .iter()
                    .map(|op| env.get_value(op))
                    .collect(),
            ),
        }
    }

    fn mark(&self, mini: bool) -> bool {
        let cur = self.current;

        match &self.node[cur.0] {
            Control::Normal => {
                let edge = &self.graph[cur.0][0];
                if (!mini) || (self.current.1 + 1 == edge.get_latency()) {
                    for op in &edge.ops {
                        if op.mark() {
                            return true;
                        }
                    }
                }
                false
            }
            Control::BeginFor(for_op) => {
                let names = &for_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            Control::BeginIf(if_op) => {
                let names = &if_op.names;
                for name in names {
                    if test_breakpoint(name) {
                        return true;
                    }
                }
                false
            }
            Control::Call(call_op) => {
                let names = &call_op.names;
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
}

#[derive(Debug, Clone)]
struct Env {
    variable: HashMap<String, VALUE>,
}

impl IsEnv for Env {
    fn get_value(&self, var: &String) -> VALUE {
        // println!("{}", var);
        if let Some(val) = self.variable.get(var) {
            val.clone()
        } else {
            unsafe { &*CONSTANT }.get(var).unwrap().clone()
        }
    }

    fn set_value(&mut self, var: &String, value: VALUE) {
        self.variable.insert(var.to_owned(), value);
    }

    fn get_all_value(&self, ops: &Vec<String>) -> Vec<VALUE> {
        ops.iter().map(|x| self.get_value(x)).collect()
    }
}

impl Env {
    fn new() -> Self {
        Env {
            variable: HashMap::new(),
        }
    }
}

#[derive(Debug, Clone)]
struct Function {
    strategy: Strategy,
    args: Vec<String>,
    types: Vec<String>,
    name: String,
}

impl Function {
    fn new(ir: &Value) -> Self {
        let strategy = match ir["strategy"].as_str().unwrap() {
            "static" => {
                let mut graph = TimeGraph::new(&ir);
                ir["body"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .for_each(|x| graph.bind_operation(x));
                Strategy::Static(graph)
            }
            "dynamic" => Strategy::Dynamic,
            "dataflow" => {
                assert!(ir["types"].as_array().unwrap().is_empty());
                assert!(ir["ret_types"].as_array().unwrap().is_empty());
                Strategy::Dataflow(
                    ir["body"]
                        .as_array()
                        .unwrap()
                        .iter()
                        .filter(|x| x["op_type"].as_str().unwrap() == "call")
                        .map(|x| x["function"].as_str().unwrap().to_string())
                        .collect(),
                )
            }
            str => {
                let mut graph = TimeGraph::new(&ir);
                ir["body"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .for_each(|x| graph.bind_operation(x));
                let string = str.split(" ").collect::<Vec<&str>>();
                if string[1] == "for" {
                    Strategy::PipelineFor(graph, string[2].parse::<u32>().unwrap())
                } else {
                    Strategy::PipelineFunc(string[2].parse::<u32>().unwrap())
                }
            }
        };
        Function {
            strategy: strategy,
            args: construct(&ir["args"]),
            types: construct(&ir["types"]),
            name: ir["name"].as_str().unwrap().to_string(),
        }
    }
}

#[derive(Debug)]
struct StaticInstance {
    graph: TimeGraph,
    env: Env,
    active: bool,
}

#[derive(Debug)]
struct PipeForInstance {
    graph: PipelineTimeGraph,
    env: Vec<Env>,
    ii: u32,
    active: bool,
}

impl PipeForInstance {
    fn step(&mut self) -> STEP {
        let mut step: STEP = self.graph.step(&mut self.env, self.ii);
        if let STEP::Nothing = step {
            step = self.graph.drop(&mut self.env);
        }
        step
    }
}

#[derive(Debug)]
enum Instance {
    Static(StaticInstance, Option<Arc<RefCell<Instance>>>),
    PipeFor(PipeForInstance, Option<Arc<RefCell<Instance>>>),
}

impl Instance {
    fn step(&mut self, mini: bool) -> STEP {
        // println!("BEGIN STEP");
        match self {
            Instance::Static(instance, _) => instance.graph.step(mini, &mut instance.env),
            Instance::PipeFor(instance, _) => instance.step(),
        }
    }

    fn get_call(&mut self, values: Vec<VALUE>) {
        match self {
            Instance::Static(instance, _) => instance.graph.get_call(values, &mut instance.env),
            Instance::PipeFor(_instance, _) => panic!("Call in PipeFor"),
        }
    }

    fn is_active(&self) -> bool {
        match self {
            Instance::Static(instance, _) => instance.active,
            Instance::PipeFor(instance, _) => instance.active,
        }
    }

    fn set_active(&mut self, flag: bool) {
        match self {
            Instance::Static(instance, _) => {
                instance.active = flag;
            }
            Instance::PipeFor(instance, _) => {
                instance.active = flag;
            }
        }
    }

    fn mark(&self, mini: bool) -> bool {
        match self {
            Instance::Static(instance, _) => instance.graph.mark(mini),
            Instance::PipeFor(instance, _) => instance.graph.mark(),
        }
    }
}

use std::cell::RefCell;
use std::sync::Arc;

static mut MEMORY: *mut HashMap<String, Memory> = std::ptr::null_mut();
static mut STREAM: *mut HashMap<String, Stream> = std::ptr::null_mut();
static mut ACTIVE: *mut Vec<Arc<RefCell<Instance>>> = std::ptr::null_mut();
// static mut STALL: *mut Vec<Arc<RefCell<Instance>>> = std::ptr::null_mut();
static mut FUNCTION: *mut HashMap<String, Function> = std::ptr::null_mut();
static mut CONSTANT: *mut HashMap<String, VALUE> = std::ptr::null_mut();

static mut EQUALPOINT: *mut HashSet<String> = std::ptr::null_mut();
static mut EQUALVALUE: *mut HashMap<String, VALUE> = std::ptr::null_mut();

pub fn set_equalpoint(b: String) {
    unsafe { &mut (*EQUALPOINT) }.insert(b);
}

pub fn have_equalpoint() -> bool {
    !unsafe { &*EQUALPOINT }.is_empty()
}

pub fn contain_equalpoint(a: &String) -> bool {
    unsafe { &*EQUALPOINT }.contains(a)
}

pub fn parse_tor(ir: &Value) -> Result<(), Box<dyn Error>> {
    unsafe {
        init_global(&mut ACTIVE);
        // init_global(&mut STALL);
        init_global(&mut FUNCTION);
        init_global(&mut MEMORY);
        init_global(&mut STREAM);
        init_global(&mut CONSTANT);

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
                    "f32" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::F32(0.0); size as usize]),
                    ),
                    "f64" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::F64(0.0); size as usize]),
                    ),
                    "bool" => (*MEMORY).insert(
                        String::from(name),
                        Memory::new(vec![VALUE::Bool(false); size as usize]),
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
            unsafe {
                (*STREAM).insert(String::from(name), Stream::new(depth as usize));
            }
        }
    }
    if let Value::Array(constants) = &ir["constants"] {
        for constant in constants {
            let constant = Constant::new(&constant);
            unsafe { &mut *CONSTANT }.insert(
                constant.name,
                build_value(&constant.ret_type, &constant.value),
            );
        }
    }
    if let Value::Array(modules) = &ir["modules"] {
        for module in modules {
            unsafe {
                (*FUNCTION).insert(
                    String::from(module["name"].as_str().unwrap()),
                    Function::new(&module),
                );
            }
        }
    }
    Ok(())
}

pub fn call_function(function_name: &str, args: &[&str]) -> Result<(), String> {
    println!("Call {} with arguments: {:?}", function_name, args);
    let function = unsafe { (*FUNCTION).get(&String::from(function_name)) };
    match function {
        None => Err(String::from("!!Undefined function")),
        Some(module) => {
            let mut env = Env::new();
            for ((arg, arg_type), value) in zip(zip(&module.args, &module.types), args) {
                env.set_value(arg, build_value(arg_type, &String::from(value.to_owned())))
            }
            match &module.strategy {
                Strategy::Static(graph) => {
                    let new_module = StaticInstance {
                        graph: graph.clone(),
                        active: true,
                        env,
                    };
                    let instance = Instance::Static(new_module, None);
                    unsafe { &mut (*ACTIVE) }.push(Arc::new(RefCell::new(instance)));
                }
                Strategy::PipelineFor(graph, ii) => {
                    let mut instance = PipeForInstance {
                        graph: PipelineTimeGraph::new(graph),
                        env: vec![],
                        ii: *ii,
                        active: true,
                    };
                    instance.env.push(env);
                    unsafe { &mut (*ACTIVE) }
                        .push(Arc::new(RefCell::new(Instance::PipeFor(instance, None))));
                }
                Strategy::Dataflow(functions) => {
                    println!("{:#?}", module);
                    for function in functions {
                        call_function(function, &[]);
                    }
                }
                _ => (),
            }
            Ok(())
        }
    }
}

pub fn show_variable(vars: &[&str]) {
    println!("!!SHOW VALUE:");
    if vars.len() == 0 {
        for instance in unsafe { &(*ACTIVE) }.iter() {
            match &*(instance.borrow()) {
                Instance::Static(instance, _) => {
                    for var in &instance.env.variable {
                        println!("\t{} {:?}", var.0, var.1);
                    }
                }
                Instance::PipeFor(instance, _) => {
                    for (index, env) in instance.env.iter().enumerate() {
                        println!("\tStage {} at {:?}:", index, instance.graph.stages[index]);
                        for var in &env.variable {
                            println!("\t\t{} {:?}", var.0, var.1);
                        }
                    }
                }
            }
        }
    } else {
        for instance in unsafe { &(*ACTIVE) }.iter() {
            match &*(instance.borrow()) {
                Instance::Static(instance, _) => {
                    for var in vars {
                        let wrap = instance.env.variable.get(*var);
                        if let Some(value) = wrap {
                            println!("\t{} {:?}", var, value);
                        }
                    }
                }
                Instance::PipeFor(instance, _) => {
                    for (index, env) in instance.env.iter().enumerate() {
                        println!("\tStage {} at {:?}:", index, instance.graph.stages[index]);
                        for var in vars {
                            let wrap = env.variable.get(*var);
                            if let Some(value) = wrap {
                                println!("\t{} {:?}", var, value);
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn load_memory(memory: &str, store: &[&str]) {
    let memory = unsafe { (*MEMORY).get_mut(memory).unwrap() };
    memory.set(store)
}

pub fn show_memory(memorys: &[&str]) {
    println!("!!SHOW MEMORY:");
    if memorys.len() == 0 {
        for (mem, value) in unsafe { &(*MEMORY) }.iter() {
            println!("\t{} {:?}", mem, value)
        }
        for (stream, value) in unsafe { &(*STREAM) }.iter() {
            println!("\t{} {:?}", stream, value)
        }
    } else {
        for name in memorys {
            if let Some(store) = unsafe { &(*MEMORY) }.get(*name) {
                println!("\t{} {:?}", name, store);
            }
            if let Some(store) = unsafe { &(*STREAM) }.get(*name) {
                println!("\t{} {:?}", name, store);
            }
        }
    }
}

fn get_mem_value(var: &String, index: usize) -> VALUE {
    unsafe { &(*MEMORY) }.get(var).unwrap().get_value(index)
}

fn set_mem_value(var: &String, index: usize, value: VALUE) {
    unsafe { &mut (*MEMORY) }
        .get_mut(var)
        .unwrap()
        .update(index, value.clone());
}

fn pop_stream_value(var: &String) -> VALUE {
    unsafe { &mut (*STREAM) }.get_mut(var).unwrap().pop()
}

fn stream_empty(var: &String) -> bool {
    unsafe { &(*STREAM) }.get(var).unwrap().is_empty()
}

fn stream_full(var: &String) -> bool {
    unsafe { &(*STREAM) }.get(var).unwrap().is_full()
}

fn push_stream_value(var: &String, value: VALUE) {
    unsafe { &mut (*STREAM) }.get_mut(var).unwrap().push(value)
}

pub fn step(depth: usize, breakpoint: bool) -> bool {
    let mut cycle = 0;
    while cycle < depth {
        if unsafe { &(*ACTIVE) }.is_empty() {
            if breakpoint {
                println!("Cycle count: {}", cycle);
            }
            return false;
        }

        let mut mini = false;
        if unsafe { &mut (*ACTIVE) }.len() > 1 {
            mini = true;
        } else {
            for instance_ref in unsafe { &mut (*ACTIVE) } {
                let instance = instance_ref.borrow();
                if let Instance::PipeFor(_, _) = &*instance {
                    mini = true;
                    break;
                }
            }
        }

        if breakpoint {
            for instance_ref in unsafe { &mut (*ACTIVE) } {
                let instance = instance_ref.borrow();
                if instance.mark(mini) {
                    println!("Break with cycle count: {}", cycle);
                    return false;
                }
            }
        }
        cycle += 1;

        unsafe { &mut (*ACTIVE) }.drain(..).for_each(|instance| {
            let step = instance.borrow_mut().step(true);
            match step {
                STEP::Return(values) => {
                    // println!("ToR Return: {:?}", values);
                    let mut caller = instance.borrow_mut();
                    match &mut (*caller) {
                        Instance::Static(_, father) => match father {
                            None => (),
                            Some(father_ptr) => {
                                let mut father = father_ptr.borrow_mut();
                                father.get_call(values);
                                if !father.is_active() {
                                    father.set_active(true);
                                    unsafe { &mut (*ACTIVE) }.push(father_ptr.clone());
                                }
                            }
                        },
                        Instance::PipeFor(_, father) => match father {
                            None => (),
                            Some(father_ptr) => {
                                let mut father = father_ptr.borrow_mut();
                                father.get_call(values);
                                if !father.is_active() {
                                    father.set_active(true);
                                    unsafe { &mut (*ACTIVE) }.push(father_ptr.clone());
                                }
                            }
                        },
                    }
                }
                STEP::Call(function, args) => {
                    let module = unsafe { &(*FUNCTION) }.get(&function).unwrap();
                    let mut env = Env::new();
                    for (arg, value) in zip(&module.args, args) {
                        env.set_value(arg, value)
                    }
                    instance.borrow_mut().set_active(false);
                    match &module.strategy {
                        Strategy::Static(graph) => {
                            let new_module = StaticInstance {
                                graph: graph.clone(),
                                active: true,
                                env,
                            };
                            unsafe { &mut (*ACTIVE) }.push(Arc::new(RefCell::new(
                                Instance::Static(new_module, Some(instance)),
                            )));
                        }
                        Strategy::PipelineFor(graph, ii) => {
                            let mut pipe_for = PipeForInstance {
                                graph: PipelineTimeGraph::new(graph),
                                env: vec![],
                                ii: *ii,
                                active: true,
                            };
                            pipe_for.env.push(env);
                            unsafe { &mut (*ACTIVE) }.push(Arc::new(RefCell::new(
                                Instance::PipeFor(pipe_for, Some(instance)),
                            )));
                        }
                        _ => (),
                    }
                }
                STEP::Count(count) => {
                    cycle = cycle + (count - 1) as usize;
                    unsafe { &mut (*ACTIVE) }.push(instance)
                }
                _ => unsafe { &mut (*ACTIVE) }.push(instance),
            }
        });
        if unsafe { !(*get_watchpoint()).is_empty() } {
            for instance in unsafe { &(*ACTIVE) }.iter() {
                match &*(instance.borrow()) {
                    Instance::Static(instance, _) => {
                        for var in unsafe { &*get_watchpoint() } {
                            let wrap: Option<&VALUE> = instance.env.variable.get(var);
                            if let Some(value) = wrap {
                                println!("{} in {}: {:?}", var, instance.graph.name, value);
                            }
                        }
                    }
                    Instance::PipeFor(instance, _) => {
                        for (index, env) in instance.env.iter().enumerate() {
                            for var in unsafe { &*get_watchpoint() } {
                                let wrap = env.variable.get(var);
                                if let Some(value) = wrap {
                                    println!(
                                        "\t{} in Stage {} at {:?} of {}: {:?}",
                                        var,
                                        index,
                                        instance.graph.stages[index],
                                        instance.graph.name,
                                        value
                                    );
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    true
}

pub fn show_active() {
    for instance_ref in unsafe { &(*ACTIVE) }.iter() {
        let instance = instance_ref.borrow();
        match &*instance {
            Instance::Static(instance, _) => {
                let cur = instance.graph.current;
                if let Some((_, _, flag)) = &instance.graph.if_node[cur.0] {
                    println!("Function {}: {:?} {}", instance.graph.name, cur, flag);
                } else {
                    println!("Function {}: {:?}", instance.graph.name, cur);
                }
            }
            Instance::PipeFor(instance, _) => println!(
                "Function {}: {:?}",
                instance.graph.name, instance.graph.stages
            ),
        }
    }
}

pub fn show_stall() {
    // for instance in unsafe { &(*STALL) }.iter() {
    //     println!("{:#?}", instance);
    // }
}

pub fn execute_continue() {
    step(100000000000, true);
}

pub fn finish() -> bool {
    unsafe { &(*ACTIVE) }.is_empty()
}

pub fn get_equalvalue() -> *mut HashMap<String, VALUE> {
    unsafe { EQUALVALUE }
}
