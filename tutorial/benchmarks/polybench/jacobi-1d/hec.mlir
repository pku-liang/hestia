module {
  hec.design @kernel_jacobi_1d {
    %true = arith.constant {dump = "const_17"} true
    %c-1_i32 = arith.constant {dump = "op_9"} -1 : i32
    %c254_i32 = arith.constant {dump = "new_constant_1"} 254 : i32
    %c149_i32 = arith.constant {dump = "new_constant_2"} 149 : i32
    %c1_i32 = arith.constant {dump = "op_5"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %c3_i32 = arith.constant {dump = "op_2"} 3 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s20 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s1_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_1"} : i1
          hec.transition {
            hec.goto @s2
            hec.goto @s9 if %0
          }
        } {control = 1 : i32}
        hec.state @s2 {
          %0 = hec.addi %r_main_3.reg %c-1_i32 {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          %1 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %r_main_5.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_6.reg : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          hec.assign %r_main_7.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_4.reg : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.assign %r_main_6.reg = %mem_global_0.r_data : i32 -> i32
          %0 = hec.addi %mem_global_0.r_data %r_main_5.reg {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_7.reg {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c3_i32 : i32 -> i32
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
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
          hec.assign %mem_global_1.addr = %r_main_3.reg : i32 -> i8
          hec.assign %mem_global_1.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s8
          }
        }
        hec.state @s8 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_6"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c254_i32 {dump = "comb_7"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s9 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c1_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s10_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_8"} : i1
          hec.transition {
            hec.goto @s11
            hec.goto @s18 if %0
          }
        } {control = 1 : i32}
        hec.state @s11 {
          %0 = hec.addi %r_main_3.reg %c-1_i32 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          %1 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_5.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_6.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %r_main_7.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_4.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          hec.assign %r_main_6.reg = %mem_global_1.r_data : i32 -> i32
          %0 = hec.addi %mem_global_1.r_data %r_main_5.reg {dump = "comb_11"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.addi %0 %r_main_7.reg {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %muli_main_0.operand0 = %1 : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c3_i32 : i32 -> i32
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          hec.transition {
            hec.goto @s15_0
          }
        }
        hec.state @s15_0 {
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
          hec.assign %mem_global_0.addr = %r_main_3.reg : i32 -> i8
          hec.assign %mem_global_0.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c254_i32 {dump = "comb_14"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s10_entry
          }
        }
        hec.state @s18 {
          hec.transition {
            hec.goto @s19
          }
        }
        hec.state @s19 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_15"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c149_i32 {dump = "comb_16"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s20 {
          hec.transition {
            hec.goto @s21
          }
        }
        hec.state @s21 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_41"}
  }
  tor.design @kernel_jacobi_1d {
    %c1_i32 = arith.constant {dump = "op_30"} 1 : i32
    %c-1_i32 = arith.constant {dump = "op_25"} -1 : i32
    %c254_i32 = arith.constant {dump = "new_constant_0"} 254 : i32
    %c149_i32 = arith.constant {dump = "new_constant_2"} 149 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %c3_i32 = arith.constant {dump = "op_2"} 3 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_41", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 21){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static:2"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [1 : i32] [{type = "static-for"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:2"}]
        tor.succ 17 : [16 : i32] [{type = "static:1"}]
        tor.succ 18 : [10 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
        tor.succ 20 : [0 : i32] [{type = "static-for"}]
        tor.succ 21 : [20 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c149_i32 : i32) step (%c1_i32 : i32)
      on (0 to 19){
        tor.for %arg1 = (%c1_i32 : i32) to (%c254_i32 : i32) step (%c1_i32 : i32)
        on (1 to 8){
          %2 = tor.addi %arg1 %c-1_i32 on (2 to 3) {dump = "op_10"} : (i32, i32) -> i32
          %3 = tor.load %0[%2] on (4 to 5) {dump = "op_11"} : !tor.memref<256xi32, [], "rw">[i32]
          %4 = tor.load %0[%arg1] on (2 to 3) {dump = "op_12"} : !tor.memref<256xi32, [], "rw">[i32]
          %5 = tor.addi %3 %4 on (5 to 6) {dump = "op_13"} : (i32, i32) -> i32
          %6 = tor.addi %arg1 %c1_i32 on (2 to 3) {dump = "op_15"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (3 to 4) {dump = "op_16"} : !tor.memref<256xi32, [], "rw">[i32]
          %8 = tor.addi %5 %7 on (5 to 6) {dump = "op_17"} : (i32, i32) -> i32
          %9 = tor.muli %8 %c3_i32 on (5 to 7) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %9 to %1[%arg1] on (7 to 8) {dump = "op_19"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_21"}
        tor.for %arg1 = (%c1_i32 : i32) to (%c254_i32 : i32) step (%c1_i32 : i32)
        on (10 to 17){
          %2 = tor.addi %arg1 %c-1_i32 on (11 to 12) {dump = "op_26"} : (i32, i32) -> i32
          %3 = tor.load %1[%2] on (13 to 14) {dump = "op_27"} : !tor.memref<256xi32, [], "rw">[i32]
          %4 = tor.load %1[%arg1] on (11 to 12) {dump = "op_28"} : !tor.memref<256xi32, [], "rw">[i32]
          %5 = tor.addi %3 %4 on (14 to 15) {dump = "op_29"} : (i32, i32) -> i32
          %6 = tor.addi %arg1 %c1_i32 on (11 to 12) {dump = "op_31"} : (i32, i32) -> i32
          %7 = tor.load %1[%6] on (12 to 13) {dump = "op_32"} : !tor.memref<256xi32, [], "rw">[i32]
          %8 = tor.addi %5 %7 on (14 to 15) {dump = "op_33"} : (i32, i32) -> i32
          %9 = tor.muli %8 %c3_i32 on (14 to 16) {dump = "op_34"} : (i32, i32) -> i32
          tor.store %9 to %0[%arg1] on (16 to 17) {dump = "op_35"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_37"}
      } {dump = "op_39"}
      tor.return {dump = "op_40"}
    }
  } {dump = "op_42", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

