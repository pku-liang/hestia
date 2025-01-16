module {
  hec.design @kernel_durbin {
    %true = arith.constant {dump = "const_29"} true
    %c-1_i32 = arith.constant {dump = "op_41"} -1 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_7"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_6"} 0 : i32
    %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_2.w_en, %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.w_data, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 1 : i32, ports = "rw", type = "local"} : i1, i1, i1, i32, i32
    %mem_global_3.w_en, %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.w_data, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 1 : i32, ports = "rw", type = "local"} : i1, i1, i1, i32, i32
    %mem_global_4.w_en, %mem_global_4.r_en, %mem_global_4.addr, %mem_global_4.w_data, %mem_global_4.r_data = hec.primitive "mem_global_4" is "mem" {len = 1 : i32, ports = "rw", type = "local"} : i1, i1, i1, i32, i32
    %mem_global_5.w_en, %mem_global_5.r_en, %mem_global_5.addr, %mem_global_5.w_data, %mem_global_5.r_data = hec.primitive "mem_global_5" is "mem" {len = 256 : i32, ports = "rw", type = "local"} : i1, i1, i8, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i32
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i1
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i32
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i1
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %mem_global_2.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_2.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.assign %mem_global_3.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_3.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.assign %mem_global_4.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_4.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_4.w_en : i1
          hec.assign %mem_global_0.addr = %c0_i32 : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s1
          }
        }
        hec.state @s1 {
          hec.assign %r_main_0.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %c0_i32 : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_3.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_3.w_data = %c1_i32 : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.assign %mem_global_4.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_4.w_data = %mem_global_0.r_data : i32 -> i32
          hec.enable %mem_global_4.w_en : i1
          hec.transition {
            hec.goto @s2
          }
        }
        hec.state @s2 {
          hec.assign %r_main_1.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %c0_i32 : i32 -> i8
          hec.assign %mem_global_1.w_data = %mem_global_0.r_data : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.assign %r_main_10.reg = %true : i1 -> i1
          hec.assign %r_main_0.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s3_entry {
          %0 = hec.not %r_main_10.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s4
            hec.goto @s39 if %0
          }
        } {control = 1 : i32}
        hec.state @s4 {
          hec.assign %mem_global_4.addr = %c0_i32 : i32 -> i1
          hec.enable %mem_global_4.r_en : i1
          hec.assign %mem_global_3.addr = %c0_i32 : i32 -> i1
          hec.enable %mem_global_3.r_en : i1
          hec.assign %mem_global_2.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_2.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          %0 = hec.subi %r_main_0.reg %c1_i32 {dump = "comb_1"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.assign %r_main_1.reg = %mem_global_4.r_data : i32 -> i32
          hec.assign %r_main_2.reg = %mem_global_3.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_4.r_data : i32 -> i32
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
          hec.assign %r_main_4.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.subi %c1_i32 %muli_main_0.result {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %r_main_1.reg = %0 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_2.reg : i32 -> i32
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
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_3.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_3.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_3.w_en : i1
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          %0 = hec.cmpi "sle" %c0_i32 %r_main_3.reg {dump = "comb_3"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %0 : i1 -> i1
          %1 = hec.not %0 {dump = "comb_4"} : i1
          hec.assign %r_main_1.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s10
            hec.goto @s16 if %1
          }
        } {control = 1 : i32}
        hec.state @s9_entry {
          %0 = hec.not %r_main_11.reg {dump = "comb_5"} : i1
          hec.transition {
            hec.goto @s10
            hec.goto @s16 if %0
          }
        } {control = 1 : i32}
        hec.state @s10 {
          hec.assign %muli_main_0.operand0 = %r_main_1.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-1_i32 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_1.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.assign %mem_global_2.addr = %c0_i32 : i32 -> i1
          hec.enable %mem_global_2.r_en : i1
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %r_main_4.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %r_main_6.reg = %mem_global_2.r_data : i32 -> i32
          hec.transition {
            hec.goto @s11_0
          }
        }
        hec.state @s11_0 {
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_2.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_0.reg %muli_main_0.result {dump = "comb_6"} : (i32, i32) -> i32
          %1 = hec.addi %0 %c-1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_4.reg : i32 -> i32
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
          hec.assign %r_main_2.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          hec.assign %mem_global_2.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_2.w_data = %0 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          %0 = hec.addi %r_main_1.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_1.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %r_main_3.reg {dump = "comb_10"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s9_entry
          }
        }
        hec.state @s16 {
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          hec.assign %mem_global_0.addr = %r_main_0.reg : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.assign %mem_global_2.addr = %c0_i32 : i32 -> i1
          hec.enable %mem_global_2.r_en : i1
          %0 = hec.subi %r_main_0.reg %c1_i32 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          hec.assign %r_main_1.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %r_main_2.reg = %mem_global_2.r_data : i32 -> i32
          %0 = hec.addi %mem_global_0.r_data %mem_global_2.r_data {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.goto @s19_0
          }
        }
        hec.state @s19_0 {
          hec.transition {
            hec.goto @s19_1
          }
        }
        hec.state @s19_1 {
          hec.transition {
            hec.goto @s19_2
          }
        }
        hec.state @s19_2 {
          hec.transition {
            hec.goto @s19_3
          }
        }
        hec.state @s19_3 {
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          hec.assign %muli_main_0.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_5.reg : i32 -> i32
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
          hec.assign %r_main_1.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_4.addr = %c0_i32 : i32 -> i1
          hec.assign %mem_global_4.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_4.w_en : i1
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          %0 = hec.cmpi "sle" %c0_i32 %r_main_3.reg {dump = "comb_13"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %0 : i1 -> i1
          %1 = hec.not %0 {dump = "comb_14"} : i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s23
            hec.goto @s30 if %1
          }
        } {control = 1 : i32}
        hec.state @s22_entry {
          %0 = hec.not %r_main_11.reg {dump = "comb_15"} : i1
          hec.transition {
            hec.goto @s23
            hec.goto @s30 if %0
          }
        } {control = 1 : i32}
        hec.state @s23 {
          hec.assign %mem_global_1.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.assign %muli_main_0.operand0 = %r_main_2.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c-1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          hec.assign %r_main_4.reg = %mem_global_1.r_data : i32 -> i32
          hec.transition {
            hec.goto @s24_0
          }
        }
        hec.state @s24_0 {
          hec.transition {
            hec.goto @s25
          }
        }
        hec.state @s25 {
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_0.reg %muli_main_0.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %c-1_i32 {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %1 : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s26
          }
        }
        hec.state @s26 {
          hec.assign %r_main_8.reg = %mem_global_1.r_data : i32 -> i32
          hec.transition {
            hec.goto @s26_0
          }
        }
        hec.state @s26_0 {
          hec.transition {
            hec.goto @s26_1
          }
        }
        hec.state @s26_1 {
          hec.transition {
            hec.goto @s26_2
          }
        }
        hec.state @s26_2 {
          hec.transition {
            hec.goto @s26_3
          }
        }
        hec.state @s26_3 {
          hec.transition {
            hec.goto @s26_4
          }
        }
        hec.state @s26_4 {
          hec.transition {
            hec.goto @s27
          }
        }
        hec.state @s27 {
          hec.assign %muli_main_0.operand0 = %r_main_1.reg : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_8.reg : i32 -> i32
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
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          hec.assign %mem_global_5.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_5.w_data = %0 : i32 -> i32
          hec.enable %mem_global_5.w_en : i1
          hec.transition {
            hec.goto @s29
          }
        }
        hec.state @s29 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %r_main_3.reg {dump = "comb_20"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %1 : i1 -> i1
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
          %0 = hec.subi %r_main_0.reg %c1_i32 {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          hec.transition {
            hec.goto @s32
          }
        }
        hec.state @s32 {
          %0 = hec.cmpi "sle" %c0_i32 %r_main_2.reg {dump = "comb_22"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %0 : i1 -> i1
          %1 = hec.not %0 {dump = "comb_23"} : i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s33
            hec.goto @s36 if %1
          }
        } {control = 1 : i32}
        hec.state @s32_entry {
          %0 = hec.not %r_main_11.reg {dump = "comb_24"} : i1
          hec.transition {
            hec.goto @s33
            hec.goto @s36 if %0
          }
        } {control = 1 : i32}
        hec.state @s33 {
          hec.assign %mem_global_5.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_5.r_en : i1
          hec.transition {
            hec.goto @s34
          }
        }
        hec.state @s34 {
          hec.assign %r_main_4.reg = %mem_global_5.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_3.reg : i32 -> i8
          hec.assign %mem_global_1.w_data = %mem_global_5.r_data : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s35
          }
        }
        hec.state @s35 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %r_main_2.reg {dump = "comb_26"} : (i32, i32) -> i1
          hec.assign %r_main_11.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s32_entry
          }
        }
        hec.state @s36 {
          hec.transition {
            hec.goto @s37
          }
        }
        hec.state @s37 {
          hec.assign %mem_global_1.addr = %r_main_0.reg : i32 -> i8
          hec.assign %mem_global_1.w_data = %r_main_1.reg : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s38
          }
        }
        hec.state @s38 {
          %0 = hec.addi %r_main_0.reg %c1_i32 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %r_main_0.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_28"} : (i32, i32) -> i1
          hec.assign %r_main_10.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s3_entry
          }
        }
        hec.state @s39 {
          hec.transition {
            hec.goto @s40
          }
        }
        hec.state @s40 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_87"}
  }
  tor.design @kernel_durbin {
    %c1_i32 = arith.constant {dump = "op_78"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_77"} 0 : i32
    %c-1_i32 = arith.constant {dump = "op_69"} -1 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %4 = tor.alloc {dump = "op_4", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %5 = tor.alloc {dump = "op_5", local_type = "local"} : !tor.memref<256xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_87", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 40){
        tor.succ 1 : [0 : i32] [{type = "static:1"}]
        tor.succ 2 : [1 : i32] [{type = "static:1"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [5 : i32] [{type = "static:3"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:2"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:2"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:3"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [9 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [18 : i32] [{type = "static:1"}]
        tor.succ 20 : [19 : i32] [{type = "static:5"}]
        tor.succ 21 : [20 : i32] [{type = "static:3"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [24 : i32] [{type = "static:2"}]
        tor.succ 26 : [25 : i32] [{type = "static:1"}]
        tor.succ 27 : [26 : i32] [{type = "static:6"}]
        tor.succ 28 : [27 : i32] [{type = "static:3"}]
        tor.succ 29 : [28 : i32] [{type = "static:1"}]
        tor.succ 30 : [22 : i32] [{type = "static-for"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
        tor.succ 32 : [31 : i32] [{type = "static:1"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
        tor.succ 34 : [33 : i32] [{type = "static:1"}]
        tor.succ 35 : [34 : i32] [{type = "static:1"}]
        tor.succ 36 : [32 : i32] [{type = "static-for"}]
        tor.succ 37 : [36 : i32] [{type = "static"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [3 : i32] [{type = "static-for"}]
        tor.succ 40 : [39 : i32] [{type = "static"}]
      }
      tor.store %c0_i32 to %2[%c0_i32] on (0 to 1) {dump = "op_10"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.store %c0_i32 to %3[%c0_i32] on (0 to 1) {dump = "op_12"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.store %c0_i32 to %4[%c0_i32] on (0 to 1) {dump = "op_14"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      %6 = tor.load %0[%c0_i32] on (1 to 2) {dump = "op_16"} : !tor.memref<256xi32, [], "r">[i32]
      tor.store %6 to %1[%c0_i32] on (2 to 3) {dump = "op_18"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      tor.store %c1_i32 to %3[%c0_i32] on (1 to 2) {dump = "op_20"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      %7 = tor.load %0[%c0_i32] on (0 to 1) {dump = "op_22"} : !tor.memref<256xi32, [], "r">[i32]
      tor.store %7 to %4[%c0_i32] on (1 to 2) {dump = "op_24"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.for %arg0 = (%c1_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (3 to 38){
        %8 = tor.load %4[%c0_i32] on (4 to 5) {dump = "op_29"} : !tor.memref<1xi32, [], "rw">[i32]
        %9 = tor.muli %8 %8 on (5 to 6) {dump = "op_30"} : (i32, i32) -> i32
        %10 = tor.subi %c1_i32 %9 on (6 to 7) {dump = "op_31"} : (i32, i32) -> i32
        %11 = tor.load %3[%c0_i32] on (4 to 5) {dump = "op_33"} : !tor.memref<1xi32, [], "rw">[i32]
        %12 = tor.muli %10 %11 on (6 to 8) {dump = "op_34"} : (i32, i32) -> i32
        tor.store %12 to %3[%c0_i32] on (8 to 9) {dump = "op_36"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        tor.store %c0_i32 to %2[%c0_i32] on (4 to 5) {dump = "op_38"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        %13 = tor.subi %arg0 %c1_i32 on (4 to 5) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32 : i32) to (%13 : i32) step (%c1_i32 : i32)
        on (9 to 15){
          %20 = tor.muli %arg1 %c-1_i32 on (10 to 12) {dump = "op_42"} : (i32, i32) -> i32
          %21 = tor.addi %arg0 %20 on (12 to 13) {dump = "op_43"} : (i32, i32) -> i32
          %22 = tor.addi %21 %c-1_i32 on (12 to 13) {dump = "op_45"} : (i32, i32) -> i32
          %23 = tor.load %0[%22] on (12 to 13) {dump = "op_46"} : !tor.memref<256xi32, [], "r">[i32]
          %24 = tor.load %1[%arg1] on (10 to 11) {dump = "op_47"} : !tor.memref<256xi32, [], "rw">[i32]
          %25 = tor.muli %23 %24 on (13 to 14) {dump = "op_48"} : (i32, i32) -> i32
          %26 = tor.load %2[%c0_i32] on (10 to 11) {dump = "op_50"} : !tor.memref<1xi32, [], "rw">[i32]
          %27 = tor.addi %26 %25 on (14 to 15) {dump = "op_51"} : (i32, i32) -> i32
          tor.store %27 to %2[%c0_i32] on (14 to 15) {dump = "op_53"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        } {dump = "op_55"}
        %14 = tor.load %0[%arg0] on (17 to 18) {dump = "op_56"} : !tor.memref<256xi32, [], "r">[i32]
        %15 = tor.load %2[%c0_i32] on (17 to 18) {dump = "op_58"} : !tor.memref<1xi32, [], "rw">[i32]
        %16 = tor.addi %14 %15 on (18 to 19) {dump = "op_59"} : (i32, i32) -> i32
        %17 = tor.muli %16 %12 on (20 to 21) {dump = "op_60"} : (i32, i32) -> i32
        tor.store %17 to %4[%c0_i32] on (21 to 22) {dump = "op_62"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        %18 = tor.subi %arg0 %c1_i32 on (17 to 18) {dump = "control_2"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32 : i32) to (%18 : i32) step (%c1_i32 : i32)
        on (22 to 29){
          %20 = tor.load %1[%arg1] on (23 to 24) {dump = "op_65"} : !tor.memref<256xi32, [], "rw">[i32]
          %21 = tor.muli %arg1 %c-1_i32 on (23 to 25) {dump = "op_67"} : (i32, i32) -> i32
          %22 = tor.addi %arg0 %21 on (25 to 26) {dump = "op_68"} : (i32, i32) -> i32
          %23 = tor.addi %22 %c-1_i32 on (25 to 26) {dump = "op_70"} : (i32, i32) -> i32
          %24 = tor.load %1[%23] on (25 to 26) {dump = "op_71"} : !tor.memref<256xi32, [], "rw">[i32]
          %25 = tor.muli %17 %24 on (27 to 28) {dump = "op_72"} : (i32, i32) -> i32
          %26 = tor.addi %20 %25 on (28 to 29) {dump = "op_73"} : (i32, i32) -> i32
          tor.store %26 to %5[%arg1] on (28 to 29) {dump = "op_74"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_76"}
        %19 = tor.subi %arg0 %c1_i32 on (31 to 32) {dump = "control_3"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32 : i32) to (%19 : i32) step (%c1_i32 : i32)
        on (32 to 35){
          %20 = tor.load %5[%arg1] on (33 to 34) {dump = "op_79"} : !tor.memref<256xi32, [], "rw">[i32]
          tor.store %20 to %1[%arg1] on (34 to 35) {dump = "op_80"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_82"}
        tor.store %17 to %1[%arg0] on (37 to 38) {dump = "op_83"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_85"}
      tor.return {dump = "op_86"}
    }
  } {dump = "op_88", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

