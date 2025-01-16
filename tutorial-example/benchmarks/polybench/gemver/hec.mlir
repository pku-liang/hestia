module {
  hec.design @kernel_gemver {
    %true = arith.constant {dump = "const_34"} true
    %c8_i32 = arith.constant {dump = "op_17"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_6"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_13"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_11"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_10"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_9"} 12 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 65536 : i32, ports = "rw"} : i1, i1, i16, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_4.r_en, %mem_global_4.addr, %mem_global_4.r_data = hec.primitive "mem_global_4" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_5.w_en, %mem_global_5.r_en, %mem_global_5.addr, %mem_global_5.w_data, %mem_global_5.r_data = hec.primitive "mem_global_5" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_6.w_en, %mem_global_6.r_en, %mem_global_6.addr, %mem_global_6.w_data, %mem_global_6.r_data = hec.primitive "mem_global_6" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_7.r_en, %mem_global_7.addr, %mem_global_7.r_data = hec.primitive "mem_global_7" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_8.r_en, %mem_global_8.addr, %mem_global_8.r_data = hec.primitive "mem_global_8" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %muli_main_1.operand0, %muli_main_1.operand1, %muli_main_1.result = hec.primitive "muli_main_1" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s8 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s6 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          %0 = hec.shift_left %r_main_2.reg %c8_i32 {dump = "comb_2"} : i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_3.reg %0 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i16
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_1.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.assign %mem_global_2.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_2.r_en : i1
          hec.assign %mem_global_3.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_3.r_en : i1
          hec.assign %mem_global_4.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_4.r_en : i1
          %2 = hec.shift_left %r_main_2.reg %c8_i32 {dump = "comb_4"} : i32
          %3 = hec.addi %r_main_3.reg %2 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %r_main_6.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_8.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_1.operand0 = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_1.operand1 = %mem_global_4.r_data : i32 -> i32
          hec.transition {
            hec.goto @s3_0
          }
        }
        hec.state @s3_0 {
          hec.transition {
            hec.goto @s3_1
          }
        }
        hec.state @s3_1 {
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          hec.assign %r_main_4.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_6"} : (i32, i32) -> i32
          %1 = hec.addi %0 %muli_main_1.result {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_12.reg : i32 -> i16
          hec.assign %mem_global_0.w_data = %1 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_9"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s6 {
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_11"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s8 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s9_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_12"} : i1
          hec.transition {
            hec.goto @s10
            hec.goto @s18 if %0
          }
        } {control = 1 : i32}
        hec.state @s10 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        } {control = 1 : i32}
        hec.state @s10_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_13"} : i1
          hec.transition {
            hec.goto @s11
            hec.goto @s16 if %0
          }
        } {control = 1 : i32}
        hec.state @s11 {
          hec.assign %mem_global_6.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_6.r_en : i1
          %0 = hec.shift_left %r_main_3.reg %c8_i32 {dump = "comb_14"} : i32
          %1 = hec.addi %r_main_2.reg %0 {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i16
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_7.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_7.r_en : i1
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_4.reg = %mem_global_6.r_data : i32 -> i32
          hec.assign %r_main_8.reg = %mem_global_7.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c45_i32 : i32 -> i32
          hec.transition {
            hec.goto @s12_0
          }
        }
        hec.state @s12_0 {
          hec.transition {
            hec.goto @s12_1
          }
        }
        hec.state @s12_1 {
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_8.reg : i32 -> i32
          hec.transition {
            hec.goto @s13_0
          }
        }
        hec.state @s13_0 {
          hec.transition {
            hec.goto @s13_1
          }
        }
        hec.state @s13_1 {
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %mem_global_6.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_6.w_data = %0 : i32 -> i32
          hec.enable %mem_global_6.w_en : i1
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_18"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s10_entry
          }
        }
        hec.state @s16 {
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_20"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s9_entry
          }
        }
        hec.state @s18 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s19_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_21"} : i1
          hec.transition {
            hec.goto @s20
            hec.goto @s23 if %0
          }
        } {control = 1 : i32}
        hec.state @s20 {
          hec.assign %mem_global_6.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_6.r_en : i1
          hec.assign %mem_global_8.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_8.r_en : i1
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s21 {
          hec.assign %r_main_3.reg = %mem_global_6.r_data : i32 -> i32
          hec.assign %r_main_4.reg = %mem_global_8.r_data : i32 -> i32
          %0 = hec.addi %mem_global_6.r_data %mem_global_8.r_data {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %mem_global_6.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_6.w_data = %0 : i32 -> i32
          hec.enable %mem_global_6.w_en : i1
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_24"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s19_entry
          }
        }
        hec.state @s23 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s24_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_25"} : i1
          hec.transition {
            hec.goto @s25
            hec.goto @s33 if %0
          }
        } {control = 1 : i32}
        hec.state @s25 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s26
          }
        } {control = 1 : i32}
        hec.state @s25_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_26"} : i1
          hec.transition {
            hec.goto @s26
            hec.goto @s31 if %0
          }
        } {control = 1 : i32}
        hec.state @s26 {
          hec.assign %mem_global_5.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_5.r_en : i1
          %0 = hec.shift_left %r_main_2.reg %c8_i32 {dump = "comb_27"} : i32
          %1 = hec.addi %r_main_3.reg %0 {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i16
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_6.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_6.r_en : i1
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          hec.assign %r_main_4.reg = %mem_global_5.r_data : i32 -> i32
          hec.assign %r_main_8.reg = %mem_global_6.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s27_0
          }
        }
        hec.state @s27_0 {
          hec.transition {
            hec.goto @s27_1
          }
        }
        hec.state @s27_1 {
          hec.transition {
            hec.goto @s28
          }
        }
        hec.state @s28 {
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_8.reg : i32 -> i32
          hec.transition {
            hec.goto @s28_0
          }
        }
        hec.state @s28_0 {
          hec.transition {
            hec.goto @s28_1
          }
        }
        hec.state @s28_1 {
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %mem_global_5.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_5.w_data = %0 : i32 -> i32
          hec.enable %mem_global_5.w_en : i1
          hec.transition {
            hec.goto @s30
          }
        }
        hec.state @s30 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_31"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s25_entry
          }
        }
        hec.state @s31 {
          hec.transition {
            hec.goto @s32
          }
        }
        hec.state @s32 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_33"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s24_entry
          }
        }
        hec.state @s33 {
          hec.transition {
            hec.goto @s34
          }
        }
        hec.state @s34 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_87"}
  }
  tor.design @kernel_gemver {
    %c8_i32 = arith.constant {dump = "op_73"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_71"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_69"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_10"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_9"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<65536xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<256xi32, [], "r">
    %5 = tor.alloc {dump = "op_5"} : !tor.memref<256xi32, [], "rw">
    %6 = tor.alloc {dump = "op_6"} : !tor.memref<256xi32, [], "rw">
    %7 = tor.alloc {dump = "op_7"} : !tor.memref<256xi32, [], "r">
    %8 = tor.alloc {dump = "op_8"} : !tor.memref<256xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_87", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 34){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:3"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [1 : i32] [{type = "static-for"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [0 : i32] [{type = "static-for"}]
        tor.succ 9 : [8 : i32] [{type = "static"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:3"}]
        tor.succ 14 : [13 : i32] [{type = "static:3"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [10 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [9 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [20 : i32] [{type = "static:1"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [19 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
        tor.succ 25 : [24 : i32] [{type = "static"}]
        tor.succ 26 : [25 : i32] [{type = "static"}]
        tor.succ 27 : [26 : i32] [{type = "static:1"}]
        tor.succ 28 : [27 : i32] [{type = "static:3"}]
        tor.succ 29 : [28 : i32] [{type = "static:3"}]
        tor.succ 30 : [29 : i32] [{type = "static:1"}]
        tor.succ 31 : [25 : i32] [{type = "static-for"}]
        tor.succ 32 : [31 : i32] [{type = "static"}]
        tor.succ 33 : [24 : i32] [{type = "static-for"}]
        tor.succ 34 : [33 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (0 to 7){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (1 to 5){
          %9 = arith.shli %arg0, %c8_i32 {dump = "op_18", endtime = 3 : i32, starttime = 2 : i32} : i32
          %10 = tor.addi %arg1 %9 on (2 to 3) {dump = "op_19"} : (i32, i32) -> i32
          %11 = tor.load %0[%10] on (2 to 3) {dump = "op_20"} : !tor.memref<65536xi32, [], "rw">[i32]
          %12 = tor.load %1[%arg0] on (2 to 3) {dump = "op_21"} : !tor.memref<256xi32, [], "r">[i32]
          %13 = tor.load %2[%arg1] on (2 to 3) {dump = "op_22"} : !tor.memref<256xi32, [], "r">[i32]
          %14 = tor.muli %12 %13 on (3 to 4) {dump = "op_23"} : (i32, i32) -> i32
          %15 = tor.addi %11 %14 on (4 to 5) {dump = "op_24"} : (i32, i32) -> i32
          %16 = tor.load %3[%arg0] on (2 to 3) {dump = "op_25"} : !tor.memref<256xi32, [], "r">[i32]
          %17 = tor.load %4[%arg1] on (2 to 3) {dump = "op_26"} : !tor.memref<256xi32, [], "r">[i32]
          %18 = tor.muli %16 %17 on (3 to 4) {dump = "op_27"} : (i32, i32) -> i32
          %19 = tor.addi %15 %18 on (4 to 5) {dump = "op_28"} : (i32, i32) -> i32
          %20 = arith.shli %arg0, %c8_i32 {dump = "op_30", endtime = 3 : i32, starttime = 2 : i32} : i32
          %21 = tor.addi %arg1 %20 on (2 to 3) {dump = "op_31"} : (i32, i32) -> i32
          tor.store %19 to %0[%21] on (4 to 5) {dump = "op_32"} : (i32, !tor.memref<65536xi32, [], "rw">[i32])
        } {dump = "op_34"}
      } {dump = "op_36"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (9 to 17){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (10 to 15){
          %9 = tor.load %6[%arg0] on (11 to 12) {dump = "op_43"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg1, %c8_i32 {dump = "op_45", endtime = 12 : i32, starttime = 11 : i32} : i32
          %11 = tor.addi %arg0 %10 on (11 to 12) {dump = "op_46"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (11 to 12) {dump = "op_47"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c45_i32 on (12 to 13) {dump = "op_48"} : (i32, i32) -> i32
          %14 = tor.load %7[%arg1] on (11 to 12) {dump = "op_49"} : !tor.memref<256xi32, [], "r">[i32]
          %15 = tor.muli %13 %14 on (13 to 14) {dump = "op_50"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (14 to 15) {dump = "op_51"} : (i32, i32) -> i32
          tor.store %16 to %6[%arg0] on (14 to 15) {dump = "op_52"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_54"}
      } {dump = "op_56"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (19 to 22){
        %9 = tor.load %6[%arg0] on (20 to 21) {dump = "op_60"} : !tor.memref<256xi32, [], "rw">[i32]
        %10 = tor.load %8[%arg0] on (20 to 21) {dump = "op_61"} : !tor.memref<256xi32, [], "r">[i32]
        %11 = tor.addi %9 %10 on (21 to 22) {dump = "op_62"} : (i32, i32) -> i32
        tor.store %11 to %6[%arg0] on (21 to 22) {dump = "op_63"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_65"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (24 to 32){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (25 to 30){
          %9 = tor.load %5[%arg0] on (26 to 27) {dump = "op_72"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg0, %c8_i32 {dump = "op_74", endtime = 27 : i32, starttime = 26 : i32} : i32
          %11 = tor.addi %arg1 %10 on (26 to 27) {dump = "op_75"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (26 to 27) {dump = "op_76"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c12_i32 on (27 to 28) {dump = "op_77"} : (i32, i32) -> i32
          %14 = tor.load %6[%arg1] on (26 to 27) {dump = "op_78"} : !tor.memref<256xi32, [], "rw">[i32]
          %15 = tor.muli %13 %14 on (28 to 29) {dump = "op_79"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (29 to 30) {dump = "op_80"} : (i32, i32) -> i32
          tor.store %16 to %5[%arg0] on (29 to 30) {dump = "op_81"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_83"}
      } {dump = "op_85"}
      tor.return {dump = "op_86"}
    }
  } {dump = "op_88", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

