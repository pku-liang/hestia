module {
  hec.design @kernel_fdtd_2d {
    %true = arith.constant {dump = "const_51"} true
    %c28_i32 = arith.constant {dump = "new_constant_0"} 28 : i32
    %c18_i32 = arith.constant {dump = "new_constant_1"} 18 : i32
    %c-1_i32 = arith.constant {dump = "op_34"} -1 : i32
    %c29_i32 = arith.constant {dump = "new_constant_6"} 29 : i32
    %c30_i32 = arith.constant {dump = "op_10"} 30 : i32
    %c19_i32 = arith.constant {dump = "new_constant_7"} 19 : i32
    %c1_i32 = arith.constant {dump = "op_8"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_6"} 0 : i32
    %c5_i32 = arith.constant {dump = "op_5"} 5 : i32
    %c7_i32 = arith.constant {dump = "op_4"} 7 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 600 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 600 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_2.w_en, %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.w_data, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 600 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 20 : i32, ports = "r"} : i1, i5, i32
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
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      %r_main_13.reg = hec.primitive "r_main_13" is "register" : i32
      %r_main_14.reg = hec.primitive "r_main_14" is "register" : i32
      %r_main_15.reg = hec.primitive "r_main_15" is "register" : i32
      %r_main_16.reg = hec.primitive "r_main_16" is "register" : i32
      %r_main_17.reg = hec.primitive "r_main_17" is "register" : i32
      %r_main_18.reg = hec.primitive "r_main_18" is "register" : i32
      %r_main_20.reg = hec.primitive "r_main_20" is "register" : i32
      %r_main_21.reg = hec.primitive "r_main_21" is "register" : i32
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
            hec.goto @s46 if %0
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
            hec.goto @s5 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          hec.assign %mem_global_3.addr = %r_main_3.reg : i32 -> i5
          hec.enable %mem_global_3.r_en : i1
          %0 = hec.addi %r_main_4.reg %c0_i32 {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %r_main_5.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_6.reg : i32 -> i10
          hec.assign %mem_global_1.w_data = %mem_global_3.r_data : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c29_i32 {dump = "comb_4"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s5 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c1_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s6_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_5"} : i1
          hec.transition {
            hec.goto @s7
            hec.goto @s18 if %0
          }
        } {control = 1 : i32}
        hec.state @s7 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s8
          }
        } {control = 1 : i32}
        hec.state @s7_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_6"} : i1
          hec.transition {
            hec.goto @s8
            hec.goto @s16 if %0
          }
        } {control = 1 : i32}
        hec.state @s8 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c30_i32 : i32 -> i32
          %0 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c30_i32 : i32 -> i32
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          hec.transition {
            hec.goto @s9_0
          }
        }
        hec.state @s9_0 {
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %0 : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.addi %r_main_5.reg %muli_main_1.result {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %1 : i32 -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          %2 = hec.addi %r_main_5.reg %muli_main_2.result {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %r_main_11.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %r_main_13.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_14.reg : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_6.reg = %mem_global_2.r_data : i32 -> i32
          %0 = hec.subi %r_main_13.reg %mem_global_2.r_data {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c5_i32 : i32 -> i32
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.transition {
            hec.goto @s13_0
          }
        }
        hec.state @s13_0 {
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.subi %r_main_11.reg %muli_main_0.result {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_15.reg : i32 -> i10
          hec.assign %mem_global_1.w_data = %0 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c29_i32 {dump = "comb_15"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s7_entry
          }
        }
        hec.state @s16 {
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_17"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s6_entry
          }
        }
        hec.state @s18 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s19_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_18"} : i1
          hec.transition {
            hec.goto @s20
            hec.goto @s31 if %0
          }
        } {control = 1 : i32}
        hec.state @s20 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s21
          }
        } {control = 1 : i32}
        hec.state @s20_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_19"} : i1
          hec.transition {
            hec.goto @s21
            hec.goto @s29 if %0
          }
        } {control = 1 : i32}
        hec.state @s21 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c30_i32 : i32 -> i32
          %0 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c30_i32 : i32 -> i32
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          hec.transition {
            hec.goto @s22_0
          }
        }
        hec.state @s22_0 {
          hec.transition {
            hec.goto @s23
          }
        }
        hec.state @s23 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_7.reg = %muli_main_1.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_5.reg %muli_main_1.result {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %r_main_13.reg = %1 : i32 -> i32
          hec.assign %mem_global_2.addr = %1 : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          %2 = hec.addi %r_main_8.reg %muli_main_2.result {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          hec.assign %r_main_12.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_14.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_15.reg : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          hec.transition {
            hec.goto @s25
          }
        }
        hec.state @s25 {
          hec.assign %r_main_6.reg = %mem_global_2.r_data : i32 -> i32
          %0 = hec.subi %r_main_14.reg %mem_global_2.r_data {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c5_i32 : i32 -> i32
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s26 {
          hec.transition {
            hec.goto @s26_0
          }
        }
        hec.state @s26_0 {
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.subi %r_main_12.reg %muli_main_0.result {dump = "comb_26"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_16.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s28
          }
        }
        hec.state @s28 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c29_i32 {dump = "comb_28"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s20_entry
          }
        }
        hec.state @s29 {
          hec.transition {
            hec.goto @s30
          }
        }
        hec.state @s30 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_30"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s19_entry
          }
        }
        hec.state @s31 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s34
          }
        }
        hec.state @s32_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_31"} : i1
          hec.transition {
            hec.goto @s33
            hec.goto @s44 if %0
          }
        } {control = 1 : i32}
        hec.state @s33 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s34
          }
        } {control = 1 : i32}
        hec.state @s33_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_32"} : i1
          hec.transition {
            hec.goto @s34
            hec.goto @s42 if %0
          }
        } {control = 1 : i32}
        hec.state @s34 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c30_i32 : i32 -> i32
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_33"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c30_i32 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_34"} : (i32, i32) -> i32
          hec.assign %muli_main_3.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c30_i32 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c30_i32 : i32 -> i32
          hec.transition {
            hec.goto @s35
          }
        }
        hec.state @s35 {
          hec.transition {
            hec.goto @s35_0
          }
        }
        hec.state @s35_0 {
          hec.transition {
            hec.goto @s36
          }
        }
        hec.state @s36 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_8.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_11.reg = %muli_main_3.result : i32 -> i32
          hec.assign %r_main_12.reg = %muli_main_4.result : i32 -> i32
          hec.assign %r_main_13.reg = %muli_main_5.result : i32 -> i32
          %0 = hec.addi %r_main_5.reg %muli_main_0.result {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %0 : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          %1 = hec.addi %r_main_7.reg %muli_main_1.result {dump = "comb_36"} : (i32, i32) -> i32
          hec.assign %r_main_15.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_5.reg %muli_main_2.result {dump = "comb_37"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %2 : i32 -> i32
          hec.assign %mem_global_0.addr = %2 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %3 = hec.addi %r_main_5.reg %muli_main_3.result {dump = "comb_38"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_5.reg %muli_main_4.result {dump = "comb_39"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %4 : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %5 = hec.addi %r_main_5.reg %muli_main_5.result {dump = "comb_40"} : (i32, i32) -> i32
          hec.assign %r_main_21.reg = %5 : i32 -> i32
          hec.transition {
            hec.goto @s37
          }
        }
        hec.state @s37 {
          hec.assign %r_main_14.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_17.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_20.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_15.reg : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_1.addr = %r_main_18.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s38
          }
        }
        hec.state @s38 {
          hec.assign %r_main_6.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_7.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.subi %mem_global_0.r_data %r_main_17.reg {dump = "comb_41"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %mem_global_1.r_data {dump = "comb_42"} : (i32, i32) -> i32
          %2 = hec.subi %1 %r_main_20.reg {dump = "comb_43"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c7_i32 : i32 -> i32
          hec.transition {
            hec.goto @s39
          }
        }
        hec.state @s39 {
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
          hec.assign %r_main_11.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.subi %r_main_14.reg %muli_main_0.result {dump = "comb_44"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_21.reg : i32 -> i10
          hec.assign %mem_global_2.w_data = %0 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.transition {
            hec.goto @s41
          }
        }
        hec.state @s41 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_45"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c28_i32 {dump = "comb_46"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s33_entry
          }
        }
        hec.state @s42 {
          hec.transition {
            hec.goto @s43
          }
        }
        hec.state @s43 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_47"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c18_i32 {dump = "comb_48"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s32_entry
          }
        }
        hec.state @s44 {
          hec.transition {
            hec.goto @s45
          }
        }
        hec.state @s45 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_49"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_50"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s46 {
          hec.transition {
            hec.goto @s47
          }
        }
        hec.state @s47 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_128"}
  }
  tor.design @kernel_fdtd_2d {
    %c30_i32 = arith.constant {dump = "op_117"} 30 : i32
    %c1_i32 = arith.constant {dump = "op_103"} 1 : i32
    %c28_i32 = arith.constant {dump = "new_constant_0"} 28 : i32
    %c29_i32 = arith.constant {dump = "op_86"} 29 : i32
    %c0_i32 = arith.constant {dump = "op_85"} 0 : i32
    %c18_i32 = arith.constant {dump = "new_constant_1"} 18 : i32
    %c19_i32 = arith.constant {dump = "op_83"} 19 : i32
    %c-1_i32 = arith.constant {dump = "op_65"} -1 : i32
    %c5_i32 = arith.constant {dump = "op_5"} 5 : i32
    %c7_i32 = arith.constant {dump = "op_4"} 7 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<600xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<600xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<600xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<20xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_128", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 47){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [1 : i32] [{type = "static-for"}]
        tor.succ 6 : [5 : i32] [{type = "static"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [7 : i32] [{type = "static"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static:2"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:2"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [7 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [6 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [20 : i32] [{type = "static"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static:2"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [24 : i32] [{type = "static:1"}]
        tor.succ 26 : [25 : i32] [{type = "static:1"}]
        tor.succ 27 : [26 : i32] [{type = "static:2"}]
        tor.succ 28 : [27 : i32] [{type = "static:1"}]
        tor.succ 29 : [20 : i32] [{type = "static-for"}]
        tor.succ 30 : [29 : i32] [{type = "static"}]
        tor.succ 31 : [19 : i32] [{type = "static-for"}]
        tor.succ 32 : [31 : i32] [{type = "static"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
        tor.succ 34 : [33 : i32] [{type = "static"}]
        tor.succ 35 : [34 : i32] [{type = "static:1"}]
        tor.succ 36 : [35 : i32] [{type = "static:2"}]
        tor.succ 37 : [36 : i32] [{type = "static:1"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [38 : i32] [{type = "static:1"}]
        tor.succ 40 : [39 : i32] [{type = "static:2"}]
        tor.succ 41 : [40 : i32] [{type = "static:1"}]
        tor.succ 42 : [33 : i32] [{type = "static-for"}]
        tor.succ 43 : [42 : i32] [{type = "static"}]
        tor.succ 44 : [32 : i32] [{type = "static-for"}]
        tor.succ 45 : [44 : i32] [{type = "static"}]
        tor.succ 46 : [0 : i32] [{type = "static-for"}]
        tor.succ 47 : [46 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
      on (0 to 45){
        tor.for %arg1 = (%c0_i32 : i32) to (%c29_i32 : i32) step (%c1_i32 : i32)
        on (1 to 4){
          %4 = tor.load %3[%arg0] on (2 to 3) {dump = "op_12"} : !tor.memref<20xi32, [], "r">[i32]
          %5 = tor.addi %arg1 %c0_i32 on (2 to 3) {dump = "op_16"} : (i32, i32) -> i32
          tor.store %4 to %1[%5] on (3 to 4) {dump = "op_17"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
        } {dump = "op_19"}
        tor.for %arg1 = (%c1_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
        on (6 to 17){
          tor.for %arg2 = (%c0_i32 : i32) to (%c29_i32 : i32) step (%c1_i32 : i32)
          on (7 to 15){
            %4 = tor.muli %arg1 %c30_i32 on (8 to 10) {dump = "op_27"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (10 to 11) {dump = "op_28"} : (i32, i32) -> i32
            %6 = tor.load %1[%5] on (10 to 11) {dump = "op_29"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.muli %arg1 %c30_i32 on (8 to 10) {dump = "op_31"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (10 to 11) {dump = "op_32"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (10 to 11) {dump = "op_33"} : !tor.memref<600xi32, [], "rw">[i32]
            %10 = tor.addi %arg1 %c-1_i32 on (8 to 9) {dump = "op_35"} : (i32, i32) -> i32
            %11 = tor.muli %10 %c30_i32 on (8 to 10) {dump = "op_37"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %11 on (10 to 11) {dump = "op_38"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (11 to 12) {dump = "op_39"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %9 %13 on (12 to 13) {dump = "op_40"} : (i32, i32) -> i32
            %15 = tor.muli %14 %c5_i32 on (12 to 14) {dump = "op_41"} : (i32, i32) -> i32
            %16 = tor.subi %6 %15 on (14 to 15) {dump = "op_42"} : (i32, i32) -> i32
            %17 = tor.muli %arg1 %c30_i32 on (8 to 10) {dump = "op_44"} : (i32, i32) -> i32
            %18 = tor.addi %arg2 %17 on (10 to 11) {dump = "op_45"} : (i32, i32) -> i32
            tor.store %16 to %1[%18] on (14 to 15) {dump = "op_46"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_48"}
        } {dump = "op_50"}
        tor.for %arg1 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
        on (19 to 30){
          tor.for %arg2 = (%c1_i32 : i32) to (%c29_i32 : i32) step (%c1_i32 : i32)
          on (20 to 28){
            %4 = tor.muli %arg1 %c30_i32 on (21 to 23) {dump = "op_58"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (23 to 24) {dump = "op_59"} : (i32, i32) -> i32
            %6 = tor.load %0[%5] on (23 to 24) {dump = "op_60"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.muli %arg1 %c30_i32 on (21 to 23) {dump = "op_62"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (23 to 24) {dump = "op_63"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (23 to 24) {dump = "op_64"} : !tor.memref<600xi32, [], "rw">[i32]
            %10 = tor.addi %arg2 %c-1_i32 on (21 to 22) {dump = "op_66"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32 on (21 to 23) {dump = "op_68"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (23 to 24) {dump = "op_69"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (24 to 25) {dump = "op_70"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %9 %13 on (25 to 26) {dump = "op_71"} : (i32, i32) -> i32
            %15 = tor.muli %14 %c5_i32 on (25 to 27) {dump = "op_72"} : (i32, i32) -> i32
            %16 = tor.subi %6 %15 on (27 to 28) {dump = "op_73"} : (i32, i32) -> i32
            %17 = tor.muli %arg1 %c30_i32 on (21 to 23) {dump = "op_75"} : (i32, i32) -> i32
            %18 = tor.addi %arg2 %17 on (23 to 24) {dump = "op_76"} : (i32, i32) -> i32
            tor.store %16 to %0[%18] on (27 to 28) {dump = "op_77"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_79"}
        } {dump = "op_81"}
        tor.for %arg1 = (%c0_i32 : i32) to (%c18_i32 : i32) step (%c1_i32 : i32)
        on (32 to 43){
          tor.for %arg2 = (%c0_i32 : i32) to (%c28_i32 : i32) step (%c1_i32 : i32)
          on (33 to 41){
            %4 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_89"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (36 to 37) {dump = "op_90"} : (i32, i32) -> i32
            %6 = tor.load %2[%5] on (36 to 37) {dump = "op_91"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.addi %arg2 %c1_i32 on (34 to 35) {dump = "op_93"} : (i32, i32) -> i32
            %8 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_95"} : (i32, i32) -> i32
            %9 = tor.addi %7 %8 on (36 to 37) {dump = "op_96"} : (i32, i32) -> i32
            %10 = tor.load %0[%9] on (37 to 38) {dump = "op_97"} : !tor.memref<600xi32, [], "rw">[i32]
            %11 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_99"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %11 on (36 to 37) {dump = "op_100"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (36 to 37) {dump = "op_101"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %10 %13 on (38 to 39) {dump = "op_102"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32 on (34 to 35) {dump = "op_104"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32 on (34 to 36) {dump = "op_106"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (36 to 37) {dump = "op_107"} : (i32, i32) -> i32
            %18 = tor.load %1[%17] on (37 to 38) {dump = "op_108"} : !tor.memref<600xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (38 to 39) {dump = "op_109"} : (i32, i32) -> i32
            %20 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_111"} : (i32, i32) -> i32
            %21 = tor.addi %arg2 %20 on (36 to 37) {dump = "op_112"} : (i32, i32) -> i32
            %22 = tor.load %1[%21] on (36 to 37) {dump = "op_113"} : !tor.memref<600xi32, [], "rw">[i32]
            %23 = tor.subi %19 %22 on (38 to 39) {dump = "op_114"} : (i32, i32) -> i32
            %24 = tor.muli %23 %c7_i32 on (38 to 40) {dump = "op_115"} : (i32, i32) -> i32
            %25 = tor.subi %6 %24 on (40 to 41) {dump = "op_116"} : (i32, i32) -> i32
            %26 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_118"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (36 to 37) {dump = "op_119"} : (i32, i32) -> i32
            tor.store %25 to %2[%27] on (40 to 41) {dump = "op_120"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_122"}
        } {dump = "op_124"}
      } {dump = "op_126"}
      tor.return {dump = "op_127"}
    }
  } {dump = "op_129", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

