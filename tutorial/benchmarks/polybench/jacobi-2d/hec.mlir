module {
  hec.design @kernel_jacobi_2d {
    %true = arith.constant {dump = "const_45"} true
    %c-1_i32 = arith.constant {dump = "op_16"} -1 : i32
    %c30_i32 = arith.constant {dump = "op_12"} 30 : i32
    %c28_i32 = arith.constant {dump = "new_constant_3"} 28 : i32
    %c19_i32 = arith.constant {dump = "new_constant_4"} 19 : i32
    %c1_i32 = arith.constant {dump = "op_5"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 900 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 900 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %muli_main_1.operand0, %muli_main_1.operand1, %muli_main_1.result = hec.primitive "muli_main_1" is "mul_integer" : i32, i32, i32
      %muli_main_2.operand0, %muli_main_2.operand1, %muli_main_2.result = hec.primitive "muli_main_2" is "mul_integer" : i32, i32, i32
      %muli_main_3.operand0, %muli_main_3.operand1, %muli_main_3.result = hec.primitive "muli_main_3" is "mul_integer" : i32, i32, i32
      %muli_main_4.operand0, %muli_main_4.operand1, %muli_main_4.result = hec.primitive "muli_main_4" is "mul_integer" : i32, i32, i32
      %muli_main_5.operand0, %muli_main_5.operand1, %muli_main_5.result = hec.primitive "muli_main_5" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i32
      %r_main_13.reg = hec.primitive "r_main_13" is "register" : i32
      %r_main_16.reg = hec.primitive "r_main_16" is "register" : i32
      %r_main_17.reg = hec.primitive "r_main_17" is "register" : i32
      %r_main_18.reg = hec.primitive "r_main_18" is "register" : i32
      %r_main_19.reg = hec.primitive "r_main_19" is "register" : i32
      %r_main_20.reg = hec.primitive "r_main_20" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s30 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s14 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        } {control = 1 : i32}
        hec.state @s2_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_2"} : i1
          hec.transition {
            hec.goto @s3
            hec.goto @s12 if %0
          }
        } {control = 1 : i32}
        hec.state @s3 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c30_i32 : i32 -> i32
          %0 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c30_i32 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c30_i32 : i32 -> i32
          %2 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %muli_main_3.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c30_i32 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %3 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %3 : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c30_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          hec.transition {
            hec.goto @s4_0
          }
        }
        hec.state @s4_0 {
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_2.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_7.reg %muli_main_1.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_9.reg %muli_main_2.result {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_5.reg %muli_main_4.result {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_5.reg %muli_main_5.result {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %5 : i32 -> i32
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          hec.assign %r_main_13.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_17.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          hec.assign %r_main_6.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_16.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.assign %r_main_7.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.addi %r_main_13.reg %mem_global_0.r_data {dump = "comb_13"} : (i32, i32) -> i32
          %1 = hec.addi %0 %r_main_6.reg {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_19.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          hec.assign %r_main_10.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_18.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_6.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.addi %r_main_9.reg %mem_global_0.r_data {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_10.reg {dump = "comb_16"} : (i32, i32) -> i32
          %2 = hec.shift_left %1 %c1_i32 {dump = "comb_17"} : i32
          hec.assign %mem_global_1.addr = %r_main_20.reg : i32 -> i10
          hec.assign %mem_global_1.w_data = %2 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c28_i32 {dump = "comb_19"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s2_entry
          }
        }
        hec.state @s12 {
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c28_i32 {dump = "comb_21"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s14 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s15_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_22"} : i1
          hec.transition {
            hec.goto @s16
            hec.goto @s28 if %0
          }
        } {control = 1 : i32}
        hec.state @s16 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s17
          }
        } {control = 1 : i32}
        hec.state @s16_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_23"} : i1
          hec.transition {
            hec.goto @s17
            hec.goto @s26 if %0
          }
        } {control = 1 : i32}
        hec.state @s17 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c30_i32 : i32 -> i32
          %0 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c30_i32 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c30_i32 : i32 -> i32
          %2 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_26"} : (i32, i32) -> i32
          hec.assign %muli_main_3.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c30_i32 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %3 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %3 : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c30_i32 : i32 -> i32
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          hec.transition {
            hec.goto @s18_0
          }
        }
        hec.state @s18_0 {
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_2.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.addi %r_main_7.reg %muli_main_1.result {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_9.reg %muli_main_2.result {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_31"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_5.reg %muli_main_4.result {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_5.reg %muli_main_5.result {dump = "comb_33"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %5 : i32 -> i32
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          hec.assign %r_main_13.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_17.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s21 {
          hec.assign %r_main_6.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_16.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          hec.assign %r_main_7.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.addi %r_main_13.reg %mem_global_1.r_data {dump = "comb_34"} : (i32, i32) -> i32
          %1 = hec.addi %0 %r_main_6.reg {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_19.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s23
          }
        }
        hec.state @s23 {
          hec.assign %r_main_10.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_18.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          hec.assign %r_main_6.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.addi %r_main_9.reg %mem_global_1.r_data {dump = "comb_36"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_10.reg {dump = "comb_37"} : (i32, i32) -> i32
          %2 = hec.shift_left %1 %c1_i32 {dump = "comb_38"} : i32
          hec.assign %mem_global_0.addr = %r_main_20.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %2 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s25
          }
        }
        hec.state @s25 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_39"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c28_i32 {dump = "comb_40"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s16_entry
          }
        }
        hec.state @s26 {
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_41"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c28_i32 {dump = "comb_42"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s15_entry
          }
        }
        hec.state @s28 {
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_43"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_44"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s30 {
          hec.transition {
            hec.goto @s31
          }
        }
        hec.state @s31 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_105"}
  }
  tor.design @kernel_jacobi_2d {
    %c30_i32 = arith.constant {dump = "op_94"} 30 : i32
    %c1_i32 = arith.constant {dump = "op_92"} 1 : i32
    %c-1_i32 = arith.constant {dump = "op_85"} -1 : i32
    %c28_i32 = arith.constant {dump = "new_constant_0"} 28 : i32
    %c19_i32 = arith.constant {dump = "new_constant_4"} 19 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<900xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<900xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_105", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 31){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static:2"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [2 : i32] [{type = "static-for"}]
        tor.succ 13 : [12 : i32] [{type = "static"}]
        tor.succ 14 : [1 : i32] [{type = "static-for"}]
        tor.succ 15 : [14 : i32] [{type = "static"}]
        tor.succ 16 : [15 : i32] [{type = "static"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [18 : i32] [{type = "static:2"}]
        tor.succ 20 : [19 : i32] [{type = "static:1"}]
        tor.succ 21 : [20 : i32] [{type = "static:1"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static:1"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [24 : i32] [{type = "static:1"}]
        tor.succ 26 : [16 : i32] [{type = "static-for"}]
        tor.succ 27 : [26 : i32] [{type = "static"}]
        tor.succ 28 : [15 : i32] [{type = "static-for"}]
        tor.succ 29 : [28 : i32] [{type = "static"}]
        tor.succ 30 : [0 : i32] [{type = "static-for"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
      on (0 to 29){
        tor.for %arg1 = (%c1_i32 : i32) to (%c28_i32 : i32) step (%c1_i32 : i32)
        on (1 to 13){
          tor.for %arg2 = (%c1_i32 : i32) to (%c28_i32 : i32) step (%c1_i32 : i32)
          on (2 to 11){
            %2 = tor.muli %arg1 %c30_i32 on (3 to 5) {dump = "op_13"} : (i32, i32) -> i32
            %3 = tor.addi %arg2 %2 on (5 to 6) {dump = "op_14"} : (i32, i32) -> i32
            %4 = tor.load %0[%3] on (5 to 6) {dump = "op_15"} : !tor.memref<900xi32, [], "rw">[i32]
            %5 = tor.addi %arg2 %c-1_i32 on (3 to 4) {dump = "op_17"} : (i32, i32) -> i32
            %6 = tor.muli %arg1 %c30_i32 on (3 to 5) {dump = "op_19"} : (i32, i32) -> i32
            %7 = tor.addi %5 %6 on (5 to 6) {dump = "op_20"} : (i32, i32) -> i32
            %8 = tor.load %0[%7] on (7 to 8) {dump = "op_21"} : !tor.memref<900xi32, [], "rw">[i32]
            %9 = tor.addi %4 %8 on (8 to 9) {dump = "op_22"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %c1_i32 on (3 to 4) {dump = "op_24"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32 on (3 to 5) {dump = "op_26"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (5 to 6) {dump = "op_27"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (6 to 7) {dump = "op_28"} : !tor.memref<900xi32, [], "rw">[i32]
            %14 = tor.addi %9 %13 on (8 to 9) {dump = "op_29"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32 on (3 to 4) {dump = "op_31"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32 on (3 to 5) {dump = "op_33"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (5 to 6) {dump = "op_34"} : (i32, i32) -> i32
            %18 = tor.load %0[%17] on (9 to 10) {dump = "op_35"} : !tor.memref<900xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (10 to 11) {dump = "op_36"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %c-1_i32 on (3 to 4) {dump = "op_38"} : (i32, i32) -> i32
            %21 = tor.muli %20 %c30_i32 on (3 to 5) {dump = "op_40"} : (i32, i32) -> i32
            %22 = tor.addi %arg2 %21 on (5 to 6) {dump = "op_41"} : (i32, i32) -> i32
            %23 = tor.load %0[%22] on (8 to 9) {dump = "op_42"} : !tor.memref<900xi32, [], "rw">[i32]
            %24 = tor.addi %19 %23 on (10 to 11) {dump = "op_43"} : (i32, i32) -> i32
            %25 = arith.shli %24, %c1_i32 {dump = "op_45", endtime = 11 : i32, starttime = 10 : i32} : i32
            %26 = tor.muli %arg1 %c30_i32 on (3 to 5) {dump = "op_47"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (5 to 6) {dump = "op_48"} : (i32, i32) -> i32
            tor.store %25 to %1[%27] on (10 to 11) {dump = "op_49"} : (i32, !tor.memref<900xi32, [], "rw">[i32])
          } {dump = "op_51"}
        } {dump = "op_53"}
        tor.for %arg1 = (%c1_i32 : i32) to (%c28_i32 : i32) step (%c1_i32 : i32)
        on (15 to 27){
          tor.for %arg2 = (%c1_i32 : i32) to (%c28_i32 : i32) step (%c1_i32 : i32)
          on (16 to 25){
            %2 = tor.muli %arg1 %c30_i32 on (17 to 19) {dump = "op_61"} : (i32, i32) -> i32
            %3 = tor.addi %arg2 %2 on (19 to 20) {dump = "op_62"} : (i32, i32) -> i32
            %4 = tor.load %1[%3] on (19 to 20) {dump = "op_63"} : !tor.memref<900xi32, [], "rw">[i32]
            %5 = tor.addi %arg2 %c-1_i32 on (17 to 18) {dump = "op_65"} : (i32, i32) -> i32
            %6 = tor.muli %arg1 %c30_i32 on (17 to 19) {dump = "op_67"} : (i32, i32) -> i32
            %7 = tor.addi %5 %6 on (19 to 20) {dump = "op_68"} : (i32, i32) -> i32
            %8 = tor.load %1[%7] on (21 to 22) {dump = "op_69"} : !tor.memref<900xi32, [], "rw">[i32]
            %9 = tor.addi %4 %8 on (22 to 23) {dump = "op_70"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %c1_i32 on (17 to 18) {dump = "op_72"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32 on (17 to 19) {dump = "op_74"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (19 to 20) {dump = "op_75"} : (i32, i32) -> i32
            %13 = tor.load %1[%12] on (20 to 21) {dump = "op_76"} : !tor.memref<900xi32, [], "rw">[i32]
            %14 = tor.addi %9 %13 on (22 to 23) {dump = "op_77"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32 on (17 to 18) {dump = "op_79"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32 on (17 to 19) {dump = "op_81"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (19 to 20) {dump = "op_82"} : (i32, i32) -> i32
            %18 = tor.load %1[%17] on (23 to 24) {dump = "op_83"} : !tor.memref<900xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (24 to 25) {dump = "op_84"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %c-1_i32 on (17 to 18) {dump = "op_86"} : (i32, i32) -> i32
            %21 = tor.muli %20 %c30_i32 on (17 to 19) {dump = "op_88"} : (i32, i32) -> i32
            %22 = tor.addi %arg2 %21 on (19 to 20) {dump = "op_89"} : (i32, i32) -> i32
            %23 = tor.load %1[%22] on (22 to 23) {dump = "op_90"} : !tor.memref<900xi32, [], "rw">[i32]
            %24 = tor.addi %19 %23 on (24 to 25) {dump = "op_91"} : (i32, i32) -> i32
            %25 = arith.shli %24, %c1_i32 {dump = "op_93", endtime = 25 : i32, starttime = 24 : i32} : i32
            %26 = tor.muli %arg1 %c30_i32 on (17 to 19) {dump = "op_95"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (19 to 20) {dump = "op_96"} : (i32, i32) -> i32
            tor.store %25 to %0[%27] on (24 to 25) {dump = "op_97"} : (i32, !tor.memref<900xi32, [], "rw">[i32])
          } {dump = "op_99"}
        } {dump = "op_101"}
      } {dump = "op_103"}
      tor.return {dump = "op_104"}
    }
  } {dump = "op_106", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

