module {
  hec.design @kernel_3mm {
    %true = arith.constant {dump = "const_45"} true
    %c23_i32 = arith.constant {dump = "new_constant_3"} 23 : i32
    %c24_i32 = arith.constant {dump = "op_56"} 24 : i32
    %c21_i32 = arith.constant {dump = "new_constant_4"} 21 : i32
    %c22_i32 = arith.constant {dump = "op_49"} 22 : i32
    %c19_i32 = arith.constant {dump = "new_constant_6"} 19 : i32
    %c20_i32 = arith.constant {dump = "op_19"} 20 : i32
    %c17_i32 = arith.constant {dump = "new_constant_7"} 17 : i32
    %c18_i32 = arith.constant {dump = "op_12"} 18 : i32
    %c15_i32 = arith.constant {dump = "new_constant_8"} 15 : i32
    %c1_i32 = arith.constant {dump = "op_10"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_7"} 0 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 288 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 320 : i32, ports = "r"} : i1, i9, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 360 : i32, ports = "r"} : i1, i9, i32
    %mem_global_3.w_en, %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.w_data, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 396 : i32, ports = "rw"} : i1, i1, i9, i32, i32
    %mem_global_4.r_en, %mem_global_4.addr, %mem_global_4.r_data = hec.primitive "mem_global_4" is "mem" {len = 432 : i32, ports = "r"} : i1, i9, i32
    %mem_global_5.r_en, %mem_global_5.addr, %mem_global_5.r_data = hec.primitive "mem_global_5" is "mem" {len = 528 : i32, ports = "r"} : i1, i10, i32
    %mem_global_6.w_en, %mem_global_6.r_en, %mem_global_6.addr, %mem_global_6.w_data, %mem_global_6.r_data = hec.primitive "mem_global_6" is "mem" {len = 352 : i32, ports = "rw"} : i1, i1, i9, i32, i32
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
            hec.goto @s14 if %0
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
            hec.goto @s12 if %0
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
            hec.goto @s10 if %0
          }
        } {control = 1 : i32}
        hec.state @s5 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c20_i32 : i32 -> i32
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
          hec.assign %r_main_15.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_2.r_data : i32 -> i32
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
          %0 = hec.addi %r_main_15.reg %muli_main_0.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %r_main_16.reg : i32 -> i9
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_10"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s4_entry
          }
        }
        hec.state @s10 {
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c17_i32 {dump = "comb_12"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s12 {
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c15_i32 {dump = "comb_14"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s14 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s15_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_15"} : i1
          hec.transition {
            hec.goto @s16
            hec.goto @s29 if %0
          }
        } {control = 1 : i32}
        hec.state @s16 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s17
          }
        } {control = 1 : i32}
        hec.state @s16_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_16"} : i1
          hec.transition {
            hec.goto @s17
            hec.goto @s27 if %0
          }
        } {control = 1 : i32}
        hec.state @s17 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c22_i32 : i32 -> i32
          hec.transition {
            hec.goto @s17_0
          }
        }
        hec.state @s17_0 {
          hec.transition {
            hec.goto @s17_1
          }
        }
        hec.state @s17_1 {
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %mem_global_3.addr = %0 : i32 -> i9
          hec.assign %mem_global_3.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s19_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_18"} : i1
          hec.transition {
            hec.goto @s20
            hec.goto @s25 if %0
          }
        } {control = 1 : i32}
        hec.state @s20 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c24_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c22_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c22_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c22_i32 : i32 -> i32
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
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %0 : i32 -> i9
          hec.enable %mem_global_4.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %mem_global_5.addr = %1 : i32 -> i10
          hec.enable %mem_global_5.r_en : i1
          %2 = hec.addi %r_main_4.reg %muli_main_2.result {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %mem_global_3.addr = %2 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %3 = hec.addi %r_main_4.reg %muli_main_3.result {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          hec.assign %r_main_15.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_5.r_data : i32 -> i32
          hec.transition {
            hec.goto @s22_0
          }
        }
        hec.state @s22_0 {
          hec.transition {
            hec.goto @s22_1
          }
        }
        hec.state @s22_1 {
          hec.transition {
            hec.goto @s23
          }
        }
        hec.state @s23 {
          %0 = hec.addi %r_main_15.reg %muli_main_0.result {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %mem_global_3.addr = %r_main_16.reg : i32 -> i9
          hec.assign %mem_global_3.w_data = %0 : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c23_i32 {dump = "comb_25"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s19_entry
          }
        }
        hec.state @s25 {
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s26 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_26"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c21_i32 {dump = "comb_27"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s16_entry
          }
        }
        hec.state @s27 {
          hec.transition {
            hec.goto @s28
          }
        }
        hec.state @s28 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c17_i32 {dump = "comb_29"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s15_entry
          }
        }
        hec.state @s29 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s32
          }
        }
        hec.state @s30_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_30"} : i1
          hec.transition {
            hec.goto @s31
            hec.goto @s44 if %0
          }
        } {control = 1 : i32}
        hec.state @s31 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s32
          }
        } {control = 1 : i32}
        hec.state @s31_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_31"} : i1
          hec.transition {
            hec.goto @s32
            hec.goto @s42 if %0
          }
        } {control = 1 : i32}
        hec.state @s32 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c22_i32 : i32 -> i32
          hec.transition {
            hec.goto @s32_0
          }
        }
        hec.state @s32_0 {
          hec.transition {
            hec.goto @s32_1
          }
        }
        hec.state @s32_1 {
          hec.transition {
            hec.goto @s33
          }
        }
        hec.state @s33 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %mem_global_6.addr = %0 : i32 -> i9
          hec.assign %mem_global_6.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_6.w_en : i1
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s35
          }
        }
        hec.state @s34_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_33"} : i1
          hec.transition {
            hec.goto @s35
            hec.goto @s40 if %0
          }
        } {control = 1 : i32}
        hec.state @s35 {
          hec.assign %muli_main_0.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c18_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_5.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c22_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c22_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_3.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c22_i32 : i32 -> i32
          hec.transition {
            hec.goto @s35_0
          }
        }
        hec.state @s35_0 {
          hec.transition {
            hec.goto @s35_1
          }
        }
        hec.state @s35_1 {
          hec.transition {
            hec.goto @s36
          }
        }
        hec.state @s36 {
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_34"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i9
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_4.reg %muli_main_1.result {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %mem_global_3.addr = %1 : i32 -> i9
          hec.enable %mem_global_3.r_en : i1
          %2 = hec.addi %r_main_4.reg %muli_main_2.result {dump = "comb_36"} : (i32, i32) -> i32
          hec.assign %mem_global_6.addr = %2 : i32 -> i9
          hec.enable %mem_global_6.r_en : i1
          %3 = hec.addi %r_main_4.reg %muli_main_3.result {dump = "comb_37"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s37
          }
        }
        hec.state @s37 {
          hec.assign %r_main_15.reg = %mem_global_6.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_3.r_data : i32 -> i32
          hec.transition {
            hec.goto @s37_0
          }
        }
        hec.state @s37_0 {
          hec.transition {
            hec.goto @s37_1
          }
        }
        hec.state @s37_1 {
          hec.transition {
            hec.goto @s38
          }
        }
        hec.state @s38 {
          %0 = hec.addi %r_main_15.reg %muli_main_0.result {dump = "comb_38"} : (i32, i32) -> i32
          hec.assign %mem_global_6.addr = %r_main_16.reg : i32 -> i9
          hec.assign %mem_global_6.w_data = %0 : i32 -> i32
          hec.enable %mem_global_6.w_en : i1
          hec.transition {
            hec.goto @s39
          }
        }
        hec.state @s39 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_39"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c17_i32 {dump = "comb_40"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s34_entry
          }
        }
        hec.state @s40 {
          hec.transition {
            hec.goto @s41
          }
        }
        hec.state @s41 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_41"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c21_i32 {dump = "comb_42"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s31_entry
          }
        }
        hec.state @s42 {
          hec.transition {
            hec.goto @s43
          }
        }
        hec.state @s43 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_43"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c15_i32 {dump = "comb_44"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s30_entry
          }
        }
        hec.state @s44 {
          hec.transition {
            hec.goto @s45
          }
        }
        hec.state @s45 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_120"}
  }
  tor.design @kernel_3mm {
    %c22_i32 = arith.constant {dump = "op_109"} 22 : i32
    %c18_i32 = arith.constant {dump = "op_95"} 18 : i32
    %c17_i32 = arith.constant {dump = "new_constant_0"} 17 : i32
    %c1_i32 = arith.constant {dump = "op_94"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_92"} 0 : i32
    %c21_i32 = arith.constant {dump = "new_constant_1"} 21 : i32
    %c15_i32 = arith.constant {dump = "new_constant_2"} 15 : i32
    %c24_i32 = arith.constant {dump = "op_58"} 24 : i32
    %c23_i32 = arith.constant {dump = "new_constant_3"} 23 : i32
    %c20_i32 = arith.constant {dump = "op_21"} 20 : i32
    %c19_i32 = arith.constant {dump = "new_constant_6"} 19 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<288xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<320xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<360xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<396xi32, [], "rw">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<432xi32, [], "r">
    %5 = tor.alloc {dump = "op_5"} : !tor.memref<528xi32, [], "r">
    %6 = tor.alloc {dump = "op_6"} : !tor.memref<352xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_120", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 45){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:3"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static"}]
        tor.succ 6 : [5 : i32] [{type = "static:3"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:3"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [4 : i32] [{type = "static-for"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [1 : i32] [{type = "static-for"}]
        tor.succ 13 : [12 : i32] [{type = "static"}]
        tor.succ 14 : [0 : i32] [{type = "static-for"}]
        tor.succ 15 : [14 : i32] [{type = "static"}]
        tor.succ 16 : [15 : i32] [{type = "static"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [17 : i32] [{type = "static:3"}]
        tor.succ 19 : [18 : i32] [{type = "static:1"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [20 : i32] [{type = "static:3"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static:3"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [19 : i32] [{type = "static-for"}]
        tor.succ 26 : [25 : i32] [{type = "static"}]
        tor.succ 27 : [16 : i32] [{type = "static-for"}]
        tor.succ 28 : [27 : i32] [{type = "static"}]
        tor.succ 29 : [15 : i32] [{type = "static-for"}]
        tor.succ 30 : [29 : i32] [{type = "static"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
        tor.succ 32 : [31 : i32] [{type = "static"}]
        tor.succ 33 : [32 : i32] [{type = "static:3"}]
        tor.succ 34 : [33 : i32] [{type = "static:1"}]
        tor.succ 35 : [34 : i32] [{type = "static"}]
        tor.succ 36 : [35 : i32] [{type = "static:3"}]
        tor.succ 37 : [36 : i32] [{type = "static:1"}]
        tor.succ 38 : [37 : i32] [{type = "static:3"}]
        tor.succ 39 : [38 : i32] [{type = "static:1"}]
        tor.succ 40 : [34 : i32] [{type = "static-for"}]
        tor.succ 41 : [40 : i32] [{type = "static"}]
        tor.succ 42 : [31 : i32] [{type = "static-for"}]
        tor.succ 43 : [42 : i32] [{type = "static"}]
        tor.succ 44 : [30 : i32] [{type = "static-for"}]
        tor.succ 45 : [44 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c15_i32 : i32) step (%c1_i32 : i32)
      on (0 to 13){
        tor.for %arg1 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
        on (1 to 11){
          %7 = tor.muli %arg0 %c18_i32 on (2 to 3) {dump = "op_15"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (3 to 4) {dump = "op_16"} : (i32, i32) -> i32
          tor.store %c0_i32 to %0[%8] on (3 to 4) {dump = "op_17"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
          on (4 to 9){
            %9 = tor.muli %arg0 %c20_i32 on (5 to 6) {dump = "op_22"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (6 to 7) {dump = "op_23"} : (i32, i32) -> i32
            %11 = tor.load %1[%10] on (6 to 7) {dump = "op_24"} : !tor.memref<320xi32, [], "r">[i32]
            %12 = tor.muli %arg2 %c18_i32 on (5 to 6) {dump = "op_26"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (6 to 7) {dump = "op_27"} : (i32, i32) -> i32
            %14 = tor.load %2[%13] on (6 to 7) {dump = "op_28"} : !tor.memref<360xi32, [], "r">[i32]
            %15 = tor.muli %11 %14 on (7 to 8) {dump = "op_29"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c18_i32 on (5 to 6) {dump = "op_31"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (6 to 7) {dump = "op_32"} : (i32, i32) -> i32
            %18 = tor.load %0[%17] on (6 to 7) {dump = "op_33"} : !tor.memref<288xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (8 to 9) {dump = "op_34"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c18_i32 on (5 to 6) {dump = "op_36"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (6 to 7) {dump = "op_37"} : (i32, i32) -> i32
            tor.store %19 to %0[%21] on (8 to 9) {dump = "op_38"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          } {dump = "op_40"}
        } {dump = "op_42"}
      } {dump = "op_44"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
      on (15 to 28){
        tor.for %arg1 = (%c0_i32 : i32) to (%c21_i32 : i32) step (%c1_i32 : i32)
        on (16 to 26){
          %7 = tor.muli %arg0 %c22_i32 on (17 to 18) {dump = "op_52"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (18 to 19) {dump = "op_53"} : (i32, i32) -> i32
          tor.store %c0_i32 to %3[%8] on (18 to 19) {dump = "op_54"} : (i32, !tor.memref<396xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c23_i32 : i32) step (%c1_i32 : i32)
          on (19 to 24){
            %9 = tor.muli %arg0 %c24_i32 on (20 to 21) {dump = "op_59"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (21 to 22) {dump = "op_60"} : (i32, i32) -> i32
            %11 = tor.load %4[%10] on (21 to 22) {dump = "op_61"} : !tor.memref<432xi32, [], "r">[i32]
            %12 = tor.muli %arg2 %c22_i32 on (20 to 21) {dump = "op_63"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (21 to 22) {dump = "op_64"} : (i32, i32) -> i32
            %14 = tor.load %5[%13] on (21 to 22) {dump = "op_65"} : !tor.memref<528xi32, [], "r">[i32]
            %15 = tor.muli %11 %14 on (22 to 23) {dump = "op_66"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c22_i32 on (20 to 21) {dump = "op_68"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (21 to 22) {dump = "op_69"} : (i32, i32) -> i32
            %18 = tor.load %3[%17] on (21 to 22) {dump = "op_70"} : !tor.memref<396xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (23 to 24) {dump = "op_71"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c22_i32 on (20 to 21) {dump = "op_73"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (21 to 22) {dump = "op_74"} : (i32, i32) -> i32
            tor.store %19 to %3[%21] on (23 to 24) {dump = "op_75"} : (i32, !tor.memref<396xi32, [], "rw">[i32])
          } {dump = "op_77"}
        } {dump = "op_79"}
      } {dump = "op_81"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c15_i32 : i32) step (%c1_i32 : i32)
      on (30 to 43){
        tor.for %arg1 = (%c0_i32 : i32) to (%c21_i32 : i32) step (%c1_i32 : i32)
        on (31 to 41){
          %7 = tor.muli %arg0 %c22_i32 on (32 to 33) {dump = "op_89"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (33 to 34) {dump = "op_90"} : (i32, i32) -> i32
          tor.store %c0_i32 to %6[%8] on (33 to 34) {dump = "op_91"} : (i32, !tor.memref<352xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
          on (34 to 39){
            %9 = tor.muli %arg0 %c18_i32 on (35 to 36) {dump = "op_96"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (36 to 37) {dump = "op_97"} : (i32, i32) -> i32
            %11 = tor.load %0[%10] on (36 to 37) {dump = "op_98"} : !tor.memref<288xi32, [], "rw">[i32]
            %12 = tor.muli %arg2 %c22_i32 on (35 to 36) {dump = "op_100"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (36 to 37) {dump = "op_101"} : (i32, i32) -> i32
            %14 = tor.load %3[%13] on (36 to 37) {dump = "op_102"} : !tor.memref<396xi32, [], "rw">[i32]
            %15 = tor.muli %11 %14 on (37 to 38) {dump = "op_103"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c22_i32 on (35 to 36) {dump = "op_105"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (36 to 37) {dump = "op_106"} : (i32, i32) -> i32
            %18 = tor.load %6[%17] on (36 to 37) {dump = "op_107"} : !tor.memref<352xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (38 to 39) {dump = "op_108"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c22_i32 on (35 to 36) {dump = "op_110"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (36 to 37) {dump = "op_111"} : (i32, i32) -> i32
            tor.store %19 to %6[%21] on (38 to 39) {dump = "op_112"} : (i32, !tor.memref<352xi32, [], "rw">[i32])
          } {dump = "op_114"}
        } {dump = "op_116"}
      } {dump = "op_118"}
      tor.return {dump = "op_119"}
    }
  } {dump = "op_121", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

