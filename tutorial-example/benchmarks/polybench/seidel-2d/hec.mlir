module {
  hec.design @kernel_seidel_2d {
    %true = arith.constant {dump = "const_39"} true
    %c40_i32 = arith.constant {dump = "op_15"} 40 : i32
    %c-1_i32 = arith.constant {dump = "op_11"} -1 : i32
    %c38_i32 = arith.constant {dump = "new_constant_1"} 38 : i32
    %c19_i32 = arith.constant {dump = "new_constant_2"} 19 : i32
    %c1_i32 = arith.constant {dump = "op_4"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_2"} 0 : i32
    %c9_i32 = arith.constant {dump = "op_1"} 9 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 1600 : i32, ports = "rw"} : i1, i1, i11, i32, i32
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
      %muli_main_8.operand0, %muli_main_8.operand1, %muli_main_8.result = hec.primitive "muli_main_8" is "mul_integer" : i32, i32, i32
      %muli_main_9.operand0, %muli_main_9.operand1, %muli_main_9.result = hec.primitive "muli_main_9" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i32
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      %r_main_13.reg = hec.primitive "r_main_13" is "register" : i32
      %r_main_14.reg = hec.primitive "r_main_14" is "register" : i32
      %r_main_17.reg = hec.primitive "r_main_17" is "register" : i32
      %r_main_18.reg = hec.primitive "r_main_18" is "register" : i32
      %r_main_19.reg = hec.primitive "r_main_19" is "register" : i32
      %r_main_20.reg = hec.primitive "r_main_20" is "register" : i32
      %r_main_24.reg = hec.primitive "r_main_24" is "register" : i32
      %r_main_25.reg = hec.primitive "r_main_25" is "register" : i32
      %r_main_28.reg = hec.primitive "r_main_28" is "register" : i32
      %r_main_29.reg = hec.primitive "r_main_29" is "register" : i32
      %r_main_30.reg = hec.primitive "r_main_30" is "register" : i32
      %r_main_31.reg = hec.primitive "r_main_31" is "register" : i32
      %r_main_32.reg = hec.primitive "r_main_32" is "register" : i32
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
            hec.goto @s23 if %0
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
            hec.goto @s21 if %0
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
            hec.goto @s19 if %0
          }
        } {control = 1 : i32}
        hec.state @s3 {
          %0 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %1 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %0 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c40_i32 : i32 -> i32
          %2 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %2 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c40_i32 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %c-1_i32 {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_12.reg = %4 : i32 -> i32
          hec.assign %muli_main_2.operand0 = %3 : i32 -> i32
          hec.assign %muli_main_2.operand1 = %c40_i32 : i32 -> i32
          %5 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %r_main_14.reg = %5 : i32 -> i32
          hec.assign %muli_main_3.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_3.operand1 = %c40_i32 : i32 -> i32
          hec.assign %muli_main_4.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_4.operand1 = %c40_i32 : i32 -> i32
          %6 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %6 : i32 -> i32
          hec.assign %muli_main_5.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_5.operand1 = %c40_i32 : i32 -> i32
          %7 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %7 : i32 -> i32
          %8 = hec.addi %r_main_5.reg %c-1_i32 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_20.reg = %8 : i32 -> i32
          hec.assign %muli_main_6.operand0 = %7 : i32 -> i32
          hec.assign %muli_main_6.operand1 = %c40_i32 : i32 -> i32
          %9 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %muli_main_7.operand0 = %9 : i32 -> i32
          hec.assign %muli_main_7.operand1 = %c40_i32 : i32 -> i32
          %10 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_24.reg = %10 : i32 -> i32
          %11 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_25.reg = %11 : i32 -> i32
          hec.assign %muli_main_8.operand0 = %10 : i32 -> i32
          hec.assign %muli_main_8.operand1 = %c40_i32 : i32 -> i32
          hec.assign %muli_main_9.operand0 = %r_main_4.reg : i32 -> i32
          hec.assign %muli_main_9.operand1 = %c40_i32 : i32 -> i32
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
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          hec.assign %r_main_10.reg = %muli_main_1.result : i32 -> i32
          hec.assign %r_main_13.reg = %muli_main_2.result : i32 -> i32
          hec.assign %r_main_18.reg = %muli_main_5.result : i32 -> i32
          %0 = hec.addi %r_main_7.reg %muli_main_0.result {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_5.reg %muli_main_1.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          %2 = hec.addi %r_main_12.reg %muli_main_2.result {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %r_main_11.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_14.reg %muli_main_3.result {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %r_main_19.reg = %3 : i32 -> i32
          %4 = hec.addi %r_main_5.reg %muli_main_4.result {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %4 : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          %5 = hec.addi %r_main_17.reg %muli_main_5.result {dump = "comb_20"} : (i32, i32) -> i32
          hec.assign %r_main_28.reg = %5 : i32 -> i32
          %6 = hec.addi %r_main_20.reg %muli_main_6.result {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_29.reg = %6 : i32 -> i32
          %7 = hec.addi %r_main_5.reg %muli_main_7.result {dump = "comb_22"} : (i32, i32) -> i32
          hec.assign %r_main_30.reg = %7 : i32 -> i32
          %8 = hec.addi %r_main_25.reg %muli_main_8.result {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_31.reg = %8 : i32 -> i32
          %9 = hec.addi %r_main_5.reg %muli_main_9.result {dump = "comb_24"} : (i32, i32) -> i32
          hec.assign %r_main_32.reg = %9 : i32 -> i32
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          hec.assign %r_main_24.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_28.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          hec.assign %r_main_7.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_19.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.assign %r_main_8.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_31.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s9 {
          hec.assign %r_main_10.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_30.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_12.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_29.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %r_main_13.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_11.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_14.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_9.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %r_main_11.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_6.reg : i32 -> i11
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_9.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.addi %mem_global_0.r_data %r_main_11.reg {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_14.reg {dump = "comb_26"} : (i32, i32) -> i32
          %2 = hec.addi %1 %r_main_8.reg {dump = "comb_27"} : (i32, i32) -> i32
          %3 = hec.addi %2 %r_main_24.reg {dump = "comb_28"} : (i32, i32) -> i32
          hec.assign %r_main_17.reg = %3 : i32 -> i32
          %4 = hec.addi %3 %r_main_7.reg {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_18.reg = %4 : i32 -> i32
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          %0 = hec.addi %r_main_18.reg %r_main_13.reg {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_12.reg {dump = "comb_31"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %1 : i32 -> i32
          %2 = hec.addi %1 %r_main_10.reg {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %2 : i32 -> i32
          hec.assign %muli_main_0.operand0 = %2 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c9_i32 : i32 -> i32
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
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
          hec.assign %r_main_9.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_32.reg : i32 -> i11
          hec.assign %mem_global_0.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_33"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c38_i32 {dump = "comb_34"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s2_entry
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_35"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c38_i32 {dump = "comb_36"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s21 {
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_37"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c19_i32 {dump = "comb_38"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s23 {
          hec.transition {
            hec.goto @s24
          }
        }
        hec.state @s24 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_91"}
  }
  tor.design @kernel_seidel_2d {
    %c40_i32 = arith.constant {dump = "op_80"} 40 : i32
    %c1_i32 = arith.constant {dump = "op_72"} 1 : i32
    %c-1_i32 = arith.constant {dump = "op_56"} -1 : i32
    %c38_i32 = arith.constant {dump = "new_constant_0"} 38 : i32
    %c19_i32 = arith.constant {dump = "new_constant_2"} 19 : i32
    %c0_i32 = arith.constant {dump = "op_2"} 0 : i32
    %c9_i32 = arith.constant {dump = "op_1"} 9 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1600xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_91", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 24){
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
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [16 : i32] [{type = "static:2"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [2 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [1 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
        tor.succ 23 : [0 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32 : i32)
      on (0 to 22){
        tor.for %arg1 = (%c1_i32 : i32) to (%c38_i32 : i32) step (%c1_i32 : i32)
        on (1 to 20){
          tor.for %arg2 = (%c1_i32 : i32) to (%c38_i32 : i32) step (%c1_i32 : i32)
          on (2 to 18){
            %1 = tor.addi %arg1 %c-1_i32 on (3 to 4) {dump = "op_12"} : (i32, i32) -> i32
            %2 = tor.addi %arg2 %c-1_i32 on (3 to 4) {dump = "op_14"} : (i32, i32) -> i32
            %3 = tor.muli %1 %c40_i32 on (3 to 5) {dump = "op_16"} : (i32, i32) -> i32
            %4 = tor.addi %2 %3 on (5 to 6) {dump = "op_17"} : (i32, i32) -> i32
            %5 = tor.load %0[%4] on (13 to 14) {dump = "op_18"} : !tor.memref<1600xi32, [], "rw">[i32]
            %6 = tor.addi %arg1 %c-1_i32 on (3 to 4) {dump = "op_20"} : (i32, i32) -> i32
            %7 = tor.muli %6 %c40_i32 on (3 to 5) {dump = "op_22"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (5 to 6) {dump = "op_23"} : (i32, i32) -> i32
            %9 = tor.load %0[%8] on (12 to 13) {dump = "op_24"} : !tor.memref<1600xi32, [], "rw">[i32]
            %10 = tor.addi %5 %9 on (14 to 15) {dump = "op_25"} : (i32, i32) -> i32
            %11 = tor.addi %arg1 %c-1_i32 on (3 to 4) {dump = "op_27"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %c1_i32 on (3 to 4) {dump = "op_29"} : (i32, i32) -> i32
            %13 = tor.muli %11 %c40_i32 on (3 to 5) {dump = "op_31"} : (i32, i32) -> i32
            %14 = tor.addi %12 %13 on (5 to 6) {dump = "op_32"} : (i32, i32) -> i32
            %15 = tor.load %0[%14] on (11 to 12) {dump = "op_33"} : !tor.memref<1600xi32, [], "rw">[i32]
            %16 = tor.addi %10 %15 on (14 to 15) {dump = "op_34"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %c-1_i32 on (3 to 4) {dump = "op_36"} : (i32, i32) -> i32
            %18 = tor.muli %arg1 %c40_i32 on (3 to 5) {dump = "op_38"} : (i32, i32) -> i32
            %19 = tor.addi %17 %18 on (5 to 6) {dump = "op_39"} : (i32, i32) -> i32
            %20 = tor.load %0[%19] on (7 to 8) {dump = "op_40"} : !tor.memref<1600xi32, [], "rw">[i32]
            %21 = tor.addi %16 %20 on (14 to 15) {dump = "op_41"} : (i32, i32) -> i32
            %22 = tor.muli %arg1 %c40_i32 on (3 to 5) {dump = "op_43"} : (i32, i32) -> i32
            %23 = tor.addi %arg2 %22 on (5 to 6) {dump = "op_44"} : (i32, i32) -> i32
            %24 = tor.load %0[%23] on (5 to 6) {dump = "op_45"} : !tor.memref<1600xi32, [], "rw">[i32]
            %25 = tor.addi %21 %24 on (14 to 15) {dump = "op_46"} : (i32, i32) -> i32
            %26 = tor.addi %arg2 %c1_i32 on (3 to 4) {dump = "op_48"} : (i32, i32) -> i32
            %27 = tor.muli %arg1 %c40_i32 on (3 to 5) {dump = "op_50"} : (i32, i32) -> i32
            %28 = tor.addi %26 %27 on (5 to 6) {dump = "op_51"} : (i32, i32) -> i32
            %29 = tor.load %0[%28] on (6 to 7) {dump = "op_52"} : !tor.memref<1600xi32, [], "rw">[i32]
            %30 = tor.addi %25 %29 on (14 to 15) {dump = "op_53"} : (i32, i32) -> i32
            %31 = tor.addi %arg1 %c1_i32 on (3 to 4) {dump = "op_55"} : (i32, i32) -> i32
            %32 = tor.addi %arg2 %c-1_i32 on (3 to 4) {dump = "op_57"} : (i32, i32) -> i32
            %33 = tor.muli %31 %c40_i32 on (3 to 5) {dump = "op_59"} : (i32, i32) -> i32
            %34 = tor.addi %32 %33 on (5 to 6) {dump = "op_60"} : (i32, i32) -> i32
            %35 = tor.load %0[%34] on (10 to 11) {dump = "op_61"} : !tor.memref<1600xi32, [], "rw">[i32]
            %36 = tor.addi %30 %35 on (15 to 16) {dump = "op_62"} : (i32, i32) -> i32
            %37 = tor.addi %arg1 %c1_i32 on (3 to 4) {dump = "op_64"} : (i32, i32) -> i32
            %38 = tor.muli %37 %c40_i32 on (3 to 5) {dump = "op_66"} : (i32, i32) -> i32
            %39 = tor.addi %arg2 %38 on (5 to 6) {dump = "op_67"} : (i32, i32) -> i32
            %40 = tor.load %0[%39] on (9 to 10) {dump = "op_68"} : !tor.memref<1600xi32, [], "rw">[i32]
            %41 = tor.addi %36 %40 on (15 to 16) {dump = "op_69"} : (i32, i32) -> i32
            %42 = tor.addi %arg1 %c1_i32 on (3 to 4) {dump = "op_71"} : (i32, i32) -> i32
            %43 = tor.addi %arg2 %c1_i32 on (3 to 4) {dump = "op_73"} : (i32, i32) -> i32
            %44 = tor.muli %42 %c40_i32 on (3 to 5) {dump = "op_75"} : (i32, i32) -> i32
            %45 = tor.addi %43 %44 on (5 to 6) {dump = "op_76"} : (i32, i32) -> i32
            %46 = tor.load %0[%45] on (8 to 9) {dump = "op_77"} : !tor.memref<1600xi32, [], "rw">[i32]
            %47 = tor.addi %41 %46 on (15 to 16) {dump = "op_78"} : (i32, i32) -> i32
            %48 = tor.muli %47 %c9_i32 on (15 to 17) {dump = "op_79"} : (i32, i32) -> i32
            %49 = tor.muli %arg1 %c40_i32 on (3 to 5) {dump = "op_81"} : (i32, i32) -> i32
            %50 = tor.addi %arg2 %49 on (5 to 6) {dump = "op_82"} : (i32, i32) -> i32
            tor.store %48 to %0[%50] on (17 to 18) {dump = "op_83"} : (i32, !tor.memref<1600xi32, [], "rw">[i32])
          } {dump = "op_85"}
        } {dump = "op_87"}
      } {dump = "op_89"}
      tor.return {dump = "op_90"}
    }
  } {dump = "op_92", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

