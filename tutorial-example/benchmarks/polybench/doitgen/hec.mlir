module {
  hec.design @kernel_doitgen {
    %true = arith.constant {dump = "const_23"} true
    %c3_i32 = arith.constant {dump = "op_17"} 3 : i32
    %c11_i32 = arith.constant {dump = "new_constant_2"} 11 : i32
    %c12_i32 = arith.constant {dump = "op_11"} 12 : i32
    %c7_i32 = arith.constant {dump = "new_constant_3"} 7 : i32
    %c9_i32 = arith.constant {dump = "new_constant_4"} 9 : i32
    %c1_i32 = arith.constant {dump = "op_6"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 960 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 144 : i32, ports = "r"} : i1, i8, i32
    %mem_global_2.w_en, %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.w_data, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 12 : i32, ports = "rw"} : i1, i1, i4, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %muli_main_1.operand0, %muli_main_1.operand1, %muli_main_1.result = hec.primitive "muli_main_1" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i1
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_12.reg = hec.primitive "r_main_12" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c0_i32 : i32 -> i32
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
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c0_i32 : i32 -> i32
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
          hec.assign %r_main_6.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        } {control = 1 : i32}
        hec.state @s2_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_2"} : i1
          hec.transition {
            hec.goto @s3
            hec.goto @s13 if %0
          }
        } {control = 1 : i32}
        hec.state @s3 {
          hec.assign %mem_global_2.addr = %r_main_6.reg : i32 -> i4
          hec.assign %mem_global_2.w_data = %c0_i32 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.assign %r_main_3.reg = %true : i1 -> i1
          hec.assign %r_main_7.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s4_entry {
          %0 = hec.not %r_main_3.reg {dump = "comb_3"} : i1
          hec.transition {
            hec.goto @s5
            hec.goto @s11 if %0
          }
        } {control = 1 : i32}
        hec.state @s5 {
          %0 = hec.shift_left %r_main_4.reg %c3_i32 {dump = "comb_4"} : i32
          %1 = hec.addi %r_main_5.reg %0 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.assign %muli_main_1.operand0 = %r_main_7.reg : i32 -> i32
          hec.assign %muli_main_1.operand1 = %c12_i32 : i32 -> i32
          hec.assign %mem_global_2.addr = %r_main_6.reg : i32 -> i4
          hec.enable %mem_global_2.r_en : i1
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          hec.assign %r_main_12.reg = %mem_global_2.r_data : i32 -> i32
          hec.transition {
            hec.goto @s6_0
          }
        }
        hec.state @s6_0 {
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          %0 = hec.addi %r_main_7.reg %muli_main_0.result {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_6.reg %muli_main_1.result {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %1 : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_1.r_data : i32 -> i32
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
          %0 = hec.addi %r_main_12.reg %muli_main_0.result {dump = "comb_8"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %r_main_6.reg : i32 -> i4
          hec.assign %mem_global_2.w_data = %0 : i32 -> i32
          hec.enable %mem_global_2.w_en : i1
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          %0 = hec.addi %r_main_7.reg %c1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c11_i32 {dump = "comb_10"} : (i32, i32) -> i1
          hec.assign %r_main_3.reg = %1 : i1 -> i1
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
          %0 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c11_i32 {dump = "comb_12"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s2_entry
          }
        }
        hec.state @s13 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_6.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s14_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_13"} : i1
          hec.transition {
            hec.goto @s15
            hec.goto @s19 if %0
          }
        } {control = 1 : i32}
        hec.state @s15 {
          hec.assign %mem_global_2.addr = %r_main_6.reg : i32 -> i4
          hec.enable %mem_global_2.r_en : i1
          %0 = hec.shift_left %r_main_4.reg %c3_i32 {dump = "comb_14"} : i32
          %1 = hec.addi %r_main_5.reg %0 {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
          hec.assign %r_main_7.reg = %mem_global_2.r_data : i32 -> i32
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
          %0 = hec.addi %r_main_6.reg %muli_main_0.result {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %0 : i32 -> i10
          hec.assign %mem_global_0.w_data = %r_main_7.reg : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          %0 = hec.addi %r_main_6.reg %c1_i32 {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c11_i32 {dump = "comb_18"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s14_entry
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c7_i32 {dump = "comb_20"} : (i32, i32) -> i1
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
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c9_i32 {dump = "comb_22"} : (i32, i32) -> i1
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
    } {dump = "op_54"}
  }
  tor.design @kernel_doitgen {
    %c12_i32 = arith.constant {dump = "op_43"} 12 : i32
    %c3_i32 = arith.constant {dump = "op_40"} 3 : i32
    %c11_i32 = arith.constant {dump = "new_constant_0"} 11 : i32
    %c1_i32 = arith.constant {dump = "op_38"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_36"} 0 : i32
    %c7_i32 = arith.constant {dump = "new_constant_3"} 7 : i32
    %c9_i32 = arith.constant {dump = "new_constant_4"} 9 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<960xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<144xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<12xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_54", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 24){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static:2"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [8 : i32] [{type = "static:3"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [4 : i32] [{type = "static-for"}]
        tor.succ 12 : [11 : i32] [{type = "static"}]
        tor.succ 13 : [2 : i32] [{type = "static-for"}]
        tor.succ 14 : [13 : i32] [{type = "static"}]
        tor.succ 15 : [14 : i32] [{type = "static"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [16 : i32] [{type = "static:2"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [14 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [1 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
        tor.succ 23 : [0 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c9_i32 : i32) step (%c1_i32 : i32)
      on (0 to 22){
        tor.for %arg1 = (%c0_i32 : i32) to (%c7_i32 : i32) step (%c1_i32 : i32)
        on (1 to 20){
          tor.for %arg2 = (%c0_i32 : i32) to (%c11_i32 : i32) step (%c1_i32 : i32)
          on (2 to 12){
            tor.store %c0_i32 to %2[%arg2] on (3 to 4) {dump = "op_13"} : (i32, !tor.memref<12xi32, [], "rw">[i32])
            tor.for %arg3 = (%c0_i32 : i32) to (%c11_i32 : i32) step (%c1_i32 : i32)
            on (4 to 10){
              %3 = arith.shli %arg0, %c3_i32 {dump = "op_18", endtime = 6 : i32, starttime = 5 : i32} : i32
              %4 = tor.addi %arg1 %3 on (5 to 6) {dump = "op_19"} : (i32, i32) -> i32
              %5 = tor.muli %4 %c12_i32 on (5 to 7) {dump = "op_21"} : (i32, i32) -> i32
              %6 = tor.addi %arg3 %5 on (7 to 8) {dump = "op_22"} : (i32, i32) -> i32
              %7 = tor.load %0[%6] on (7 to 8) {dump = "op_23"} : !tor.memref<960xi32, [], "rw">[i32]
              %8 = tor.muli %arg3 %c12_i32 on (5 to 7) {dump = "op_25"} : (i32, i32) -> i32
              %9 = tor.addi %arg2 %8 on (7 to 8) {dump = "op_26"} : (i32, i32) -> i32
              %10 = tor.load %1[%9] on (7 to 8) {dump = "op_27"} : !tor.memref<144xi32, [], "r">[i32]
              %11 = tor.muli %7 %10 on (8 to 9) {dump = "op_28"} : (i32, i32) -> i32
              %12 = tor.load %2[%arg2] on (5 to 6) {dump = "op_29"} : !tor.memref<12xi32, [], "rw">[i32]
              %13 = tor.addi %12 %11 on (9 to 10) {dump = "op_30"} : (i32, i32) -> i32
              tor.store %13 to %2[%arg2] on (9 to 10) {dump = "op_31"} : (i32, !tor.memref<12xi32, [], "rw">[i32])
            } {dump = "op_33"}
          } {dump = "op_35"}
          tor.for %arg2 = (%c0_i32 : i32) to (%c11_i32 : i32) step (%c1_i32 : i32)
          on (14 to 18){
            %3 = tor.load %2[%arg2] on (15 to 16) {dump = "op_39"} : !tor.memref<12xi32, [], "rw">[i32]
            %4 = arith.shli %arg0, %c3_i32 {dump = "op_41", endtime = 16 : i32, starttime = 15 : i32} : i32
            %5 = tor.addi %arg1 %4 on (15 to 16) {dump = "op_42"} : (i32, i32) -> i32
            %6 = tor.muli %5 %c12_i32 on (15 to 17) {dump = "op_44"} : (i32, i32) -> i32
            %7 = tor.addi %arg2 %6 on (17 to 18) {dump = "op_45"} : (i32, i32) -> i32
            tor.store %3 to %0[%7] on (17 to 18) {dump = "op_46"} : (i32, !tor.memref<960xi32, [], "rw">[i32])
          } {dump = "op_48"}
        } {dump = "op_50"}
      } {dump = "op_52"}
      tor.return {dump = "op_53"}
    }
  } {dump = "op_55", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

