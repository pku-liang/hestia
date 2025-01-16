module {
  hec.design @kernel_heat_3d {
    %true = arith.constant {dump = "const_85"} true
    %c-1_i32 = arith.constant {dump = "op_35"} -1 : i32
    %c10_i32 = arith.constant {dump = "op_18"} 10 : i32
    %c8_i32 = arith.constant {dump = "new_constant_5"} 8 : i32
    %c20_i32 = arith.constant {dump = "new_constant_6"} 20 : i32
    %c1_i32 = arith.constant {dump = "op_4"} 1 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 1000 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 1000 : i32, ports = "rw"} : i1, i1, i10, i32, i32
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
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i1
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i32
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      %r_main_13.reg = hec.primitive "r_main_13" is "register" : i32
      %r_main_14.reg = hec.primitive "r_main_14" is "register" : i32
      %r_main_15.reg = hec.primitive "r_main_15" is "register" : i32
      %r_main_16.reg = hec.primitive "r_main_16" is "register" : i32
      %r_main_17.reg = hec.primitive "r_main_17" is "register" : i32
      %r_main_18.reg = hec.primitive "r_main_18" is "register" : i32
      %r_main_19.reg = hec.primitive "r_main_19" is "register" : i32
      %r_main_20.reg = hec.primitive "r_main_20" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s48 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s23 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        } {control = 1 : i32}
        hec.state @s2_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_2"} : i1
          hec.transition {
            hec.goto @s3
            hec.goto @s21 if %0
          }
        } {control = 1 : i32}
        hec.state @s3 {
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        } {control = 1 : i32}
        hec.state @s3_entry {
          %0 = hec.not %r_main_3.reg {dump = "comb_3"} : i1
          hec.transition {
            hec.goto @s4
            hec.goto @s19 if %0
          }
        } {control = 1 : i32}
        hec.state @s4 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c10_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c10_i32 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c10_i32 : i32 -> i32
          %2 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %2 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c10_i32 : i32 -> i32
          %3 = hec.addi %r_main_6.reg %c-1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %3 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c10_i32 : i32 -> i32
          %4 = hec.addi %r_main_7.reg %c1_i32 {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %4 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c10_i32 : i32 -> i32
          %5 = hec.addi %r_main_7.reg %c-1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %5 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c10_i32 : i32 -> i32
          hec.assign %muli_main_7.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c10_i32 : i32 -> i32
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.transition {
            hec.goto @s5_0
          }
        }
        hec.state @s5_0 {
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          hec.assign %r_main_9.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_12.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_14.reg = %muli_main_3.result : i32 -> i32
          hec.assign %r_main_16.reg = %muli_main_4.result : i32 -> i32
          hec.assign %r_main_18.reg = %muli_main_5.result : i32 -> i32
          hec.assign %r_main_20.reg = %muli_main_6.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c10_i32 : i32 -> i32
          %1 = hec.addi %r_main_6.reg %muli_main_1.result {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %muli_main_1.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c10_i32 : i32 -> i32
          %2 = hec.addi %r_main_6.reg %muli_main_2.result {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %muli_main_2.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c10_i32 : i32 -> i32
          %3 = hec.addi %r_main_13.reg %muli_main_3.result {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %muli_main_3.operand0 = %3 : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c10_i32 : i32 -> i32
          %4 = hec.addi %r_main_15.reg %muli_main_4.result {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %muli_main_4.operand0 = %4 : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c10_i32 : i32 -> i32
          %5 = hec.addi %r_main_6.reg %muli_main_5.result {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %muli_main_5.operand0 = %5 : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c10_i32 : i32 -> i32
          %6 = hec.addi %r_main_6.reg %muli_main_6.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %muli_main_6.operand0 = %6 : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c10_i32 : i32 -> i32
          %7 = hec.addi %r_main_6.reg %muli_main_7.result {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %muli_main_7.operand0 = %7 : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c10_i32 : i32 -> i32
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          hec.transition {
            hec.goto @s7_0
          }
        }
        hec.state @s7_0 {
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.assign %r_main_11.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_7.reg %muli_main_0.result {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_7.reg %muli_main_1.result {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_7.reg %muli_main_2.result {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_7.reg %muli_main_3.result {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_7.reg %muli_main_4.result {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_17.reg %muli_main_5.result {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %5 : i32 -> i32
          %6 = hec.addi %r_main_19.reg %muli_main_6.result {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %6 : i32 -> i32
          hec.assign %mem_global_0.addr = %6 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %7 = hec.addi %r_main_7.reg %muli_main_7.result {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %7 : i32 -> i32
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          hec.assign %r_main_16.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_14.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_11.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_9.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %r_main_14.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.shift_left %mem_global_0.r_data %c1_i32 {dump = "comb_26"} : i32
          hec.assign %r_main_9.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_13.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.subi %r_main_11.reg %0 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %1 : i32 -> i32
          %2 = hec.addi %1 %r_main_16.reg {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %2 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_15.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_12.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %r_main_11.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_10.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %0 = hec.subi %mem_global_0.r_data %r_main_9.reg {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_15.reg {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %1 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_20.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_12.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_8.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          hec.assign %r_main_10.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.subi %mem_global_0.r_data %r_main_9.reg {dump = "comb_31"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_12.reg {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %1 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
          hec.assign %r_main_17.reg = %muli_main_0.result : i32 -> i32
          hec.transition {
            hec.goto @s16_0
          }
        }
        hec.state @s16_0 {
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          hec.assign %r_main_13.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_17.reg {dump = "comb_33"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_20.reg {dump = "comb_34"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          %2 = hec.addi %1 %r_main_14.reg {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %2 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_18.reg : i32 -> i10
          hec.assign %mem_global_1.w_data = %2 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          %0 = hec.addi %r_main_7.reg %c1_i32 {dump = "comb_36"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_37"} : (i32, i32) -> i1
          hec.assign %r_main_3.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s3_entry
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          %0 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_38"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_39"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s2_entry
          }
        }
        hec.state @s21 {
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_40"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_41"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s23 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s24_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_42"} : i1
          hec.transition {
            hec.goto @s25
            hec.goto @s46 if %0
          }
        } {control = 1 : i32}
        hec.state @s25 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s27
          }
        } {control = 1 : i32}
        hec.state @s25_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_43"} : i1
          hec.transition {
            hec.goto @s26
            hec.goto @s44 if %0
          }
        } {control = 1 : i32}
        hec.state @s26 {
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s27
          }
        } {control = 1 : i32}
        hec.state @s26_entry {
          %0 = hec.not %r_main_3.reg {dump = "comb_44"} : i1
          hec.transition {
            hec.goto @s27
            hec.goto @s42 if %0
          }
        } {control = 1 : i32}
        hec.state @s27 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_45"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c10_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c10_i32 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_46"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %1 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c10_i32 : i32 -> i32
          %2 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_47"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %2 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c10_i32 : i32 -> i32
          %3 = hec.addi %r_main_6.reg %c-1_i32 {dump = "comb_48"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %3 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c10_i32 : i32 -> i32
          %4 = hec.addi %r_main_7.reg %c1_i32 {dump = "comb_49"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %4 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c10_i32 : i32 -> i32
          %5 = hec.addi %r_main_7.reg %c-1_i32 {dump = "comb_50"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %5 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c10_i32 : i32 -> i32
          hec.assign %muli_main_7.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c10_i32 : i32 -> i32
          hec.transition {
            hec.goto @s28
          }
        }
        hec.state @s28 {
          hec.transition {
            hec.goto @s28_0
          }
        }
        hec.state @s28_0 {
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          hec.assign %r_main_9.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_12.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_14.reg = %muli_main_3.result : i32 -> i32
          hec.assign %r_main_16.reg = %muli_main_4.result : i32 -> i32
          hec.assign %r_main_18.reg = %muli_main_5.result : i32 -> i32
          hec.assign %r_main_20.reg = %muli_main_6.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_51"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c10_i32 : i32 -> i32
          %1 = hec.addi %r_main_6.reg %muli_main_1.result {dump = "comb_52"} : (i32, i32) -> i32
          hec.assign %muli_main_1.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c10_i32 : i32 -> i32
          %2 = hec.addi %r_main_6.reg %muli_main_2.result {dump = "comb_53"} : (i32, i32) -> i32
          hec.assign %muli_main_2.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c10_i32 : i32 -> i32
          %3 = hec.addi %r_main_13.reg %muli_main_3.result {dump = "comb_54"} : (i32, i32) -> i32
          hec.assign %muli_main_3.operand0 = %3 : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c10_i32 : i32 -> i32
          %4 = hec.addi %r_main_15.reg %muli_main_4.result {dump = "comb_55"} : (i32, i32) -> i32
          hec.assign %muli_main_4.operand0 = %4 : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c10_i32 : i32 -> i32
          %5 = hec.addi %r_main_6.reg %muli_main_5.result {dump = "comb_56"} : (i32, i32) -> i32
          hec.assign %muli_main_5.operand0 = %5 : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c10_i32 : i32 -> i32
          %6 = hec.addi %r_main_6.reg %muli_main_6.result {dump = "comb_57"} : (i32, i32) -> i32
          hec.assign %muli_main_6.operand0 = %6 : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c10_i32 : i32 -> i32
          %7 = hec.addi %r_main_6.reg %muli_main_7.result {dump = "comb_58"} : (i32, i32) -> i32
          hec.assign %muli_main_7.operand0 = %7 : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c10_i32 : i32 -> i32
          hec.transition {
            hec.goto @s30
          }
        }
        hec.state @s30 {
          hec.transition {
            hec.goto @s30_0
          }
        }
        hec.state @s30_0 {
          hec.transition {
            hec.goto @s31
          }
        }
        hec.state @s31 {
          hec.assign %r_main_11.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_7.reg %muli_main_0.result {dump = "comb_59"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_7.reg %muli_main_1.result {dump = "comb_60"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_7.reg %muli_main_2.result {dump = "comb_61"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_7.reg %muli_main_3.result {dump = "comb_62"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_7.reg %muli_main_4.result {dump = "comb_63"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %4 : i32 -> i32
          %5 = hec.addi %r_main_17.reg %muli_main_5.result {dump = "comb_64"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %5 : i32 -> i32
          %6 = hec.addi %r_main_19.reg %muli_main_6.result {dump = "comb_65"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %6 : i32 -> i32
          hec.assign %mem_global_1.addr = %6 : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %7 = hec.addi %r_main_7.reg %muli_main_7.result {dump = "comb_66"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %7 : i32 -> i32
          hec.transition {
            hec.goto @s32
          }
        }
        hec.state @s32 {
          hec.assign %r_main_16.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_14.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s33
          }
        }
        hec.state @s33 {
          hec.assign %r_main_11.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_9.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s34
          }
        }
        hec.state @s34 {
          hec.assign %r_main_14.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.shift_left %mem_global_1.r_data %c1_i32 {dump = "comb_67"} : i32
          hec.assign %r_main_9.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_13.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.subi %r_main_11.reg %0 {dump = "comb_68"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %1 : i32 -> i32
          %2 = hec.addi %1 %r_main_16.reg {dump = "comb_69"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %2 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s35
          }
        }
        hec.state @s35 {
          hec.assign %r_main_15.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_12.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s36
          }
        }
        hec.state @s36 {
          hec.assign %r_main_11.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_10.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %0 = hec.subi %mem_global_1.r_data %r_main_9.reg {dump = "comb_70"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_15.reg {dump = "comb_71"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %1 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s37
          }
        }
        hec.state @s37 {
          hec.assign %r_main_20.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_12.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_8.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s38
          }
        }
        hec.state @s38 {
          hec.assign %r_main_10.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.subi %mem_global_1.r_data %r_main_9.reg {dump = "comb_72"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_12.reg {dump = "comb_73"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %1 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s39
          }
        }
        hec.state @s39 {
          hec.assign %r_main_17.reg = %muli_main_0.result : i32 -> i32
          hec.transition {
            hec.goto @s39_0
          }
        }
        hec.state @s39_0 {
          hec.transition {
            hec.goto @s40
          }
        }
        hec.state @s40 {
          hec.assign %r_main_13.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_17.reg {dump = "comb_74"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_20.reg {dump = "comb_75"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          %2 = hec.addi %1 %r_main_14.reg {dump = "comb_76"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %2 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_18.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %2 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s41
          }
        }
        hec.state @s41 {
          %0 = hec.addi %r_main_7.reg %c1_i32 {dump = "comb_77"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_78"} : (i32, i32) -> i1
          hec.assign %r_main_3.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s26_entry
          }
        }
        hec.state @s42 {
          hec.transition {
            hec.goto @s43
          }
        }
        hec.state @s43 {
          %0 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_79"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_80"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s25_entry
          }
        }
        hec.state @s44 {
          hec.transition {
            hec.goto @s45
          }
        }
        hec.state @s45 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_81"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c8_i32 {dump = "comb_82"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s24_entry
          }
        }
        hec.state @s46 {
          hec.transition {
            hec.goto @s47
          }
        }
        hec.state @s47 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_83"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c20_i32 {dump = "comb_84"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s48 {
          hec.transition {
            hec.goto @s49
          }
        }
        hec.state @s49 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_204"}
  }
  tor.design @kernel_heat_3d {
    %c10_i32 = arith.constant {dump = "op_191"} 10 : i32
    %c-1_i32 = arith.constant {dump = "op_175"} -1 : i32
    %c1_i32 = arith.constant {dump = "op_165"} 1 : i32
    %c8_i32 = arith.constant {dump = "new_constant_0"} 8 : i32
    %c20_i32 = arith.constant {dump = "new_constant_6"} 20 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1000xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<1000xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_204", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 49){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static"}]
        tor.succ 4 : [3 : i32] [{type = "static"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [5 : i32] [{type = "static:2"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:2"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [16 : i32] [{type = "static:2"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [3 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [2 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
        tor.succ 23 : [1 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
        tor.succ 25 : [24 : i32] [{type = "static"}]
        tor.succ 26 : [25 : i32] [{type = "static"}]
        tor.succ 27 : [26 : i32] [{type = "static"}]
        tor.succ 28 : [27 : i32] [{type = "static:1"}]
        tor.succ 29 : [28 : i32] [{type = "static:2"}]
        tor.succ 30 : [29 : i32] [{type = "static:1"}]
        tor.succ 31 : [30 : i32] [{type = "static:2"}]
        tor.succ 32 : [31 : i32] [{type = "static:1"}]
        tor.succ 33 : [32 : i32] [{type = "static:1"}]
        tor.succ 34 : [33 : i32] [{type = "static:1"}]
        tor.succ 35 : [34 : i32] [{type = "static:1"}]
        tor.succ 36 : [35 : i32] [{type = "static:1"}]
        tor.succ 37 : [36 : i32] [{type = "static:1"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [38 : i32] [{type = "static:1"}]
        tor.succ 40 : [39 : i32] [{type = "static:2"}]
        tor.succ 41 : [40 : i32] [{type = "static:1"}]
        tor.succ 42 : [26 : i32] [{type = "static-for"}]
        tor.succ 43 : [42 : i32] [{type = "static"}]
        tor.succ 44 : [25 : i32] [{type = "static-for"}]
        tor.succ 45 : [44 : i32] [{type = "static"}]
        tor.succ 46 : [24 : i32] [{type = "static-for"}]
        tor.succ 47 : [46 : i32] [{type = "static"}]
        tor.succ 48 : [0 : i32] [{type = "static-for"}]
        tor.succ 49 : [48 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c1_i32 : i32) to (%c20_i32 : i32) step (%c1_i32 : i32)
      on (0 to 47){
        tor.for %arg1 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
        on (1 to 22){
          tor.for %arg2 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
          on (2 to 20){
            tor.for %arg3 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
            on (3 to 18){
              %2 = tor.addi %arg1 %c1_i32 on (4 to 5) {dump = "op_17"} : (i32, i32) -> i32
              %3 = tor.muli %2 %c10_i32 on (4 to 6) {dump = "op_19"} : (i32, i32) -> i32
              %4 = tor.addi %arg2 %3 on (6 to 7) {dump = "op_20"} : (i32, i32) -> i32
              %5 = tor.muli %4 %c10_i32 on (6 to 8) {dump = "op_22"} : (i32, i32) -> i32
              %6 = tor.addi %arg3 %5 on (8 to 9) {dump = "op_23"} : (i32, i32) -> i32
              %7 = tor.load %0[%6] on (14 to 15) {dump = "op_24"} : !tor.memref<1000xi32, [], "rw">[i32]
              %8 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_26"} : (i32, i32) -> i32
              %9 = tor.addi %arg2 %8 on (6 to 7) {dump = "op_27"} : (i32, i32) -> i32
              %10 = tor.muli %9 %c10_i32 on (6 to 8) {dump = "op_29"} : (i32, i32) -> i32
              %11 = tor.addi %arg3 %10 on (8 to 9) {dump = "op_30"} : (i32, i32) -> i32
              %12 = tor.load %0[%11] on (10 to 11) {dump = "op_31"} : !tor.memref<1000xi32, [], "rw">[i32]
              %13 = arith.shli %12, %c1_i32 {dump = "op_33", endtime = 12 : i32, starttime = 11 : i32} : i32
              %14 = tor.subi %7 %13 on (15 to 16) {dump = "op_34"} : (i32, i32) -> i32
              %15 = tor.addi %arg1 %c-1_i32 on (4 to 5) {dump = "op_36"} : (i32, i32) -> i32
              %16 = tor.muli %15 %c10_i32 on (4 to 6) {dump = "op_38"} : (i32, i32) -> i32
              %17 = tor.addi %arg2 %16 on (6 to 7) {dump = "op_39"} : (i32, i32) -> i32
              %18 = tor.muli %17 %c10_i32 on (6 to 8) {dump = "op_41"} : (i32, i32) -> i32
              %19 = tor.addi %arg3 %18 on (8 to 9) {dump = "op_42"} : (i32, i32) -> i32
              %20 = tor.load %0[%19] on (13 to 14) {dump = "op_43"} : !tor.memref<1000xi32, [], "rw">[i32]
              %21 = tor.addi %14 %20 on (15 to 16) {dump = "op_44"} : (i32, i32) -> i32
              %22 = tor.muli %21 %c12_i32 on (15 to 17) {dump = "op_45"} : (i32, i32) -> i32
              %23 = tor.addi %arg2 %c1_i32 on (4 to 5) {dump = "op_47"} : (i32, i32) -> i32
              %24 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_49"} : (i32, i32) -> i32
              %25 = tor.addi %23 %24 on (6 to 7) {dump = "op_50"} : (i32, i32) -> i32
              %26 = tor.muli %25 %c10_i32 on (6 to 8) {dump = "op_52"} : (i32, i32) -> i32
              %27 = tor.addi %arg3 %26 on (8 to 9) {dump = "op_53"} : (i32, i32) -> i32
              %28 = tor.load %0[%27] on (12 to 13) {dump = "op_54"} : !tor.memref<1000xi32, [], "rw">[i32]
              %29 = tor.subi %28 %13 on (13 to 14) {dump = "op_55"} : (i32, i32) -> i32
              %30 = tor.addi %arg2 %c-1_i32 on (4 to 5) {dump = "op_57"} : (i32, i32) -> i32
              %31 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_59"} : (i32, i32) -> i32
              %32 = tor.addi %30 %31 on (6 to 7) {dump = "op_60"} : (i32, i32) -> i32
              %33 = tor.muli %32 %c10_i32 on (6 to 8) {dump = "op_62"} : (i32, i32) -> i32
              %34 = tor.addi %arg3 %33 on (8 to 9) {dump = "op_63"} : (i32, i32) -> i32
              %35 = tor.load %0[%34] on (11 to 12) {dump = "op_64"} : !tor.memref<1000xi32, [], "rw">[i32]
              %36 = tor.addi %29 %35 on (13 to 14) {dump = "op_65"} : (i32, i32) -> i32
              %37 = tor.muli %36 %c12_i32 on (13 to 16) {dump = "op_66"} : (i32, i32) -> i32
              %38 = tor.addi %22 %37 on (17 to 18) {dump = "op_67"} : (i32, i32) -> i32
              %39 = tor.addi %arg3 %c1_i32 on (4 to 5) {dump = "op_69"} : (i32, i32) -> i32
              %40 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_71"} : (i32, i32) -> i32
              %41 = tor.addi %arg2 %40 on (6 to 7) {dump = "op_72"} : (i32, i32) -> i32
              %42 = tor.muli %41 %c10_i32 on (6 to 8) {dump = "op_74"} : (i32, i32) -> i32
              %43 = tor.addi %39 %42 on (8 to 9) {dump = "op_75"} : (i32, i32) -> i32
              %44 = tor.load %0[%43] on (9 to 10) {dump = "op_76"} : !tor.memref<1000xi32, [], "rw">[i32]
              %45 = tor.subi %44 %13 on (11 to 12) {dump = "op_77"} : (i32, i32) -> i32
              %46 = tor.addi %arg3 %c-1_i32 on (4 to 5) {dump = "op_79"} : (i32, i32) -> i32
              %47 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_81"} : (i32, i32) -> i32
              %48 = tor.addi %arg2 %47 on (6 to 7) {dump = "op_82"} : (i32, i32) -> i32
              %49 = tor.muli %48 %c10_i32 on (6 to 8) {dump = "op_84"} : (i32, i32) -> i32
              %50 = tor.addi %46 %49 on (8 to 9) {dump = "op_85"} : (i32, i32) -> i32
              %51 = tor.load %0[%50] on (8 to 9) {dump = "op_86"} : !tor.memref<1000xi32, [], "rw">[i32]
              %52 = tor.addi %45 %51 on (11 to 12) {dump = "op_87"} : (i32, i32) -> i32
              %53 = tor.muli %52 %c12_i32 on (11 to 14) {dump = "op_88"} : (i32, i32) -> i32
              %54 = tor.addi %38 %53 on (17 to 18) {dump = "op_89"} : (i32, i32) -> i32
              %55 = tor.addi %54 %12 on (17 to 18) {dump = "op_90"} : (i32, i32) -> i32
              %56 = tor.muli %arg1 %c10_i32 on (4 to 6) {dump = "op_92"} : (i32, i32) -> i32
              %57 = tor.addi %arg2 %56 on (6 to 7) {dump = "op_93"} : (i32, i32) -> i32
              %58 = tor.muli %57 %c10_i32 on (6 to 8) {dump = "op_95"} : (i32, i32) -> i32
              %59 = tor.addi %arg3 %58 on (8 to 9) {dump = "op_96"} : (i32, i32) -> i32
              tor.store %55 to %1[%59] on (17 to 18) {dump = "op_97"} : (i32, !tor.memref<1000xi32, [], "rw">[i32])
            } {dump = "op_99"}
          } {dump = "op_101"}
        } {dump = "op_103"}
        tor.for %arg1 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
        on (24 to 45){
          tor.for %arg2 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
          on (25 to 43){
            tor.for %arg3 = (%c1_i32 : i32) to (%c8_i32 : i32) step (%c1_i32 : i32)
            on (26 to 41){
              %2 = tor.addi %arg1 %c1_i32 on (27 to 28) {dump = "op_114"} : (i32, i32) -> i32
              %3 = tor.muli %2 %c10_i32 on (27 to 29) {dump = "op_116"} : (i32, i32) -> i32
              %4 = tor.addi %arg2 %3 on (29 to 30) {dump = "op_117"} : (i32, i32) -> i32
              %5 = tor.muli %4 %c10_i32 on (29 to 31) {dump = "op_119"} : (i32, i32) -> i32
              %6 = tor.addi %arg3 %5 on (31 to 32) {dump = "op_120"} : (i32, i32) -> i32
              %7 = tor.load %1[%6] on (37 to 38) {dump = "op_121"} : !tor.memref<1000xi32, [], "rw">[i32]
              %8 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_123"} : (i32, i32) -> i32
              %9 = tor.addi %arg2 %8 on (29 to 30) {dump = "op_124"} : (i32, i32) -> i32
              %10 = tor.muli %9 %c10_i32 on (29 to 31) {dump = "op_126"} : (i32, i32) -> i32
              %11 = tor.addi %arg3 %10 on (31 to 32) {dump = "op_127"} : (i32, i32) -> i32
              %12 = tor.load %1[%11] on (33 to 34) {dump = "op_128"} : !tor.memref<1000xi32, [], "rw">[i32]
              %13 = arith.shli %12, %c1_i32 {dump = "op_130", endtime = 35 : i32, starttime = 34 : i32} : i32
              %14 = tor.subi %7 %13 on (38 to 39) {dump = "op_131"} : (i32, i32) -> i32
              %15 = tor.addi %arg1 %c-1_i32 on (27 to 28) {dump = "op_133"} : (i32, i32) -> i32
              %16 = tor.muli %15 %c10_i32 on (27 to 29) {dump = "op_135"} : (i32, i32) -> i32
              %17 = tor.addi %arg2 %16 on (29 to 30) {dump = "op_136"} : (i32, i32) -> i32
              %18 = tor.muli %17 %c10_i32 on (29 to 31) {dump = "op_138"} : (i32, i32) -> i32
              %19 = tor.addi %arg3 %18 on (31 to 32) {dump = "op_139"} : (i32, i32) -> i32
              %20 = tor.load %1[%19] on (36 to 37) {dump = "op_140"} : !tor.memref<1000xi32, [], "rw">[i32]
              %21 = tor.addi %14 %20 on (38 to 39) {dump = "op_141"} : (i32, i32) -> i32
              %22 = tor.muli %21 %c12_i32 on (38 to 40) {dump = "op_142"} : (i32, i32) -> i32
              %23 = tor.addi %arg2 %c1_i32 on (27 to 28) {dump = "op_144"} : (i32, i32) -> i32
              %24 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_146"} : (i32, i32) -> i32
              %25 = tor.addi %23 %24 on (29 to 30) {dump = "op_147"} : (i32, i32) -> i32
              %26 = tor.muli %25 %c10_i32 on (29 to 31) {dump = "op_149"} : (i32, i32) -> i32
              %27 = tor.addi %arg3 %26 on (31 to 32) {dump = "op_150"} : (i32, i32) -> i32
              %28 = tor.load %1[%27] on (35 to 36) {dump = "op_151"} : !tor.memref<1000xi32, [], "rw">[i32]
              %29 = tor.subi %28 %13 on (36 to 37) {dump = "op_152"} : (i32, i32) -> i32
              %30 = tor.addi %arg2 %c-1_i32 on (27 to 28) {dump = "op_154"} : (i32, i32) -> i32
              %31 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_156"} : (i32, i32) -> i32
              %32 = tor.addi %30 %31 on (29 to 30) {dump = "op_157"} : (i32, i32) -> i32
              %33 = tor.muli %32 %c10_i32 on (29 to 31) {dump = "op_159"} : (i32, i32) -> i32
              %34 = tor.addi %arg3 %33 on (31 to 32) {dump = "op_160"} : (i32, i32) -> i32
              %35 = tor.load %1[%34] on (34 to 35) {dump = "op_161"} : !tor.memref<1000xi32, [], "rw">[i32]
              %36 = tor.addi %29 %35 on (36 to 37) {dump = "op_162"} : (i32, i32) -> i32
              %37 = tor.muli %36 %c12_i32 on (36 to 39) {dump = "op_163"} : (i32, i32) -> i32
              %38 = tor.addi %22 %37 on (40 to 41) {dump = "op_164"} : (i32, i32) -> i32
              %39 = tor.addi %arg3 %c1_i32 on (27 to 28) {dump = "op_166"} : (i32, i32) -> i32
              %40 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_168"} : (i32, i32) -> i32
              %41 = tor.addi %arg2 %40 on (29 to 30) {dump = "op_169"} : (i32, i32) -> i32
              %42 = tor.muli %41 %c10_i32 on (29 to 31) {dump = "op_171"} : (i32, i32) -> i32
              %43 = tor.addi %39 %42 on (31 to 32) {dump = "op_172"} : (i32, i32) -> i32
              %44 = tor.load %1[%43] on (32 to 33) {dump = "op_173"} : !tor.memref<1000xi32, [], "rw">[i32]
              %45 = tor.subi %44 %13 on (34 to 35) {dump = "op_174"} : (i32, i32) -> i32
              %46 = tor.addi %arg3 %c-1_i32 on (27 to 28) {dump = "op_176"} : (i32, i32) -> i32
              %47 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_178"} : (i32, i32) -> i32
              %48 = tor.addi %arg2 %47 on (29 to 30) {dump = "op_179"} : (i32, i32) -> i32
              %49 = tor.muli %48 %c10_i32 on (29 to 31) {dump = "op_181"} : (i32, i32) -> i32
              %50 = tor.addi %46 %49 on (31 to 32) {dump = "op_182"} : (i32, i32) -> i32
              %51 = tor.load %1[%50] on (31 to 32) {dump = "op_183"} : !tor.memref<1000xi32, [], "rw">[i32]
              %52 = tor.addi %45 %51 on (34 to 35) {dump = "op_184"} : (i32, i32) -> i32
              %53 = tor.muli %52 %c12_i32 on (34 to 37) {dump = "op_185"} : (i32, i32) -> i32
              %54 = tor.addi %38 %53 on (40 to 41) {dump = "op_186"} : (i32, i32) -> i32
              %55 = tor.addi %54 %12 on (40 to 41) {dump = "op_187"} : (i32, i32) -> i32
              %56 = tor.muli %arg1 %c10_i32 on (27 to 29) {dump = "op_189"} : (i32, i32) -> i32
              %57 = tor.addi %arg2 %56 on (29 to 30) {dump = "op_190"} : (i32, i32) -> i32
              %58 = tor.muli %57 %c10_i32 on (29 to 31) {dump = "op_192"} : (i32, i32) -> i32
              %59 = tor.addi %arg3 %58 on (31 to 32) {dump = "op_193"} : (i32, i32) -> i32
              tor.store %55 to %0[%59] on (40 to 41) {dump = "op_194"} : (i32, !tor.memref<1000xi32, [], "rw">[i32])
            } {dump = "op_196"}
          } {dump = "op_198"}
        } {dump = "op_200"}
      } {dump = "op_202"}
      tor.return {dump = "op_203"}
    }
  } {dump = "op_205", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

