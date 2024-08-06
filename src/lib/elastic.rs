use std::{collections::VecDeque, iter::zip, vec};

use super::basetype::*;
use downcast_rs::{impl_downcast, DowncastSync};
use set_value_derive::SetValue;

pub trait SetValue {
    fn set_value(&mut self, port: &str, val: HandshakeValue);
    fn get_value(&mut self, port: &str) -> HandshakeValue;
    fn is_valid(&self) -> bool;
}

pub trait IsHandshake: std::fmt::Debug + SetValue + DowncastSync {
    fn init(&mut self) {}
    fn propagate(&mut self) -> Vec<String> {
        vec![]
    }
    fn update(&mut self) -> bool {
        false
    }
}
impl_downcast!(sync IsHandshake);

pub trait New {
    fn new() -> Self;
}

#[derive(Debug, SetValue)]
pub struct Empty {}

impl IsHandshake for Empty {}

#[derive(Debug)]
struct Join {
    data_in: Vec<HandshakeValue>,
    data_out: HandshakeValue,
}

impl Join {
    fn new() -> Self {
        Self {
            data_in: vec![HandshakeValue::empty(); 2],
            data_out: HandshakeValue::empty(),
        }
    }

    fn set(size: usize) -> Self {
        Self {
            data_in: vec![HandshakeValue::empty(); size],
            data_out: HandshakeValue::empty(),
        }
    }

    fn propagate(&mut self) {
        self.data_out.valid = self
            .data_in
            .iter()
            .fold(true, |acc, data| acc && data.valid);

        for idx in 0..self.data_in.len() {
            self.data_in[idx].ready = self
                .data_in
                .iter()
                .enumerate()
                .filter(|f| f.0 != idx)
                .fold(self.data_out.ready, |acc, data| acc && data.1.valid);
        }
    }
}

#[derive(Debug, Clone)]
struct Reg {
    enable: Option<bool>,
    value: VALUE,
    new_value: VALUE,
}

impl Reg {
    fn new() -> Reg {
        Reg {
            enable: None,
            value: VALUE::ERROR,
            new_value: VALUE::ERROR,
        }
    }

    fn init(val: VALUE) -> Reg {
        Reg {
            enable: None,
            value: val,
            new_value: VALUE::ERROR,
        }
    }

    fn set_value(&mut self, val: VALUE) {
        self.enable = Some(true);
        self.new_value = val;
    }

    fn get_value(&self) -> VALUE {
        self.value
    }

    fn set_enable(&mut self, enable: bool, val: VALUE) {
        self.enable = Some(enable);
        self.new_value = val;
    }
}

impl Reg {
    fn update(&mut self) -> bool {
        match self.enable {
            Some(true) => {
                let flag = self.value != self.new_value;
                self.value = self.new_value;
                self.new_value = VALUE::ERROR;
                self.enable = None;
                flag
            }
            _ => {
                self.new_value = VALUE::ERROR;
                self.enable = None;
                false
            }
        }
    }
}

#[derive(Debug)]
struct TEHB {
    data_in: HandshakeValue,
    data_out: HandshakeValue,
    full_reg: Reg,
    data_reg: Reg,
}

impl TEHB {
    fn new() -> Self {
        Self {
            data_in: HandshakeValue::empty(),
            data_out: HandshakeValue::empty(),
            full_reg: Reg::new(),
            data_reg: Reg::new(),
        }
    }

    fn get_ready(&self) -> bool {
        !self.full_reg.get_value().as_bool()
    }

    fn init(&mut self) {
        self.full_reg = Reg::init(VALUE::Bool(false));
        self.data_reg = Reg::init(VALUE::U32(0));
        self.propagate();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let full_reg = self.full_reg.get_value().as_bool();
        if self.data_in.set_ready(!full_reg) {
            update_list.push("data_in".to_string());
        }
        let reg_en = self.data_in.ready & self.data_in.valid & !self.data_out.ready;
        self.data_reg.set_enable(reg_en, self.data_in.data);
        if self.data_out.set_valid(
            self.data_in.valid | full_reg,
            if full_reg {
                self.data_reg.get_value()
            } else {
                self.data_in.data
            },
        ) {
            update_list.push("data_out".to_string());
        }
        self.full_reg
            .set_value(VALUE::Bool(self.data_out.valid & (!self.data_out.ready)));
        update_list
    }

    fn update(&mut self) -> bool {
        self.full_reg.update() | self.data_reg.update()
    }
}

#[derive(Debug)]
struct OEHB {
    data_in: HandshakeValue,
    data_out: HandshakeValue,
    full_reg: Reg,
    data_reg: Reg,
}

impl OEHB {
    fn new() -> Self {
        Self {
            data_in: HandshakeValue::empty(),
            data_out: HandshakeValue::empty(),
            full_reg: Reg::new(),
            data_reg: Reg::new(),
        }
    }

    fn get_ready(&self, out_ready: bool) -> bool {
        (!self.full_reg.get_value().as_bool()) | out_ready
    }

    fn init(&mut self) {
        self.full_reg = Reg::init(VALUE::Bool(false));
        self.data_reg = Reg::init(VALUE::U32(0));
        self.propagate();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let full_reg = self.full_reg.get_value().as_bool();
        if self.data_in.set_ready((!full_reg) | self.data_out.ready) {
            update_list.push("data_in".to_string());
        }
        let reg_en = self.data_in.ready & self.data_in.valid;
        self.data_reg.set_enable(reg_en, self.data_in.data);
        self.full_reg
            .set_value(VALUE::Bool(self.data_in.valid | (!self.data_in.ready)));
        if self.data_out.set_valid(full_reg, self.data_reg.get_value()) {
            update_list.push("data_out".to_string());
        }
        update_list
    }

    fn update(&mut self) -> bool {
        self.full_reg.update() | self.data_reg.update()
    }
}

#[derive(Debug, SetValue)]
pub struct ElasticBuffer {
    pub data_in: HandshakeValue,
    pub data_out: HandshakeValue,
    tehb: TEHB,
    oehb: OEHB,
}

impl ElasticBuffer {
    pub fn set() -> Self {
        let mut buffer = ElasticBuffer::new();
        buffer.init();
        buffer
    }
}

impl IsHandshake for ElasticBuffer {
    fn init(&mut self) {
        self.tehb.init();
        self.oehb.init();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let new_ready = self.oehb.get_ready(self.data_out.ready);
        if self.tehb.data_in.set_valid_from(self.data_in) | self.tehb.data_out.set_ready(new_ready)
        {
            self.tehb.propagate();
        }
        if self.oehb.data_out.set_ready_from(self.data_out)
            | self.oehb.data_in.set_valid_from(self.tehb.data_out)
        {
            self.oehb.propagate();
        }
        assert_eq!(new_ready, self.oehb.data_in.ready);

        if self.data_in.set_ready_from(self.tehb.data_in) {
            update_list.push("data_in".to_string());
        }
        if self.data_out.set_valid_from(self.oehb.data_out) {
            update_list.push("data_out".to_string());
        }

        update_list
    }

    fn update(&mut self) -> bool {
        let mut flag = false;
        if self.tehb.update() {
            self.tehb.propagate();
            flag = true;
        }
        if self.oehb.update() {
            self.oehb.propagate();
            flag = true;
        }
        flag
    }
}

#[derive(Debug, SetValue)]
pub struct Merge {
    pub data_in: Vec<HandshakeValue>,
    pub data_out: HandshakeValue,
    tehb: TEHB,
}

impl IsHandshake for Merge {
    fn init(&mut self) {
        self.tehb.init();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let mut tmp_data_out = VALUE::ERROR;
        let mut tmp_valid = false;

        for data in &self.data_in {
            if data.valid {
                tmp_data_out = data.data;
                tmp_valid = true;
                break;
            }
        }

        if self.tehb.data_in.set_valid(tmp_valid, tmp_data_out)
            | self.tehb.data_out.set_ready_from(self.data_out)
        {
            self.tehb.propagate();
        }
        if self.data_out.set_valid_from(self.tehb.data_out) {
            update_list.push("data_out".to_string());
        }

        self.data_in.iter_mut().enumerate().for_each(|(idx, data)| {
            if data.set_ready_from(self.tehb.data_in) {
                update_list.push("data_in.".to_string() + &idx.to_string())
            }
        });

        update_list
    }

    fn update(&mut self) -> bool {
        if self.tehb.update() {
            self.tehb.propagate();
            true
        } else {
            false
        }
    }
}

#[derive(Debug, SetValue)]
pub struct MergeNoTehb {
    pub data_in: Vec<HandshakeValue>,
    pub data_out: HandshakeValue,
}

impl MergeNoTehb {
    pub fn set(size: usize) -> Self {
        let mut unit = Self::new();
        unit.data_in = vec![HandshakeValue::empty(); size];
        unit
    }
}

impl IsHandshake for MergeNoTehb {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        let mut tmp_data_out = VALUE::ERROR;
        let mut tmp_valid = false;

        for data in &self.data_in {
            if data.valid {
                tmp_data_out = data.data;
                tmp_valid = true;
                break;
            }
        }

        self.data_in.iter_mut().enumerate().for_each(|(idx, data)| {
            if data.set_ready_from(self.data_out) {
                update_list.push("data_in.".to_string() + &idx.to_string())
            }
        });

        if self.data_out.set_valid(tmp_valid, tmp_data_out) {
            update_list.push("data_out".to_string())
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct Branch {
    pub data_in: HandshakeValue,
    pub data_out: Vec<HandshakeValue>,
    pub condition: HandshakeValue,
    join: Join,
}

impl Branch {
    pub fn set() -> Self {
        let mut branch = Branch::new();
        branch.data_out = vec![HandshakeValue::empty(); 2];
        branch.join.propagate();
        branch
    }
}

impl IsHandshake for Branch {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let condition = self.condition.data.as_bool();
        if self.join.data_in[0].set_valid_only(self.condition)
            | self.join.data_in[1].set_valid_only(self.data_in)
            | self.join.data_out.set_ready(
                (self.data_out[1].ready & !condition) | (self.data_out[0].ready & condition),
            )
        {
            self.join.propagate();
        }
        if self.data_out[0].set_valid(condition & self.join.data_out.valid, self.data_in.data) {
            update_list.push("data_out.0".to_string());
        }
        if self.data_out[1].set_valid((!condition) & self.join.data_out.valid, self.data_in.data) {
            update_list.push("data_out.1".to_string());
        }
        if self.condition.set_ready_from(self.join.data_in[0]) {
            update_list.push("condition".to_string());
        }
        if self.data_in.set_ready_from(self.join.data_in[1]) {
            update_list.push("data_in".to_string());
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct Fork {
    pub data_in: HandshakeValue,
    pub data_out: Vec<HandshakeValue>,
    sub_reg: Vec<Reg>,
}

impl Fork {
    pub fn set(size: usize) -> Self {
        let mut unit = Fork::new();
        unit.data_out = vec![HandshakeValue::empty(); size];
        unit.sub_reg = vec![Reg::init(VALUE::Bool(true)); size];
        unit.init();
        unit
    }

    fn get_ready(&self, data_out: &Vec<HandshakeValue>) -> bool {
        !zip(&self.sub_reg, data_out)
            .map(|(r, data)| r.get_value().as_bool() & !data.ready)
            .fold(false, |acc, data| acc || data)
    }
}

impl IsHandshake for Fork {
    fn init(&mut self) {
        for reg in &mut self.sub_reg {
            *reg = Reg::init(VALUE::Bool(true));
        }
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        let block_stop = self
            .sub_reg
            .iter()
            .enumerate()
            .map(|(idx, r)| {
                let reg = r.get_value().as_bool();
                if self.data_out[idx].set_valid(reg & self.data_in.valid, self.data_in.data) {
                    update_list.push("data_out.".to_string() + &idx.to_string());
                }
                reg & !self.data_out[idx].ready
            })
            .collect::<Vec<bool>>();
        let any_stop = block_stop.iter().fold(false, |acc, data| acc || *data);
        self.sub_reg
            .iter_mut()
            .zip(block_stop)
            .for_each(|(r, block_stop)| {
                r.set_value(VALUE::Bool(block_stop | (!(self.data_in.valid & any_stop))))
            });

        if self.data_in.set_ready(!any_stop) {
            update_list.push("data_in".to_string());
        }
        update_list
    }

    fn update(&mut self) -> bool {
        self.sub_reg
            .iter_mut()
            .map(|reg| reg.update())
            .fold(true, |acc, data| acc || data)
    }
}

#[derive(Debug, SetValue)]
pub struct ControlMerge {
    pub data_in: Vec<HandshakeValue>,
    pub data_out: HandshakeValue,
    pub condition: HandshakeValue,
    phi_c: MergeNoTehb,
    tehb: TEHB,
    fork_c: Fork,
}

impl ControlMerge {
    pub fn set() -> Self {
        let mut unit = Self::new();
        unit.data_in = vec![HandshakeValue::empty(); 2];
        unit.phi_c = MergeNoTehb::set(2);
        unit.fork_c = Fork::set(2);
        unit.init();
        unit
    }
}

impl IsHandshake for ControlMerge {
    fn init(&mut self) {
        self.tehb.full_reg = Reg::init(VALUE::Bool(false));
        self.tehb.data_reg = Reg::init(VALUE::Bool(false));
        self.tehb.propagate();
        self.fork_c.init();
        self.fork_c.propagate();
        self.phi_c.propagate();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        let phi_c_nready = self.tehb.get_ready();
        if self.phi_c.data_out.set_ready(phi_c_nready)
            | self.phi_c.data_in[0].set_valid_from(self.data_in[0])
            | self.phi_c.data_in[1].set_valid_from(self.data_in[1])
        {
            self.phi_c.propagate();
        }
        for idx in 0..2 {
            if self.data_in[idx].set_ready_from(self.phi_c.data_in[idx]) {
                update_list.push("data_in.".to_string() + &idx.to_string());
            }
        }

        let tehb_nready = self.fork_c.get_ready(&vec![self.condition, self.data_out]);
        if self.tehb.data_out.set_ready(tehb_nready)
            | self.tehb.data_in.set_valid(
                self.phi_c.data_out.valid,
                VALUE::Bool(!self.data_in[0].valid),
            )
        {
            self.tehb.propagate();
        }
        assert_eq!(phi_c_nready, self.tehb.data_in.ready);

        if self
            .fork_c
            .data_in
            .set_valid(self.tehb.data_out.valid, VALUE::Bool(true))
            | self.fork_c.data_out[0].set_ready_from(self.condition)
            | self.fork_c.data_out[1].set_ready_from(self.data_out)
        {
            self.fork_c.propagate();
        }
        assert_eq!(tehb_nready, self.fork_c.data_in.ready);

        if self
            .condition
            .set_valid(self.fork_c.data_out[0].valid, self.tehb.data_out.data)
        {
            update_list.push("condition".to_string());
        }
        if self
            .data_out
            .set_valid(self.fork_c.data_out[1].valid, self.tehb.data_out.data)
        {
            update_list.push("data_out".to_string());
        }

        update_list
    }

    fn update(&mut self) -> bool {
        let mut flag = false;
        if self.tehb.update() {
            flag = true;
            self.tehb.propagate();
        }
        if self.fork_c.update() {
            flag = true;
            self.fork_c.propagate();
        }
        flag
    }
}

#[derive(Debug, SetValue)]
pub struct MuxDynamic {
    pub data_in: Vec<HandshakeValue>,
    pub data_out: HandshakeValue,
    pub condition: HandshakeValue,
    tehb: TEHB,
}

impl MuxDynamic {
    pub fn set() -> Self {
        let mut unit = Self::new();
        unit.data_in = vec![HandshakeValue::empty(); 2];
        unit.init();
        unit
    }
}

impl IsHandshake for MuxDynamic {
    fn init(&mut self) {
        self.tehb.init();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        let mut tmp_data = VALUE::ERROR;
        let mut tmp_valid = false;
        let condition_idx = self.condition.data.as_u32() as usize;
        if self.condition.valid {
            if self.data_in[condition_idx].valid {
                tmp_data = self.data_in[condition_idx].data;
                tmp_valid = true;
            }
        }

        if self.tehb.data_in.set_valid(tmp_valid, tmp_data)
            | self.tehb.data_out.set_ready_from(self.data_out)
        {
            self.tehb.propagate();
        }

        if self.data_out.set_valid_from(self.tehb.data_out) {
            update_list.push("data_out".to_string());
        }

        self.data_in.iter_mut().enumerate().for_each(|(idx, data)| {
            let new_ready = (condition_idx == idx
                && self.condition.valid
                && data.valid
                && self.tehb.data_in.ready)
                || !data.valid;
            if data.set_ready(new_ready) {
                update_list.push("data_in.".to_string() + &idx.to_string());
            }
        });

        if self
            .condition
            .set_ready(!self.condition.valid || (tmp_valid && self.tehb.data_in.ready))
        {
            update_list.push("condition".to_string());
        }

        update_list
    }

    fn update(&mut self) -> bool {
        self.tehb.update()
    }
}

#[derive(Debug, SetValue)]
pub struct Select {
    pub data_in: Vec<HandshakeValue>,
    pub data_out: HandshakeValue,
    pub condition: HandshakeValue,
    join: Join,
}

impl Select {
    pub fn set() -> Self {
        let mut select = Select::new();
        select.data_in = vec![HandshakeValue::empty(); 2];
        select.join = Join::set(3);
        select.join.propagate();
        select
    }
}

impl IsHandshake for Select {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        if self.join.data_in[0].set_valid_only(self.data_in[0])
            | self.join.data_in[1].set_valid_only(self.data_in[1])
            | self.join.data_in[2].set_valid_only(self.condition)
            | self.join.data_out.set_ready_from(self.data_out)
        {
            self.join.propagate();
        }

        if self.data_in[0].set_ready_from(self.join.data_in[0]) {
            update_list.push("data_in.0".to_string());
        }
        if self.data_in[1].set_ready_from(self.join.data_in[1]) {
            update_list.push("data_in.1".to_string());
        }
        if self.condition.set_ready_from(self.join.data_in[2]) {
            update_list.push("condition".to_string());
        }
        if self.data_out.set_valid(
            self.join.data_out.valid,
            if self.condition.valid {
                self.data_in[!self.condition.data.as_bool() as usize].data
            } else {
                VALUE::ERROR
            },
        ) {
            update_list.push("data_out".to_string());
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct Load {
    pub address_in: HandshakeValue,
    pub data_out: HandshakeValue,
    pub address_out: HandshakeValue,
    pub data_in: HandshakeValue,
    pub control: HandshakeValue,
}

impl IsHandshake for Load {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        if self.address_out.set_valid_from(self.address_in) {
            update_list.push("address_out".to_string());
        }
        if self.address_in.set_ready_from(self.address_out) {
            update_list.push("address_in".to_string());
        }
        if self.data_out.set_valid_from(self.data_in) {
            update_list.push("data_out".to_string());
        }
        if self.data_in.set_ready_from(self.data_out) {
            update_list.push("data_in".to_string());
        }
        if self.control.set_ready(true) {
            update_list.push("control".to_string());
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct Store {
    pub address_in: HandshakeValue,
    pub data_out: HandshakeValue,
    pub address_out: HandshakeValue,
    pub data_in: HandshakeValue,
    pub control: HandshakeValue,
    addr: ElasticBuffer,
    data: ElasticBuffer,
}

impl IsHandshake for Store {
    fn init(&mut self) {
        self.addr.init();
        self.addr.propagate();
        self.data.init();
        self.data.propagate();
    }

    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        if self.addr.data_in.set_valid_from(self.address_in)
            | self.addr.data_out.set_ready_from(self.address_out)
        {
            self.addr.propagate();
        }
        if self.address_out.set_valid_from(self.addr.data_out) {
            update_list.push("address_out".to_string());
        }
        if self.address_in.set_ready_from(self.addr.data_in) {
            update_list.push("address_in".to_string());
        }

        if self.data.data_in.set_valid_from(self.data_in)
            | self.data.data_out.set_ready_from(self.data_out)
        {
            self.data.propagate();
        }
        if self.data_out.set_valid_from(self.data.data_out) {
            update_list.push("data_out".to_string());
        }
        if self.data_in.set_ready_from(self.data.data_in) {
            update_list.push("data_in".to_string());
        }
        if self.control.set_ready(true) {
            update_list.push("control".to_string());
        }
        update_list
    }

    fn update(&mut self) -> bool {
        let mut flag = false;
        if self.addr.update() {
            self.addr.propagate();
            flag = true;
        }
        if self.data.update() {
            self.data.propagate();
            flag = true;
        }
        flag
    }
}

#[derive(Debug, SetValue)]
pub struct ElasticFIFO {
    pub data_in: HandshakeValue,
    pub data_out: HandshakeValue,
    depth: usize,
    queue: VecDeque<VALUE>,
    new_value: VALUE,
}

impl ElasticFIFO {
    pub fn set(depth: usize) -> Self {
        let mut unit = Self::new();
        unit.depth = depth;
        unit
    }
}

impl IsHandshake for ElasticFIFO {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        if self.data_in.set_ready(self.queue.len() < self.depth) {
            update_list.push("data_in".to_string());
        }
        if self.data_out.set_valid(
            !self.queue.is_empty(),
            self.queue.front().unwrap_or(&VALUE::ERROR).to_owned(),
        ) {
            update_list.push("data_out".to_string());
        }
        self.new_value = self.data_in.data;

        update_list
    }

    fn update(&mut self) -> bool {
        let do_enq = self.data_in.valid & self.data_in.ready;
        let do_deq = self.data_out.valid & self.data_out.ready;
        if do_enq {
            self.queue.push_back(self.new_value);
        }
        if do_deq {
            self.queue.pop_front();
        }
        do_enq | do_deq
    }
}

#[derive(Debug, SetValue)]
pub struct DynMem {
    pub load_address: Vec<HandshakeValue>,
    pub load_data: Vec<HandshakeValue>,
    pub store_address: Vec<HandshakeValue>,
    pub store_data: Vec<HandshakeValue>,
    mem: Vec<VALUE>,
    w_en: bool,
    r_en: bool,
    addr: usize,
    w_data: VALUE,
    buffer: Vec<TEHB>,
    arb_out_valid: Reg,
    address: Reg,
}

impl DynMem {
    pub fn set(load: usize, store: usize, size: usize, data_type: &String) -> Self {
        let mut unit = Self::new();
        unit.load_address = vec![HandshakeValue::empty(); load];
        unit.load_data = vec![HandshakeValue::empty(); load];
        unit.store_address = vec![HandshakeValue::empty(); store];
        unit.store_data = vec![HandshakeValue::empty(); store];
        unit.mem = vec![
            match data_type as &str {
                "i32" => VALUE::I32(0),
                "i64" => VALUE::I64(0),
                "u32" => VALUE::U32(0),
                "u64" => VALUE::U64(0),
                "f32" => VALUE::F32(0.0),
                "f64" => VALUE::F64(0.0),
                "bool" => VALUE::Bool(false),
                _ => panic!(),
            };
            size
        ];
        unit.arb_out_valid = Reg::init(VALUE::U64(10000000));
        unit.buffer = (0..load).map(|_| TEHB::new()).collect();
        unit
    }

    pub fn set_mem(&mut self, store: &[&str]) {
        let data_type = self.mem[0].get_type();
        for (store, value) in self.mem.iter_mut().zip(store) {
            *store = build_value(&data_type, &String::from(value.to_owned()));
        }
    }
}

impl IsHandshake for DynMem {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        let load_num = self.load_address.len();
        let store_num = self.store_address.len();

        if load_num == 0 && store_num == 1 {
            let mut join = Join {
                data_in: vec![self.store_address[0], self.store_data[0]],
                data_out: HandshakeValue {
                    valid: false,
                    ready: true,
                    data: VALUE::ERROR,
                },
            };
            join.propagate();
            self.w_en = join.data_out.valid;
            self.addr = self.store_address[0].data.as_u64() as usize;
            self.w_data = self.store_data[0].data;
            if self.store_address[0].set_ready_from(join.data_in[0]) {
                update_list.push("store_address.0".to_string());
            }
            if self.store_data[0].set_ready_from(join.data_in[1]) {
                update_list.push("store_data.0".to_string());
            }
        } else if store_num == 0 {
            self.w_en = false;
            self.r_en = false;
            let buffer_ready = self.buffer.iter().map(|buffer| buffer.get_ready());
            let arb_in_valid = zip(buffer_ready, &self.load_address)
                .map(|(ready, address)| ready & address.valid)
                .collect::<Vec<bool>>();
            let arb_out_valid = arb_in_valid.iter().position(|x| *x);
            zip(&self.load_data, &mut self.buffer)
                .enumerate()
                .for_each(|(idx, (data, buffer))| {
                    let new_valid = self.arb_out_valid.get_value().as_u64() as usize == idx;
                    let new_data = if new_valid {
                        self.mem[self.address.get_value().as_u64() as usize]
                    } else {
                        VALUE::ERROR
                    };
                    if buffer.data_out.set_ready_from(*data)
                        | buffer.data_in.set_valid(new_valid, new_data)
                    {
                        buffer.propagate();
                    }
                });

            zip(&self.buffer, &mut self.load_data)
                .enumerate()
                .for_each(|(idx, (buffer, data))| {
                    if data.set_valid_from(buffer.data_out) {
                        update_list.push("load_data.".to_string() + &idx.to_string());
                    }
                });
            self.arb_out_valid
                .set_value(arb_out_valid.map_or(VALUE::U64(100000000), |x| VALUE::U64(x as u64)));
            if let Some(idx) = arb_out_valid {
                self.address.set_value(self.load_address[idx].data);
            }

            arb_in_valid
                .iter()
                .scan(false, |acc, valid| {
                    let last = acc.to_owned();
                    *acc = *acc || *valid;
                    Some(!last)
                })
                .zip(&self.buffer)
                .map(|(valid, buffer)| valid & buffer.data_in.ready)
                .zip(&mut self.load_address)
                .enumerate()
                .for_each(|(idx, (ready, address))| {
                    if address.set_ready(ready) {
                        update_list.push("load_address.".to_string() + &idx.to_string());
                    }
                });
        } else if load_num == 1 && store_num == 1 {
            panic!()
        } else {
            panic!()
        }

        update_list
    }

    fn update(&mut self) -> bool {
        let mut flag = false;
        if self.w_en {
            self.mem[self.addr] = self.w_data;
        }
        self.buffer.iter_mut().for_each(|buffer| {
            flag = flag | buffer.update();
        });
        flag = flag | self.address.update();
        flag = flag | self.arb_out_valid.update();
        flag
    }
}

#[derive(Debug, SetValue)]
pub struct ConstantElastic {
    pub control: HandshakeValue,
    pub data_in: VALUE,
    pub data_out: HandshakeValue,
}

impl IsHandshake for ConstantElastic {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        if self.control.set_ready_from(self.data_out) {
            update_list.push("control".to_string());
        }
        if self.data_out.set_valid(self.control.valid, self.data_in) {
            update_list.push("data_out".to_string());
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct BinaryUnit {
    pub operand0: HandshakeValue,
    pub operand1: HandshakeValue,
    pub result: HandshakeValue,
    func: fn(&Vec<VALUE>) -> VALUE,
}

impl BinaryUnit {
    pub fn set(func: fn(&Vec<VALUE>) -> VALUE) -> Self {
        let mut unit = BinaryUnit::new();
        unit.func = func;
        unit
    }
}

impl IsHandshake for BinaryUnit {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];

        if self
            .operand0
            .set_ready(self.operand1.valid & self.result.ready)
        {
            update_list.push("operand0".to_string());
        }
        if self
            .operand1
            .set_ready(self.operand0.valid & self.result.ready)
        {
            update_list.push("operand1".to_string());
        }
        if self.result.set_valid(
            self.operand0.valid & self.operand1.valid,
            (self.func)(&vec![self.operand0.data, self.operand1.data]),
        ) {
            update_list.push("result".to_string());
        }
        update_list
    }
}

#[derive(Debug, SetValue)]
pub struct BinaryUnitSeq {
    pub operand0: HandshakeValue,
    pub operand1: HandshakeValue,
    pub result: HandshakeValue,
    join: Join,
    delay: VecDeque<(bool, VALUE)>,
    oehb: OEHB,
    func: fn(&Vec<VALUE>) -> VALUE,
}

impl BinaryUnitSeq {
    pub fn set(func: fn(&Vec<VALUE>) -> VALUE, latency: usize) -> Self {
        let mut unit = Self::new();
        unit.func = func;
        unit.delay = VecDeque::from(vec![(false, VALUE::ERROR); latency - 1]);
        unit.oehb.full_reg = Reg::init(VALUE::Bool(false));
        unit.oehb.data_reg = Reg::init(VALUE::ERROR);
        unit.oehb.propagate();
        unit.join.propagate();
        unit
    }
}

impl IsHandshake for BinaryUnitSeq {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        let delay = self.delay.back().unwrap();
        if self.oehb.data_in.set_valid(delay.0, delay.1)
            | self.oehb.data_out.set_ready_from(self.result)
        {
            self.oehb.propagate();
        }

        if self.join.data_in[0].set_valid_only(self.operand0)
            | self.join.data_in[1].set_valid_only(self.operand1)
            | self.join.data_out.set_ready_from(self.oehb.data_in)
        {
            self.join.propagate();
        }

        if self.operand0.set_ready_from(self.join.data_in[0]) {
            update_list.push("operand0".to_string());
        }
        if self.operand1.set_ready_from(self.join.data_in[1]) {
            update_list.push("operand1".to_string());
        }
        if self.result.set_valid_from(self.oehb.data_out) {
            update_list.push("result".to_string());
        }
        update_list
    }

    fn update(&mut self) -> bool {
        let mut flag = false;
        if self.oehb.data_in.ready {
            flag = true;
            self.delay.push_front((
                self.join.data_out.valid,
                (self.func)(&vec![self.operand0.data, self.operand1.data]),
            ));
            self.delay.pop_back();
        }
        if self.oehb.update() {
            flag = true;
            self.oehb.propagate();
        }
        flag
    }
}

#[derive(Debug, SetValue)]
pub struct Trunc {
    pub operand: HandshakeValue,
    pub result: HandshakeValue,
}

impl IsHandshake for Trunc {
    fn propagate(&mut self) -> Vec<String> {
        let mut update_list = vec![];
        if self.operand.set_ready_from(self.result) {
            update_list.push("operand".to_string());
        }
        if self
            .result
            .set_valid(self.operand.valid, VALUE::Bool(self.operand.data.as_bool()))
        {
            update_list.push("result".to_string());
        }
        update_list
    }
}
