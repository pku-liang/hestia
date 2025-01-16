module {
  hec.design @kernel_gemm {
    %true = arith.constant {dump = "const_25"} true
    %c6_i32 = arith.constant {dump = "op_28"} 6 : i32
    %c63_i32 = arith.constant {dump = "new_constant_1"} 63 : i32
    %c5_i32 = arith.constant {dump = "op_11"} 5 : i32
    %c31_i32 = arith.constant {dump = "new_constant_3"} 31 : i32
    %c1_i32 = arith.constant {dump = "op_7"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_5"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_4"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 1024 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 2048 : i32, ports = "r"} : i1, i11, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 2048 : i32, ports = "r"} : i1, i11, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_11.reg = hec.primitive "r_main_11" is "register" : i32
      %r_main_14.reg = hec.primitive "r_main_14" is "register" : i32
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
            hec.goto @s18 if %0
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
            hec.goto @s6 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          %0 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_2"} : i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %0 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %2 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_4"} : i32
          %3 = hec.addi %r_main_4.reg %2 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c45_i32 : i32 -> i32
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
          hec.assign %r_main_5.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_9.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c31_i32 {dump = "comb_7"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s6 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s7_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_8"} : i1
          hec.transition {
            hec.goto @s8
            hec.goto @s16 if %0
          }
        } {control = 1 : i32}
        hec.state @s8 {
          hec.assign %r_main_2.reg = %true : i1 -> i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s9
          }
        } {control = 1 : i32}
        hec.state @s8_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_9"} : i1
          hec.transition {
            hec.goto @s9
            hec.goto @s14 if %0
          }
        } {control = 1 : i32}
        hec.state @s9 {
          %0 = hec.shift_left %r_main_3.reg %c6_i32 {dump = "comb_10"} : i32
          %1 = hec.addi %r_main_4.reg %0 {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %1 : i32 -> i11
          hec.enable %mem_global_1.r_en : i1
          %2 = hec.shift_left %r_main_4.reg %c5_i32 {dump = "comb_12"} : i32
          hec.assign %r_main_9.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_5.reg %2 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %3 : i32 -> i11
          hec.enable %mem_global_2.r_en : i1
          %4 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_14"} : i32
          %5 = hec.addi %r_main_5.reg %4 {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %5 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %6 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_16"} : i32
          %7 = hec.addi %r_main_5.reg %6 {dump = "comb_17"} : (i32, i32) -> i32
          hec.assign %r_main_16.reg = %7 : i32 -> i32
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          hec.assign %r_main_11.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %r_main_14.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s10_0
          }
        }
        hec.state @s10_0 {
          hec.transition {
            hec.goto @s10_1
          }
        }
        hec.state @s10_1 {
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s11 {
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_11.reg : i32 -> i32
          hec.transition {
            hec.goto @s11_0
          }
        }
        hec.state @s11_0 {
          hec.transition {
            hec.goto @s11_1
          }
        }
        hec.state @s11_1 {
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          %0 = hec.addi %r_main_14.reg %muli_main_0.result {dump = "comb_18"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %r_main_16.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c31_i32 {dump = "comb_20"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s8_entry
          }
        }
        hec.state @s14 {
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c63_i32 {dump = "comb_22"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
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
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c31_i32 {dump = "comb_24"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s18 {
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_54"}
  }
  tor.design @kernel_gemm {
    %c5_i32 = arith.constant {dump = "op_43"} 5 : i32
    %c6_i32 = arith.constant {dump = "op_28"} 6 : i32
    %c31_i32 = arith.constant {dump = "new_constant_0"} 31 : i32
    %c1_i32 = arith.constant {dump = "op_27"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_25"} 0 : i32
    %c63_i32 = arith.constant {dump = "new_constant_1"} 63 : i32
    %c45_i32 = arith.constant {dump = "op_4"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1024xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<2048xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<2048xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_54", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 19){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:3"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [1 : i32] [{type = "static-for"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [7 : i32] [{type = "static"}]
        tor.succ 9 : [8 : i32] [{type = "static"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static:3"}]
        tor.succ 12 : [11 : i32] [{type = "static:3"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [8 : i32] [{type = "static-for"}]
        tor.succ 15 : [14 : i32] [{type = "static"}]
        tor.succ 16 : [7 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [0 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
      on (0 to 17){
        tor.for %arg1 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
        on (1 to 5){
          %3 = arith.shli %arg0, %c5_i32 {dump = "op_12", endtime = 3 : i32, starttime = 2 : i32} : i32
          %4 = tor.addi %arg1 %3 on (2 to 3) {dump = "op_13"} : (i32, i32) -> i32
          %5 = tor.load %0[%4] on (2 to 3) {dump = "op_14"} : !tor.memref<1024xi32, [], "rw">[i32]
          %6 = tor.muli %5 %c45_i32 on (3 to 4) {dump = "op_15"} : (i32, i32) -> i32
          %7 = arith.shli %arg0, %c5_i32 {dump = "op_17", endtime = 3 : i32, starttime = 2 : i32} : i32
          %8 = tor.addi %arg1 %7 on (2 to 3) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %6 to %0[%8] on (4 to 5) {dump = "op_19"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
        } {dump = "op_21"}
        tor.for %arg1 = (%c0_i32 : i32) to (%c63_i32 : i32) step (%c1_i32 : i32)
        on (7 to 15){
          tor.for %arg2 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
          on (8 to 13){
            %3 = arith.shli %arg0, %c6_i32 {dump = "op_29", endtime = 10 : i32, starttime = 9 : i32} : i32
            %4 = tor.addi %arg1 %3 on (9 to 10) {dump = "op_30"} : (i32, i32) -> i32
            %5 = tor.load %1[%4] on (9 to 10) {dump = "op_31"} : !tor.memref<2048xi32, [], "r">[i32]
            %6 = tor.muli %5 %c12_i32 on (10 to 11) {dump = "op_32"} : (i32, i32) -> i32
            %7 = arith.shli %arg1, %c5_i32 {dump = "op_34", endtime = 10 : i32, starttime = 9 : i32} : i32
            %8 = tor.addi %arg2 %7 on (9 to 10) {dump = "op_35"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (9 to 10) {dump = "op_36"} : !tor.memref<2048xi32, [], "r">[i32]
            %10 = tor.muli %6 %9 on (11 to 12) {dump = "op_37"} : (i32, i32) -> i32
            %11 = arith.shli %arg0, %c5_i32 {dump = "op_39", endtime = 10 : i32, starttime = 9 : i32} : i32
            %12 = tor.addi %arg2 %11 on (9 to 10) {dump = "op_40"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (9 to 10) {dump = "op_41"} : !tor.memref<1024xi32, [], "rw">[i32]
            %14 = tor.addi %13 %10 on (12 to 13) {dump = "op_42"} : (i32, i32) -> i32
            %15 = arith.shli %arg0, %c5_i32 {dump = "op_44", endtime = 10 : i32, starttime = 9 : i32} : i32
            %16 = tor.addi %arg2 %15 on (9 to 10) {dump = "op_45"} : (i32, i32) -> i32
            tor.store %14 to %0[%16] on (12 to 13) {dump = "op_46"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
          } {dump = "op_48"}
        } {dump = "op_50"}
      } {dump = "op_52"}
      tor.return {dump = "op_53"}
    }
  } {dump = "op_55", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

