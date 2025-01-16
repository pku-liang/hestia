module {
  hec.design @kernel_adi {
    %true = arith.constant {dump = "const_79"} true
    %c380_i32 = arith.constant {dump = "unknown_2"} 380 : i32
    %c-1_i32 = arith.constant {dump = "op_43"} -1 : i32
    %c18_i32 = arith.constant {dump = "new_constant_5"} 18 : i32
    %c19_i32 = arith.constant {dump = "op_18"} 19 : i32
    %c20_i32 = arith.constant {dump = "new_constant_6"} 20 : i32
    %c0_i32 = arith.constant {dump = "op_13"} 0 : i32
    %c1_i32 = arith.constant {dump = "op_12"} 1 : i32
    %c81_i32 = arith.constant {dump = "op_11"} 81 : i32
    %c-160_i32 = arith.constant {dump = "op_10"} -160 : i32
    %c217_i32 = arith.constant {dump = "op_9"} 217 : i32
    %c-432_i32 = arith.constant {dump = "op_8"} -432 : i32
    %c-319_i32 = arith.constant {dump = "op_7"} -319 : i32
    %c160_i32 = arith.constant {dump = "op_6"} 160 : i32
    %c-863_i32 = arith.constant {dump = "op_5"} -863 : i32
    %c432_i32 = arith.constant {dump = "op_4"} 432 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 400 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 400 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_2.w_en, %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.w_data, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 400 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_3.w_en, %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.w_data, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 400 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %muli_main_1.operand0, %muli_main_1.operand1, %muli_main_1.result = hec.primitive "muli_main_1" is "mul_integer" : i32, i32, i32
      %muli_main_2.operand0, %muli_main_2.operand1, %muli_main_2.result = hec.primitive "muli_main_2" is "mul_integer" : i32, i32, i32
      %muli_main_3.operand0, %muli_main_3.operand1, %muli_main_3.result = hec.primitive "muli_main_3" is "mul_integer" : i32, i32, i32
      %muli_main_4.operand0, %muli_main_4.operand1, %muli_main_4.result = hec.primitive "muli_main_4" is "mul_integer" : i32, i32, i32
      %muli_main_5.operand0, %muli_main_5.operand1, %muli_main_5.result = hec.primitive "muli_main_5" is "mul_integer" : i32, i32, i32
      %muli_main_6.operand0, %muli_main_6.operand1, %muli_main_6.result = hec.primitive "muli_main_6" is "mul_integer" : i32, i32, i32
      %muli_main_7.operand0, %muli_main_7.operand1, %muli_main_7.result = hec.primitive "muli_main_7" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i32
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      %r_main_14.reg = hec.primitive "r_main_14" is "register" : i32
      %r_main_17.reg = hec.primitive "r_main_17" is "register" : i32
      %r_main_18.reg = hec.primitive "r_main_18" is "register" : i32
      %r_main_19.reg = hec.primitive "r_main_19" is "register" : i32
      %r_main_20.reg = hec.primitive "r_main_20" is "register" : i32
      %r_main_21.reg = hec.primitive "r_main_21" is "register" : i32
      %r_main_22.reg = hec.primitive "r_main_22" is "register" : i32
      %r_main_23.reg = hec.primitive "r_main_23" is "register" : i32
      %r_main_24.reg = hec.primitive "r_main_24" is "register" : i32
      %r_main_26.reg = hec.primitive "r_main_26" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s65 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s32 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          %0 = hec.addi %r_main_4.reg %c0_i32 {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i9
          hec.assign %mem_global_1.w_data = %c1_i32 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %c0_i32 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %1 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %mem_global_1.addr = %r_main_7.reg : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          hec.assign %r_main_5.reg = %mem_global_1.r_data : i32 -> i32
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_1.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c0_i32 {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %mem_global_2.addr = %0 : i32 -> i9
          hec.assign %mem_global_2.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          %1 = hec.addi %muli_main_1.result %c0_i32 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %mem_global_3.addr = %1 : i32 -> i9
          hec.assign %mem_global_3.w_data = %r_main_5.reg : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s6_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_6"} : i1
          hec.transition {
            hec.goto @s7
            hec.goto @s20 if %0
          }
        } {control = 1 : i32}
        hec.state @s7 {
          %0 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c20_i32 : i32 -> i32
          %2 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %2 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c20_i32 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %3 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.transition {
            hec.goto @s8_0
          }
        }
        hec.state @s8_0 {
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          hec.assign %r_main_7.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_11.reg = %muli_main_3.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %0 : i32 -> i32
          hec.assign %mem_global_2.addr = %0 : i32 -> i9
          hec.enable %mem_global_2.r_en : i1
          %1 = hec.addi %r_main_5.reg %muli_main_1.result {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_9.reg %muli_main_2.result {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %muli_main_3.result {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_21.reg = %3 : i32 -> i32
          hec.assign %mem_global_0.addr = %3 : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          %4 = hec.addi %r_main_12.reg %muli_main_4.result {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %r_main_23.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_14.reg %muli_main_5.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %r_main_24.reg = %5 : i32 -> i32
          hec.assign %mem_global_3.addr = %5 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %6 = hec.addi %r_main_5.reg %muli_main_6.result {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %r_main_26.reg = %6 : i32 -> i32
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_18.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_22.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-160_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c-863_i32 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_23.reg : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          hec.assign %muli_main_2.operand0 = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c-160_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %r_main_8.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_20.reg : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-432_i32 : i32 -> i32
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_10.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c432_i32 : i32 -> i32
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_9.reg = %muli_main_2.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c81_i32 {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c160_i32 : i32 -> i32
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_11.reg = %muli_main_0.result : i32 -> i32
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_7.reg {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.subi %0 %r_main_11.reg {dump = "comb_20"} : (i32, i32) -> i32
          %2 = hec.subi %1 %r_main_9.reg {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %2 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_10.reg : i32 -> i32
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
          hec.assign %r_main_12.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_19.reg : i32 -> i9
          hec.assign %mem_global_2.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          hec.assign %mem_global_3.addr = %r_main_26.reg : i32 -> i9
          hec.assign %mem_global_3.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_23"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s6_entry
          }
        }
        hec.state @s20 {
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s21 {
          %0 = hec.addi %r_main_4.reg %c380_i32 {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i9
          hec.assign %mem_global_1.w_data = %c1_i32 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s23
          }
        }
        hec.state @s22_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_25"} : i1
          hec.transition {
            hec.goto @s23
            hec.goto @s30 if %0
          }
        } {control = 1 : i32}
        hec.state @s23 {
          hec.assign %muli_main_0.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c-1_i32 : i32 -> i32
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
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_9.reg = %muli_main_3.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_4.result : i32 -> i32
          hec.assign %r_main_11.reg = %muli_main_5.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c19_i32 {dump = "comb_26"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %muli_main_1.result {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i9
          hec.enable %mem_global_2.r_en : i1
          %2 = hec.addi %muli_main_2.result %c20_i32 {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          %3 = hec.addi %muli_main_3.result %c19_i32 {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %3 : i32 -> i32
          %4 = hec.addi %3 %muli_main_4.result {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %4 : i32 -> i32
          hec.assign %mem_global_3.addr = %4 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %5 = hec.addi %muli_main_5.result %c19_i32 {dump = "comb_31"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %5 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %5 : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s25
          }
        }
        hec.state @s25 {
          hec.assign %r_main_14.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_19.reg = %mem_global_3.r_data : i32 -> i32
          hec.transition {
            hec.goto @s25_0
          }
        }
        hec.state @s25_0 {
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s26 {
          hec.assign %r_main_21.reg = %muli_main_1.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_33"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          hec.assign %r_main_7.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %r_main_14.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_1.r_data : i32 -> i32
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
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_19.reg {dump = "comb_34"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_8.reg : i32 -> i9
          hec.assign %mem_global_1.w_data = %0 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_36"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s22_entry
          }
        }
        hec.state @s30 {
          hec.transition {
            hec.goto @s31
          }
        }
        hec.state @s31 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_37"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_38"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s32 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s34
          }
        }
        hec.state @s33_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_39"} : i1
          hec.transition {
            hec.goto @s34
            hec.goto @s63 if %0
          }
        } {control = 1 : i32}
        hec.state @s34 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s34_0
          }
        }
        hec.state @s34_0 {
          hec.transition {
            hec.goto @s34_1
          }
        }
        hec.state @s34_1 {
          hec.transition {
            hec.goto @s35
          }
        }
        hec.state @s35 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_6.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_3.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c0_i32 {dump = "comb_40"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i9
          hec.assign %mem_global_0.w_data = %c1_i32 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          %1 = hec.addi %muli_main_1.result %c0_i32 {dump = "comb_41"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %1 : i32 -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i9
          hec.assign %mem_global_2.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          %2 = hec.addi %muli_main_2.result %c0_i32 {dump = "comb_42"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %2 : i32 -> i32
          %3 = hec.addi %muli_main_3.result %c0_i32 {dump = "comb_43"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s36
          }
        }
        hec.state @s36 {
          hec.assign %mem_global_0.addr = %r_main_11.reg : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s37
          }
        }
        hec.state @s37 {
          hec.assign %r_main_5.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_3.addr = %r_main_12.reg : i32 -> i9
          hec.assign %mem_global_3.w_data = %mem_global_0.r_data : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s39
          }
        }
        hec.state @s38_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_44"} : i1
          hec.transition {
            hec.goto @s39
            hec.goto @s52 if %0
          }
        } {control = 1 : i32}
        hec.state @s39 {
          %0 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_45"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_46"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c20_i32 : i32 -> i32
          %2 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_47"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %2 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c20_i32 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_48"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %3 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s40
          }
        }
        hec.state @s40 {
          hec.transition {
            hec.goto @s40_0
          }
        }
        hec.state @s40_0 {
          hec.transition {
            hec.goto @s41
          }
        }
        hec.state @s41 {
          hec.assign %r_main_7.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_11.reg = %muli_main_3.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_49"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %0 : i32 -> i32
          hec.assign %mem_global_2.addr = %0 : i32 -> i9
          hec.enable %mem_global_2.r_en : i1
          %1 = hec.addi %r_main_5.reg %muli_main_1.result {dump = "comb_50"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_5.reg %muli_main_2.result {dump = "comb_51"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_52"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %3 : i32 -> i32
          hec.assign %mem_global_1.addr = %3 : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          %4 = hec.addi %r_main_5.reg %muli_main_4.result {dump = "comb_53"} : (i32, i32) -> i32
          hec.assign %r_main_21.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_14.reg %muli_main_5.result {dump = "comb_54"} : (i32, i32) -> i32
          hec.assign %r_main_22.reg = %5 : i32 -> i32
          hec.assign %mem_global_3.addr = %5 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %6 = hec.addi %r_main_5.reg %muli_main_6.result {dump = "comb_55"} : (i32, i32) -> i32
          hec.assign %r_main_24.reg = %6 : i32 -> i32
          hec.transition {
            hec.goto @s42
          }
        }
        hec.state @s42 {
          hec.assign %r_main_12.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_20.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %r_main_23.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-432_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c-319_i32 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_21.reg : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          hec.assign %muli_main_2.operand0 = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c-432_i32 : i32 -> i32
          hec.transition {
            hec.goto @s43
          }
        }
        hec.state @s43 {
          hec.assign %r_main_8.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_18.reg : i32 -> i9
          hec.enable %mem_global_1.r_en : i1
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-160_i32 : i32 -> i32
          hec.transition {
            hec.goto @s44
          }
        }
        hec.state @s44 {
          hec.assign %r_main_10.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c160_i32 : i32 -> i32
          hec.transition {
            hec.goto @s45
          }
        }
        hec.state @s45 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_9.reg = %muli_main_2.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c217_i32 {dump = "comb_56"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c432_i32 : i32 -> i32
          hec.transition {
            hec.goto @s46
          }
        }
        hec.state @s46 {
          hec.assign %r_main_11.reg = %muli_main_0.result : i32 -> i32
          hec.transition {
            hec.goto @s47
          }
        }
        hec.state @s47 {
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_7.reg {dump = "comb_57"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.subi %0 %r_main_11.reg {dump = "comb_58"} : (i32, i32) -> i32
          %2 = hec.subi %1 %r_main_9.reg {dump = "comb_59"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %2 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_10.reg : i32 -> i32
          hec.transition {
            hec.goto @s48
          }
        }
        hec.state @s48 {
          hec.assign %r_main_12.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_17.reg : i32 -> i9
          hec.assign %mem_global_2.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.transition {
            hec.goto @s49
          }
        }
        hec.state @s49 {
          hec.transition {
            hec.goto @s50
          }
        }
        hec.state @s50 {
          hec.assign %mem_global_3.addr = %r_main_24.reg : i32 -> i9
          hec.assign %mem_global_3.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.transition {
            hec.goto @s51
          }
        }
        hec.state @s51 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_60"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_61"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s38_entry
          }
        }
        hec.state @s52 {
          hec.transition {
            hec.goto @s53
          }
        }
        hec.state @s53 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s53_0
          }
        }
        hec.state @s53_0 {
          hec.transition {
            hec.goto @s53_1
          }
        }
        hec.state @s53_1 {
          hec.transition {
            hec.goto @s54
          }
        }
        hec.state @s54 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c19_i32 {dump = "comb_62"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i9
          hec.assign %mem_global_0.w_data = %c1_i32 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s56
          }
        }
        hec.state @s55_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_63"} : i1
          hec.transition {
            hec.goto @s56
            hec.goto @s61 if %0
          }
        } {control = 1 : i32}
        hec.state @s56 {
          hec.assign %muli_main_0.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c20_i32 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %muli_main_7.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c20_i32 : i32 -> i32
          hec.transition {
            hec.goto @s56_0
          }
        }
        hec.state @s56_0 {
          hec.transition {
            hec.goto @s56_1
          }
        }
        hec.state @s56_1 {
          hec.transition {
            hec.goto @s57
          }
        }
        hec.state @s57 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_9.reg = %muli_main_3.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_4.result : i32 -> i32
          hec.assign %r_main_11.reg = %muli_main_5.result : i32 -> i32
          hec.assign %r_main_12.reg = %muli_main_6.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %c19_i32 {dump = "comb_64"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %muli_main_1.result {dump = "comb_65"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i9
          hec.enable %mem_global_2.r_en : i1
          %2 = hec.addi %muli_main_2.result %c20_i32 {dump = "comb_66"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %2 : i32 -> i32
          %3 = hec.addi %2 %muli_main_3.result {dump = "comb_67"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %3 : i32 -> i32
          hec.assign %mem_global_0.addr = %3 : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          %4 = hec.addi %muli_main_4.result %c19_i32 {dump = "comb_68"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %4 : i32 -> i32
          %5 = hec.addi %4 %muli_main_5.result {dump = "comb_69"} : (i32, i32) -> i32
          hec.assign %r_main_21.reg = %5 : i32 -> i32
          hec.assign %mem_global_3.addr = %5 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %6 = hec.addi %muli_main_6.result %c19_i32 {dump = "comb_70"} : (i32, i32) -> i32
          hec.assign %r_main_23.reg = %6 : i32 -> i32
          %7 = hec.addi %6 %muli_main_7.result {dump = "comb_71"} : (i32, i32) -> i32
          hec.assign %r_main_24.reg = %7 : i32 -> i32
          hec.transition {
            hec.goto @s58
          }
        }
        hec.state @s58 {
          hec.assign %r_main_19.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_22.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_0.r_data : i32 -> i32
          hec.transition {
            hec.goto @s58_0
          }
        }
        hec.state @s58_0 {
          hec.transition {
            hec.goto @s58_1
          }
        }
        hec.state @s58_1 {
          hec.transition {
            hec.goto @s59
          }
        }
        hec.state @s59 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_22.reg {dump = "comb_72"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_24.reg : i32 -> i9
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s60
          }
        }
        hec.state @s60 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_73"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_74"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s55_entry
          }
        }
        hec.state @s61 {
          hec.transition {
            hec.goto @s62
          }
        }
        hec.state @s62 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_75"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_76"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s33_entry
          }
        }
        hec.state @s63 {
          hec.transition {
            hec.goto @s64
          }
        }
        hec.state @s64 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_77"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c20_i32 {dump = "comb_78"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s65 {
          hec.transition {
            hec.goto @s66
          }
        }
        hec.state @s66 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_262"}
  }
  tor.design @kernel_adi {
    %c20_i32 = arith.constant {dump = "op_251"} 20 : i32
    %c19_i32 = arith.constant {dump = "op_249"} 19 : i32
    %c-1_i32 = arith.constant {dump = "op_247"} -1 : i32
    %c18_i32 = arith.constant {dump = "new_constant_0"} 18 : i32
    %c1_i32 = arith.constant {dump = "op_220"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_156"} 0 : i32
    %c380_i32 = arith.constant {dump = "unknown_2"} 380 : i32
    %c81_i32 = arith.constant {dump = "op_11"} 81 : i32
    %c-160_i32 = arith.constant {dump = "op_10"} -160 : i32
    %c217_i32 = arith.constant {dump = "op_9"} 217 : i32
    %c-432_i32 = arith.constant {dump = "op_8"} -432 : i32
    %c-319_i32 = arith.constant {dump = "op_7"} -319 : i32
    %c160_i32 = arith.constant {dump = "op_6"} 160 : i32
    %c-863_i32 = arith.constant {dump = "op_5"} -863 : i32
    %c432_i32 = arith.constant {dump = "op_4"} 432 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<400xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<400xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<400xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<400xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_262", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 66){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [8 : i32] [{type = "static:2"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [16 : i32] [{type = "static:1"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [18 : i32] [{type = "static:1"}]
        tor.succ 20 : [6 : i32] [{type = "static-for"}]
        tor.succ 21 : [20 : i32] [{type = "static"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static"}]
        tor.succ 24 : [23 : i32] [{type = "static:3"}]
        tor.succ 25 : [24 : i32] [{type = "static:1"}]
        tor.succ 26 : [25 : i32] [{type = "static:2"}]
        tor.succ 27 : [26 : i32] [{type = "static:1"}]
        tor.succ 28 : [27 : i32] [{type = "static:3"}]
        tor.succ 29 : [28 : i32] [{type = "static:1"}]
        tor.succ 30 : [22 : i32] [{type = "static-for"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
        tor.succ 32 : [1 : i32] [{type = "static-for"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
        tor.succ 34 : [33 : i32] [{type = "static"}]
        tor.succ 35 : [34 : i32] [{type = "static:3"}]
        tor.succ 36 : [35 : i32] [{type = "static:1"}]
        tor.succ 37 : [36 : i32] [{type = "static:1"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [38 : i32] [{type = "static"}]
        tor.succ 40 : [39 : i32] [{type = "static:1"}]
        tor.succ 41 : [40 : i32] [{type = "static:2"}]
        tor.succ 42 : [41 : i32] [{type = "static:1"}]
        tor.succ 43 : [42 : i32] [{type = "static:1"}]
        tor.succ 44 : [43 : i32] [{type = "static:1"}]
        tor.succ 45 : [44 : i32] [{type = "static:1"}]
        tor.succ 46 : [45 : i32] [{type = "static:1"}]
        tor.succ 47 : [46 : i32] [{type = "static:1"}]
        tor.succ 48 : [47 : i32] [{type = "static:1"}]
        tor.succ 49 : [48 : i32] [{type = "static:1"}]
        tor.succ 50 : [49 : i32] [{type = "static:1"}]
        tor.succ 51 : [50 : i32] [{type = "static:1"}]
        tor.succ 52 : [38 : i32] [{type = "static-for"}]
        tor.succ 53 : [52 : i32] [{type = "static"}]
        tor.succ 54 : [53 : i32] [{type = "static:3"}]
        tor.succ 55 : [54 : i32] [{type = "static:1"}]
        tor.succ 56 : [55 : i32] [{type = "static"}]
        tor.succ 57 : [56 : i32] [{type = "static:3"}]
        tor.succ 58 : [57 : i32] [{type = "static:1"}]
        tor.succ 59 : [58 : i32] [{type = "static:3"}]
        tor.succ 60 : [59 : i32] [{type = "static:1"}]
        tor.succ 61 : [55 : i32] [{type = "static-for"}]
        tor.succ 62 : [61 : i32] [{type = "static"}]
        tor.succ 63 : [33 : i32] [{type = "static-for"}]
        tor.succ 64 : [63 : i32] [{type = "static"}]
        tor.succ 65 : [0 : i32] [{type = "static-for"}]
        tor.succ 66 : [65 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c1_i32 : i32) to (%c20_i32 : i32) step (%c1_i32 : i32)
      on (0 to 64){
        tor.for %arg1 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
        on (1 to 31){
          %4 = tor.addi %arg1 %c0_i32 on (2 to 3) {dump = "op_23"} : (i32, i32) -> i32
          tor.store %c1_i32 to %1[%4] on (2 to 3) {dump = "op_24"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          %5 = tor.muli %arg1 %c20_i32 on (2 to 5) {dump = "op_27"} : (i32, i32) -> i32
          %6 = tor.addi %5 %c0_i32 on (5 to 6) {dump = "op_28"} : (i32, i32) -> i32
          tor.store %c0_i32 to %2[%6] on (5 to 6) {dump = "op_29"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          %7 = tor.addi %arg1 %c0_i32 on (2 to 3) {dump = "op_33"} : (i32, i32) -> i32
          %8 = tor.load %1[%7] on (3 to 4) {dump = "op_34"} : !tor.memref<400xi32, [], "rw">[i32]
          %9 = tor.muli %arg1 %c20_i32 on (2 to 5) {dump = "op_37"} : (i32, i32) -> i32
          %10 = tor.addi %9 %c0_i32 on (5 to 6) {dump = "op_38"} : (i32, i32) -> i32
          tor.store %8 to %3[%10] on (5 to 6) {dump = "op_39"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          tor.for %arg2 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
          on (6 to 19){
            %12 = tor.addi %arg2 %c-1_i32 on (7 to 8) {dump = "op_44"} : (i32, i32) -> i32
            %13 = tor.muli %arg1 %c20_i32 on (7 to 9) {dump = "op_46"} : (i32, i32) -> i32
            %14 = tor.addi %12 %13 on (9 to 10) {dump = "op_47"} : (i32, i32) -> i32
            %15 = tor.load %2[%14] on (9 to 10) {dump = "op_48"} : !tor.memref<400xi32, [], "rw">[i32]
            %16 = tor.muli %15 %c-160_i32 on (10 to 13) {dump = "op_49"} : (i32, i32) -> i32
            %17 = tor.addi %16 %c81_i32 on (13 to 14) {dump = "op_50"} : (i32, i32) -> i32
            %18 = tor.muli %17 %c160_i32 on (13 to 16) {dump = "op_51"} : (i32, i32) -> i32
            %19 = tor.muli %arg1 %c20_i32 on (7 to 9) {dump = "op_53"} : (i32, i32) -> i32
            %20 = tor.addi %arg2 %19 on (9 to 10) {dump = "op_54"} : (i32, i32) -> i32
            tor.store %18 to %2[%20] on (16 to 17) {dump = "op_55"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
            %21 = tor.addi %arg1 %c-1_i32 on (7 to 8) {dump = "op_57"} : (i32, i32) -> i32
            %22 = tor.muli %arg2 %c20_i32 on (7 to 9) {dump = "op_59"} : (i32, i32) -> i32
            %23 = tor.addi %21 %22 on (9 to 10) {dump = "op_60"} : (i32, i32) -> i32
            %24 = tor.load %0[%23] on (11 to 12) {dump = "op_61"} : !tor.memref<400xi32, [], "rw">[i32]
            %25 = tor.muli %24 %c432_i32 on (12 to 15) {dump = "op_62"} : (i32, i32) -> i32
            %26 = tor.muli %arg2 %c20_i32 on (7 to 9) {dump = "op_64"} : (i32, i32) -> i32
            %27 = tor.addi %arg1 %26 on (9 to 10) {dump = "op_65"} : (i32, i32) -> i32
            %28 = tor.load %0[%27] on (9 to 10) {dump = "op_66"} : !tor.memref<400xi32, [], "rw">[i32]
            %29 = tor.muli %28 %c-863_i32 on (10 to 13) {dump = "op_67"} : (i32, i32) -> i32
            %30 = tor.addi %25 %29 on (15 to 16) {dump = "op_68"} : (i32, i32) -> i32
            %31 = tor.addi %arg1 %c1_i32 on (7 to 8) {dump = "op_70"} : (i32, i32) -> i32
            %32 = tor.muli %arg2 %c20_i32 on (7 to 9) {dump = "op_72"} : (i32, i32) -> i32
            %33 = tor.addi %31 %32 on (9 to 10) {dump = "op_73"} : (i32, i32) -> i32
            %34 = tor.load %0[%33] on (10 to 11) {dump = "op_74"} : !tor.memref<400xi32, [], "rw">[i32]
            %35 = tor.muli %34 %c-432_i32 on (11 to 14) {dump = "op_75"} : (i32, i32) -> i32
            %36 = tor.subi %30 %35 on (15 to 16) {dump = "op_76"} : (i32, i32) -> i32
            %37 = tor.addi %arg2 %c-1_i32 on (7 to 8) {dump = "op_78"} : (i32, i32) -> i32
            %38 = tor.muli %arg1 %c20_i32 on (7 to 9) {dump = "op_80"} : (i32, i32) -> i32
            %39 = tor.addi %37 %38 on (9 to 10) {dump = "op_81"} : (i32, i32) -> i32
            %40 = tor.load %3[%39] on (9 to 10) {dump = "op_82"} : !tor.memref<400xi32, [], "rw">[i32]
            %41 = tor.muli %40 %c-160_i32 on (10 to 13) {dump = "op_83"} : (i32, i32) -> i32
            %42 = tor.subi %36 %41 on (15 to 16) {dump = "op_84"} : (i32, i32) -> i32
            %43 = tor.muli %42 %17 on (15 to 18) {dump = "op_85"} : (i32, i32) -> i32
            %44 = tor.muli %arg1 %c20_i32 on (7 to 9) {dump = "op_87"} : (i32, i32) -> i32
            %45 = tor.addi %arg2 %44 on (9 to 10) {dump = "op_88"} : (i32, i32) -> i32
            tor.store %43 to %3[%45] on (18 to 19) {dump = "op_89"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          } {dump = "op_91"}
          %11 = tor.addi %arg1 %c380_i32 on (21 to 22) {dump = "op_95"} : (i32, i32) -> i32
          tor.store %c1_i32 to %1[%11] on (21 to 22) {dump = "op_96"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          tor.for %arg2 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
          on (22 to 29){
            %12 = tor.muli %arg2 %c-1_i32 on (23 to 24) {dump = "op_101"} : (i32, i32) -> i32
            %13 = tor.addi %12 %c19_i32 on (24 to 25) {dump = "op_103"} : (i32, i32) -> i32
            %14 = tor.muli %arg1 %c20_i32 on (23 to 24) {dump = "op_105"} : (i32, i32) -> i32
            %15 = tor.addi %13 %14 on (24 to 25) {dump = "op_106"} : (i32, i32) -> i32
            %16 = tor.load %2[%15] on (24 to 25) {dump = "op_107"} : !tor.memref<400xi32, [], "rw">[i32]
            %17 = tor.muli %arg2 %c-1_i32 on (23 to 24) {dump = "op_109"} : (i32, i32) -> i32
            %18 = tor.addi %17 %c20_i32 on (24 to 25) {dump = "op_111"} : (i32, i32) -> i32
            %19 = tor.muli %18 %c20_i32 on (24 to 26) {dump = "op_113"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %19 on (26 to 27) {dump = "op_114"} : (i32, i32) -> i32
            %21 = tor.load %1[%20] on (26 to 27) {dump = "op_115"} : !tor.memref<400xi32, [], "rw">[i32]
            %22 = tor.muli %16 %21 on (27 to 28) {dump = "op_116"} : (i32, i32) -> i32
            %23 = tor.muli %arg2 %c-1_i32 on (23 to 24) {dump = "op_118"} : (i32, i32) -> i32
            %24 = tor.addi %23 %c19_i32 on (24 to 25) {dump = "op_120"} : (i32, i32) -> i32
            %25 = tor.muli %arg1 %c20_i32 on (23 to 24) {dump = "op_122"} : (i32, i32) -> i32
            %26 = tor.addi %24 %25 on (24 to 25) {dump = "op_123"} : (i32, i32) -> i32
            %27 = tor.load %3[%26] on (24 to 25) {dump = "op_124"} : !tor.memref<400xi32, [], "rw">[i32]
            %28 = tor.addi %22 %27 on (28 to 29) {dump = "op_125"} : (i32, i32) -> i32
            %29 = tor.muli %arg2 %c-1_i32 on (23 to 24) {dump = "op_127"} : (i32, i32) -> i32
            %30 = tor.addi %29 %c19_i32 on (24 to 25) {dump = "op_129"} : (i32, i32) -> i32
            %31 = tor.muli %30 %c20_i32 on (24 to 26) {dump = "op_131"} : (i32, i32) -> i32
            %32 = tor.addi %arg1 %31 on (26 to 27) {dump = "op_132"} : (i32, i32) -> i32
            tor.store %28 to %1[%32] on (28 to 29) {dump = "op_133"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          } {dump = "op_135"}
        } {dump = "op_137"}
        tor.for %arg1 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
        on (33 to 62){
          %4 = tor.muli %arg1 %c20_i32 on (34 to 35) {dump = "op_143"} : (i32, i32) -> i32
          %5 = tor.addi %4 %c0_i32 on (35 to 36) {dump = "op_144"} : (i32, i32) -> i32
          tor.store %c1_i32 to %0[%5] on (35 to 36) {dump = "op_145"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          %6 = tor.muli %arg1 %c20_i32 on (34 to 35) {dump = "op_148"} : (i32, i32) -> i32
          %7 = tor.addi %6 %c0_i32 on (35 to 36) {dump = "op_149"} : (i32, i32) -> i32
          tor.store %c0_i32 to %2[%7] on (35 to 36) {dump = "op_150"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          %8 = tor.muli %arg1 %c20_i32 on (34 to 35) {dump = "op_153"} : (i32, i32) -> i32
          %9 = tor.addi %8 %c0_i32 on (35 to 36) {dump = "op_154"} : (i32, i32) -> i32
          %10 = tor.load %0[%9] on (36 to 37) {dump = "op_155"} : !tor.memref<400xi32, [], "rw">[i32]
          %11 = tor.muli %arg1 %c20_i32 on (34 to 35) {dump = "op_158"} : (i32, i32) -> i32
          %12 = tor.addi %11 %c0_i32 on (35 to 36) {dump = "op_159"} : (i32, i32) -> i32
          tor.store %10 to %3[%12] on (37 to 38) {dump = "op_160"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          tor.for %arg2 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
          on (38 to 51){
            %15 = tor.addi %arg2 %c-1_i32 on (39 to 40) {dump = "op_165"} : (i32, i32) -> i32
            %16 = tor.muli %arg1 %c20_i32 on (39 to 41) {dump = "op_167"} : (i32, i32) -> i32
            %17 = tor.addi %15 %16 on (41 to 42) {dump = "op_168"} : (i32, i32) -> i32
            %18 = tor.load %2[%17] on (41 to 42) {dump = "op_169"} : !tor.memref<400xi32, [], "rw">[i32]
            %19 = tor.muli %18 %c-432_i32 on (42 to 45) {dump = "op_170"} : (i32, i32) -> i32
            %20 = tor.addi %19 %c217_i32 on (45 to 46) {dump = "op_171"} : (i32, i32) -> i32
            %21 = tor.muli %20 %c432_i32 on (45 to 48) {dump = "op_172"} : (i32, i32) -> i32
            %22 = tor.muli %arg1 %c20_i32 on (39 to 41) {dump = "op_174"} : (i32, i32) -> i32
            %23 = tor.addi %arg2 %22 on (41 to 42) {dump = "op_175"} : (i32, i32) -> i32
            tor.store %21 to %2[%23] on (48 to 49) {dump = "op_176"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
            %24 = tor.addi %arg1 %c-1_i32 on (39 to 40) {dump = "op_178"} : (i32, i32) -> i32
            %25 = tor.muli %24 %c20_i32 on (39 to 41) {dump = "op_180"} : (i32, i32) -> i32
            %26 = tor.addi %arg2 %25 on (41 to 42) {dump = "op_181"} : (i32, i32) -> i32
            %27 = tor.load %1[%26] on (43 to 44) {dump = "op_182"} : !tor.memref<400xi32, [], "rw">[i32]
            %28 = tor.muli %27 %c160_i32 on (44 to 47) {dump = "op_183"} : (i32, i32) -> i32
            %29 = tor.muli %arg1 %c20_i32 on (39 to 41) {dump = "op_185"} : (i32, i32) -> i32
            %30 = tor.addi %arg2 %29 on (41 to 42) {dump = "op_186"} : (i32, i32) -> i32
            %31 = tor.load %1[%30] on (41 to 42) {dump = "op_187"} : !tor.memref<400xi32, [], "rw">[i32]
            %32 = tor.muli %31 %c-319_i32 on (42 to 45) {dump = "op_188"} : (i32, i32) -> i32
            %33 = tor.addi %28 %32 on (47 to 48) {dump = "op_189"} : (i32, i32) -> i32
            %34 = tor.addi %arg1 %c1_i32 on (39 to 40) {dump = "op_191"} : (i32, i32) -> i32
            %35 = tor.muli %34 %c20_i32 on (39 to 41) {dump = "op_193"} : (i32, i32) -> i32
            %36 = tor.addi %arg2 %35 on (41 to 42) {dump = "op_194"} : (i32, i32) -> i32
            %37 = tor.load %1[%36] on (42 to 43) {dump = "op_195"} : !tor.memref<400xi32, [], "rw">[i32]
            %38 = tor.muli %37 %c-160_i32 on (43 to 46) {dump = "op_196"} : (i32, i32) -> i32
            %39 = tor.subi %33 %38 on (47 to 48) {dump = "op_197"} : (i32, i32) -> i32
            %40 = tor.addi %arg2 %c-1_i32 on (39 to 40) {dump = "op_199"} : (i32, i32) -> i32
            %41 = tor.muli %arg1 %c20_i32 on (39 to 41) {dump = "op_201"} : (i32, i32) -> i32
            %42 = tor.addi %40 %41 on (41 to 42) {dump = "op_202"} : (i32, i32) -> i32
            %43 = tor.load %3[%42] on (41 to 42) {dump = "op_203"} : !tor.memref<400xi32, [], "rw">[i32]
            %44 = tor.muli %43 %c-432_i32 on (42 to 45) {dump = "op_204"} : (i32, i32) -> i32
            %45 = tor.subi %39 %44 on (47 to 48) {dump = "op_205"} : (i32, i32) -> i32
            %46 = tor.muli %45 %20 on (47 to 50) {dump = "op_206"} : (i32, i32) -> i32
            %47 = tor.muli %arg1 %c20_i32 on (39 to 41) {dump = "op_208"} : (i32, i32) -> i32
            %48 = tor.addi %arg2 %47 on (41 to 42) {dump = "op_209"} : (i32, i32) -> i32
            tor.store %46 to %3[%48] on (50 to 51) {dump = "op_210"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          } {dump = "op_212"}
          %13 = tor.muli %arg1 %c20_i32 on (53 to 54) {dump = "op_215"} : (i32, i32) -> i32
          %14 = tor.addi %13 %c19_i32 on (54 to 55) {dump = "op_216"} : (i32, i32) -> i32
          tor.store %c1_i32 to %0[%14] on (54 to 55) {dump = "op_217"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          tor.for %arg2 = (%c1_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
          on (55 to 60){
            %15 = tor.muli %arg2 %c-1_i32 on (56 to 57) {dump = "op_222"} : (i32, i32) -> i32
            %16 = tor.addi %15 %c19_i32 on (57 to 58) {dump = "op_224"} : (i32, i32) -> i32
            %17 = tor.muli %arg1 %c20_i32 on (56 to 57) {dump = "op_226"} : (i32, i32) -> i32
            %18 = tor.addi %16 %17 on (57 to 58) {dump = "op_227"} : (i32, i32) -> i32
            %19 = tor.load %2[%18] on (57 to 58) {dump = "op_228"} : !tor.memref<400xi32, [], "rw">[i32]
            %20 = tor.muli %arg2 %c-1_i32 on (56 to 57) {dump = "op_230"} : (i32, i32) -> i32
            %21 = tor.addi %20 %c20_i32 on (57 to 58) {dump = "op_232"} : (i32, i32) -> i32
            %22 = tor.muli %arg1 %c20_i32 on (56 to 57) {dump = "op_234"} : (i32, i32) -> i32
            %23 = tor.addi %21 %22 on (57 to 58) {dump = "op_235"} : (i32, i32) -> i32
            %24 = tor.load %0[%23] on (57 to 58) {dump = "op_236"} : !tor.memref<400xi32, [], "rw">[i32]
            %25 = tor.muli %19 %24 on (58 to 59) {dump = "op_237"} : (i32, i32) -> i32
            %26 = tor.muli %arg2 %c-1_i32 on (56 to 57) {dump = "op_239"} : (i32, i32) -> i32
            %27 = tor.addi %26 %c19_i32 on (57 to 58) {dump = "op_241"} : (i32, i32) -> i32
            %28 = tor.muli %arg1 %c20_i32 on (56 to 57) {dump = "op_243"} : (i32, i32) -> i32
            %29 = tor.addi %27 %28 on (57 to 58) {dump = "op_244"} : (i32, i32) -> i32
            %30 = tor.load %3[%29] on (57 to 58) {dump = "op_245"} : !tor.memref<400xi32, [], "rw">[i32]
            %31 = tor.addi %25 %30 on (59 to 60) {dump = "op_246"} : (i32, i32) -> i32
            %32 = tor.muli %arg2 %c-1_i32 on (56 to 57) {dump = "op_248"} : (i32, i32) -> i32
            %33 = tor.addi %32 %c19_i32 on (57 to 58) {dump = "op_250"} : (i32, i32) -> i32
            %34 = tor.muli %arg1 %c20_i32 on (56 to 57) {dump = "op_252"} : (i32, i32) -> i32
            %35 = tor.addi %33 %34 on (57 to 58) {dump = "op_253"} : (i32, i32) -> i32
            tor.store %31 to %0[%35] on (59 to 60) {dump = "op_254"} : (i32, !tor.memref<400xi32, [], "rw">[i32])
          } {dump = "op_256"}
        } {dump = "op_258"}
      } {dump = "op_260"}
      tor.return {dump = "op_261"}
    }
  } {dump = "op_263", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

