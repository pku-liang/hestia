mod lib;
use lib::common::*;
use lib::hec;
use lib::software;
use lib::tor;
use std::process;

fn get_input(stdin: &std::io::Stdin) -> String {
    let mut command = String::new();
    if stdin.read_line(&mut command).is_err() {
        println!("Read Error!");
        return String::new();
    }
    return command.trim().to_string();
}

use std::io::{Read, Write};

fn execute_command(command: &String) {
    let commands = [
        "breakpoint",
        "call",
        "continue",
        "load",
        "load_memory",
        "load_memory_file",
        "load_equal",
        "ready",
        "show",
        "show_active",
        "show_breakpoint",
        "show_mem",
        "show_op",
        "show_stack",
        "show_stall",
        "show_var",
        "show_watchpoint",
        "step",
        "switch",
        "unset_breakpoint",
        "unset_watchpoint",
        "valid",
        "watch",
    ];
    let list = command.split(" ").collect::<Vec<&str>>();
    match &list[0] as &str {
        "help" => println!("{:#?}", commands),
        "show" => software::show_function(),
        "var" | "show_var" => show_variable(&list[1..]),
        "stack" | "show_stack" => software::show_stack(),
        "mem" | "show_mem" => show_memory(&list[1..]),
        "op" | "show_op" => software::show_operation(),
        "b" | "breakpoint" => set_breakpoint(String::from(list[1])),
        "w" | "watch" => set_watchpoint(String::from(list[1])),
        "c" | "continue" => execute_continue(),
        "l" | "load" => {
            if parse_file(list[1]).is_err() {
                println!("!!Failed to load file {}", list[1]);
            }
        }
        "show_active" => show_active(),
        "show_stall" => tor::show_stall(),
        "s" | "step" => {
            if list.len() == 1 {
                step(1)
            } else {
                step(list[1].parse::<usize>().unwrap())
            }
        }
        "switch" => switch(list[1]),
        "call" => {
            if let Err(err) = call_function(list[1], &list[2..]) {
                println!("{}", err);
            }
        }
        "cosim" => cosim(),
        "load_memory" => load_memory(list[1], &list[2..]),
        "load_memory_file" => {
            if load_memory_file(list[1], list[2]).is_err() {
                println!("!!Failed to load file {}", list[2]);
            }
        }
        "load_equal" => {
            if parse_equal(list[1]).is_err() {
                println!("!!Failed to load file {}", list[1]);
            }
        }
        "show_breakpoint" => show_breakpoint(),
        "unset_breakpoint" => unset_breakpoint(list[1]),
        "show_watchpoint" => show_watchpoint(),
        "unset_watchpoint" => unset_watchpoint(list[1]),
        "ready" => hec::ready(list[1]),
        "valid" => hec::valid(list[1], list[2]),
        "invalid" => hec::invalid(list[1]),
        "exit" | "quit" | "q" => process::exit(0),
        _ => {
            println!("!!Undefined instruction: {}", command);
        }
    }
}

fn execute_commands(commands: &Vec<&str>) {
    for command in commands {
        if command.len() == 0 {
            continue;
        }
        execute_command(&String::from(*command));
    }
}

use std::fs::File;
fn execute_commands_from_file(path: &String) -> std::io::Result<()> {
    let mut file = File::open(path)?;
    let mut lines = String::new();
    file.read_to_string(&mut lines).unwrap();
    let commands = lines
        .split("\n")
        .filter(|s| !s.starts_with("#"))
        .collect::<Vec<&str>>();
    // println!("{:?}", commands);
    execute_commands(&commands);
    Ok(())
}

// use std::time::Instant;
use std::env;
use std::vec;

fn main() {
    init();

    let args: Vec<String> = env::args().skip(1).collect();
    if args.len() == 1 {
        let _ = execute_commands_from_file(&args[0]);
    } else {
        // let _ = execute_commands_from_file(&"/home/ruifan/wuxi/hector/examples/polybench/syrk/tor.tcl".to_string());
    }

    // let commands = vec![];
    // execute_commands(&commands);

    let stdin = std::io::stdin();
    loop {
        print!("> ");
        if std::io::stdout().flush().is_err() {
            println!("Flush Error!");
            break;
        }

        let command = get_input(&stdin);
        if command == "quit" || command == "exit" || command == "q" {
            break;
        }
        execute_command(&command);
    }
}
