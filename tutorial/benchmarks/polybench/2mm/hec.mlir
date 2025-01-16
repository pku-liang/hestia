module {
  hec.design @kernel_2mm {
    %true = arith.constant {dump = "const_31"} true
    %c23_i32 = arith.constant {dump = "new_constant_1"} 23 : i32
    %c24_i32 = arith.constant {dump = "op_50"} 24 : i32
    %c21_i32 = arith.constant {dump = "new_constant_3"} 21 : i32
    %c22_i32 = arith.constant {dump = "op_19"} 22 : i32
    %c17_i32 = arith.constant {dump = "new_constant_4"} 17 : i32
    %c18_i32 = arith.constant {dump = "op_12"} 18 : i32
    %c15_i32 = arith.constant {dump = "new_constant_5"} 15 : i32
    %c1_i32 = arith.constant {dump = "op_10"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_7"} 0 : i32
    %c12_i32 = arith.constant {dump = "op_6"} 12 : i32
    %c45_i32 = arith.constant {dump = "op_5"} 45 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 288 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 352 : i32, ports = "r"} : i1, i9, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 396 : i32, ports = "r"} : i1, i9, i32
    %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 432 : i32, ports = "r"} : i1, i9, i32
    %mem_global_4.w_en, %mem_global_4.r_en, %mem_global_4.addr, %mem_global_4.w_data, %mem_global_4.r_data = hec.primitive "mem_global_4" is "mem" {len = 384 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %muli_main_1.operand0, %muli_main_1.operand1, %muli_main_1.result = hec.primitive "muli_main_1" is "mul_integer" : i32, i32, i32
      %muli_main_2.operand0, %muli_main_2.operand1, %muli_main_2.result = hec.primitive "muli_main_2" is "mul_integer" : i32, i32, i32
      %muli_main_3.operand0, %muli_main_3.operand1, %muli_main_3.result = hec.primitive "muli_main_3" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_13.reg = hec.primitive "r_main_13" is "register" : i32
      %r_main_15.reg = hec.primitive "r_main_15" is "register" : i32
      %r_main_16.reg = hec.primitive "r_main_16" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s15 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s13 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c18_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2_0
          }
        }
        hec.state @s2_0 {
          hec.transition {
            hec.goto @s2_1
          }
        }
        hec.state @s2_1 {
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i9
          hec.assign %mem_global_0.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s4_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_3"} : i1
          hec.transition {
            hec.goto @s5
            hec.goto @s11 if %0
          }
        } {control = 1 : i32}
        hec.state @s5 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c22_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c18_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c18_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c18_i32 : i32 -> i32
          hec.transition {
            hec.goto @s5_0
          }
        }
        hec.state @s5_0 {
          hec.transition {
            hec.goto @s5_1
          }
        }
        hec.state @s5_1 {
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          hec.assign %r_main_9.reg = %muli_main_3.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i9
          hec.enable %mem_global_2.r_en : i1
          %2 = hec.addi %r_main_4.reg %muli_main_2.result {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %2 : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          %3 = hec.addi %r_main_4.reg %muli_main_3.result {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          hec.assign %r_main_13.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_15.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s7_0
          }
        }
        hec.state @s7_0 {
          hec.transition {
            hec.goto @s7_1
          }
        }
        hec.state @s7_1 {
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_13.reg : i32 -> i32
          hec.transition {
            hec.goto @s8_0
          }
        }
        hec.state @s8_0 {
          hec.transition {
            hec.goto @s8_1
          }
        }
        hec.state @s8_1 {
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          %0 = hec.addi %r_main_15.reg %muli_main_0.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %r_main_16.reg : i32 -> i9
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c21_i32 {dump = "comb_10"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s4_entry
          }
        }
        hec.state @s11 {
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c17_i32 {dump = "comb_12"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s13 {
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c15_i32 {dump = "comb_14"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s15 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s16_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_15"} : i1
          hec.transition {
            hec.goto @s17
            hec.goto @s32 if %0
          }
        } {control = 1 : i32}
        hec.state @s17 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s18
          }
        } {control = 1 : i32}
        hec.state @s17_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_16"} : i1
          hec.transition {
            hec.goto @s18
            hec.goto @s30 if %0
          }
        } {control = 1 : i32}
        hec.state @s18 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c24_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c24_i32 : i32 -> i32
          hec.transition {
            hec.goto @s18_0
          }
        }
        hec.state @s18_0 {
          hec.transition {
            hec.goto @s18_1
          }
        }
        hec.state @s18_1 {
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %0 : i32 -> i9
          hec.enable %mem_global_4.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          hec.assign %muli_main_0.operand0 = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c45_i32 : i32 -> i32
          hec.transition {
            hec.goto @s20_0
          }
        }
        hec.state @s20_0 {
          hec.transition {
            hec.goto @s20_1
          }
        }
        hec.state @s20_1 {
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s21 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_4.addr = %r_main_9.reg : i32 -> i9
          hec.assign %mem_global_4.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_4.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s23
          }
        }
        hec.state @s22_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_19"} : i1
          hec.transition {
            hec.goto @s23
            hec.goto @s28 if %0
          }
        } {control = 1 : i32}
        hec.state @s23 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c18_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c24_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c24_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c24_i32 : i32 -> i32
          hec.transition {
            hec.goto @s23_0
          }
        }
        hec.state @s23_0 {
          hec.transition {
            hec.goto @s23_1
          }
        }
        hec.state @s23_1 {
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          hec.assign %r_main_9.reg = %muli_main_3.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %mem_global_3.addr = %1 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %2 = hec.addi %r_main_4.reg %muli_main_2.result {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %2 : i32 -> i9
          hec.enable %mem_global_4.r_en : i1
          %3 = hec.addi %r_main_4.reg %muli_main_3.result {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s25
          }
        }
        hec.state @s25 {
          hec.assign %r_main_13.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %r_main_15.reg = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_3.r_data : i32 -> i32
          hec.transition {
            hec.goto @s25_0
          }
        }
        hec.state @s25_0 {
          hec.transition {
            hec.goto @s25_1
          }
        }
        hec.state @s25_1 {
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s26 {
          %0 = hec.addi %r_main_15.reg %muli_main_0.result {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %r_main_16.reg : i32 -> i9
          hec.assign %mem_global_4.w_data = %0 : i32 -> i32
          hec.enable %mem_global_4.w_en : i1
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c17_i32 {dump = "comb_26"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s22_entry
          }
        }
        hec.state @s28 {
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c23_i32 {dump = "comb_28"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s17_entry
          }
        }
        hec.state @s30 {
          hec.transition {
            hec.goto @s31
          }
        }
        hec.state @s31 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c15_i32 {dump = "comb_30"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s16_entry
          }
        }
        hec.state @s32 {
          hec.transition {
            hec.goto @s33
          }
        }
        hec.state @s33 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_89"}
  }
  tor.design @kernel_2mm {
    %c24_i32 = arith.constant {dump = "op_78"} 24 : i32
    %c18_i32 = arith.constant {dump = "op_64"} 18 : i32
    %c17_i32 = arith.constant {dump = "new_constant_0"} 17 : i32
    %c1_i32 = arith.constant {dump = "op_63"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_61"} 0 : i32
    %c23_i32 = arith.constant {dump = "new_constant_1"} 23 : i32
    %c15_i32 = arith.constant {dump = "new_constant_2"} 15 : i32
    %c22_i32 = arith.constant {dump = "op_21"} 22 : i32
    %c21_i32 = arith.constant {dump = "new_constant_3"} 21 : i32
    %c12_i32 = arith.constant {dump = "op_6"} 12 : i32
    %c45_i32 = arith.constant {dump = "op_5"} 45 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<288xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<352xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<396xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<432xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<384xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_89", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 33){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:3"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static"}]
        tor.succ 6 : [5 : i32] [{type = "static:3"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:3"}]
        tor.succ 9 : [8 : i32] [{type = "static:3"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [4 : i32] [{type = "static-for"}]
        tor.succ 12 : [11 : i32] [{type = "static"}]
        tor.succ 13 : [1 : i32] [{type = "static-for"}]
        tor.succ 14 : [13 : i32] [{type = "static"}]
        tor.succ 15 : [0 : i32] [{type = "static-for"}]
        tor.succ 16 : [15 : i32] [{type = "static"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [17 : i32] [{type = "static"}]
        tor.succ 19 : [18 : i32] [{type = "static:3"}]
        tor.succ 20 : [19 : i32] [{type = "static:1"}]
        tor.succ 21 : [20 : i32] [{type = "static:3"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static"}]
        tor.succ 24 : [23 : i32] [{type = "static:3"}]
        tor.succ 25 : [24 : i32] [{type = "static:1"}]
        tor.succ 26 : [25 : i32] [{type = "static:3"}]
        tor.succ 27 : [26 : i32] [{type = "static:1"}]
        tor.succ 28 : [22 : i32] [{type = "static-for"}]
        tor.succ 29 : [28 : i32] [{type = "static"}]
        tor.succ 30 : [17 : i32] [{type = "static-for"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
        tor.succ 32 : [16 : i32] [{type = "static-for"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c15_i32 : i32) step (%c1_i32 : i32)
      on (0 to 14){
        tor.for %arg1 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
        on (1 to 12){
          %5 = tor.muli %arg0 %c18_i32 on (2 to 3) {dump = "op_15"} : (i32, i32) -> i32
          %6 = tor.addi %arg1 %5 on (3 to 4) {dump = "op_16"} : (i32, i32) -> i32
          tor.store %c0_i32 to %0[%6] on (3 to 4) {dump = "op_17"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c21_i32 : i32) step (%c1_i32 : i32)
          on (4 to 10){
            %7 = tor.muli %arg0 %c22_i32 on (5 to 6) {dump = "op_22"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (6 to 7) {dump = "op_23"} : (i32, i32) -> i32
            %9 = tor.load %1[%8] on (6 to 7) {dump = "op_24"} : !tor.memref<352xi32, [], "r">[i32]
            %10 = tor.muli %9 %c12_i32 on (7 to 8) {dump = "op_25"} : (i32, i32) -> i32
            %11 = tor.muli %arg2 %c18_i32 on (5 to 6) {dump = "op_27"} : (i32, i32) -> i32
            %12 = tor.addi %arg1 %11 on (6 to 7) {dump = "op_28"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (6 to 7) {dump = "op_29"} : !tor.memref<396xi32, [], "r">[i32]
            %14 = tor.muli %10 %13 on (8 to 9) {dump = "op_30"} : (i32, i32) -> i32
            %15 = tor.muli %arg0 %c18_i32 on (5 to 6) {dump = "op_32"} : (i32, i32) -> i32
            %16 = tor.addi %arg1 %15 on (6 to 7) {dump = "op_33"} : (i32, i32) -> i32
            %17 = tor.load %0[%16] on (6 to 7) {dump = "op_34"} : !tor.memref<288xi32, [], "rw">[i32]
            %18 = tor.addi %17 %14 on (9 to 10) {dump = "op_35"} : (i32, i32) -> i32
            %19 = tor.muli %arg0 %c18_i32 on (5 to 6) {dump = "op_37"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %19 on (6 to 7) {dump = "op_38"} : (i32, i32) -> i32
            tor.store %18 to %0[%20] on (9 to 10) {dump = "op_39"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          } {dump = "op_41"}
        } {dump = "op_43"}
      } {dump = "op_45"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c15_i32 : i32) step (%c1_i32 : i32)
      on (16 to 31){
        tor.for %arg1 = (%c0_i32 : i32) to (%c23_i32 : i32) step (%c1_i32 : i32)
        on (17 to 29){
          %5 = tor.muli %arg0 %c24_i32 on (18 to 19) {dump = "op_53"} : (i32, i32) -> i32
          %6 = tor.addi %arg1 %5 on (19 to 20) {dump = "op_54"} : (i32, i32) -> i32
          %7 = tor.load %4[%6] on (19 to 20) {dump = "op_55"} : !tor.memref<384xi32, [], "rw">[i32]
          %8 = tor.muli %7 %c45_i32 on (20 to 21) {dump = "op_56"} : (i32, i32) -> i32
          %9 = tor.muli %arg0 %c24_i32 on (18 to 19) {dump = "op_58"} : (i32, i32) -> i32
          %10 = tor.addi %arg1 %9 on (19 to 20) {dump = "op_59"} : (i32, i32) -> i32
          tor.store %8 to %4[%10] on (21 to 22) {dump = "op_60"} : (i32, !tor.memref<384xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
          on (22 to 27){
            %11 = tor.muli %arg0 %c18_i32 on (23 to 24) {dump = "op_65"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %11 on (24 to 25) {dump = "op_66"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (24 to 25) {dump = "op_67"} : !tor.memref<288xi32, [], "rw">[i32]
            %14 = tor.muli %arg2 %c24_i32 on (23 to 24) {dump = "op_69"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %14 on (24 to 25) {dump = "op_70"} : (i32, i32) -> i32
            %16 = tor.load %3[%15] on (24 to 25) {dump = "op_71"} : !tor.memref<432xi32, [], "r">[i32]
            %17 = tor.muli %13 %16 on (25 to 26) {dump = "op_72"} : (i32, i32) -> i32
            %18 = tor.muli %arg0 %c24_i32 on (23 to 24) {dump = "op_74"} : (i32, i32) -> i32
            %19 = tor.addi %arg1 %18 on (24 to 25) {dump = "op_75"} : (i32, i32) -> i32
            %20 = tor.load %4[%19] on (24 to 25) {dump = "op_76"} : !tor.memref<384xi32, [], "rw">[i32]
            %21 = tor.addi %20 %17 on (26 to 27) {dump = "op_77"} : (i32, i32) -> i32
            %22 = tor.muli %arg0 %c24_i32 on (23 to 24) {dump = "op_79"} : (i32, i32) -> i32
            %23 = tor.addi %arg1 %22 on (24 to 25) {dump = "op_80"} : (i32, i32) -> i32
            tor.store %21 to %4[%23] on (26 to 27) {dump = "op_81"} : (i32, !tor.memref<384xi32, [], "rw">[i32])
          } {dump = "op_83"}
        } {dump = "op_85"}
      } {dump = "op_87"}
      tor.return {dump = "op_88"}
    }
  } {dump = "op_90", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

