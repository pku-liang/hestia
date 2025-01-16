module {
  hec.design @kernel_mvt {
    %true = arith.constant {dump = "const_18"} true
    %c8_i32 = arith.constant {dump = "op_12"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_3"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_7"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_5"} 0 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_1.w_en, %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.w_data, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 256 : i32, ports = "rw"} : i1, i1, i8, i32, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_3.r_en, %mem_global_3.addr, %mem_global_3.r_data = hec.primitive "mem_global_3" is "mem" {len = 256 : i32, ports = "r"} : i1, i8, i32
    %mem_global_4.r_en, %mem_global_4.addr, %mem_global_4.r_data = hec.primitive "mem_global_4" is "mem" {len = 65536 : i32, ports = "r"} : i1, i16, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        } {control = 1 : i32}
        hec.state @s0_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_0"} : i1
          hec.transition {
            hec.goto @s1
            hec.goto @s8 if %0
          }
        } {control = 1 : i32}
        hec.state @s1 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
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
          hec.assign %mem_global_0.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_0.r_en : i1
          %0 = hec.shift_left %r_main_2.reg %c8_i32 {dump = "comb_2"} : i32
          %1 = hec.addi %r_main_3.reg %0 {dump = "comb_3"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %1 : i32 -> i16
          hec.enable %mem_global_4.r_en : i1
          hec.assign %mem_global_2.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_2.r_en : i1
          hec.transition {
            hec.goto @s3
          }
        }
        hec.state @s3 {
          hec.assign %r_main_4.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_2.r_data : i32 -> i32
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
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_4"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_0.w_data = %0 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_5"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_6"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s1_entry
          }
        }
        hec.state @s6 {
          hec.transition {
            hec.goto @s7
          }
        }
        hec.state @s7 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_8"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s0_entry
          }
        }
        hec.state @s8 {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_2.reg = %c0_i32 : i32 -> i32
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        }
        hec.state @s9_entry {
          %0 = hec.not %r_main_0.reg {dump = "comb_9"} : i1
          hec.transition {
            hec.goto @s10
            hec.goto @s17 if %0
          }
        } {control = 1 : i32}
        hec.state @s10 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
          }
        } {control = 1 : i32}
        hec.state @s10_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_10"} : i1
          hec.transition {
            hec.goto @s11
            hec.goto @s15 if %0
          }
        } {control = 1 : i32}
        hec.state @s11 {
          hec.assign %mem_global_1.addr = %r_main_2.reg : i32 -> i8
          hec.enable %mem_global_1.r_en : i1
          %0 = hec.shift_left %r_main_3.reg %c8_i32 {dump = "comb_11"} : i32
          %1 = hec.addi %r_main_2.reg %0 {dump = "comb_12"} : (i32, i32) -> i32
          hec.assign %mem_global_4.addr = %1 : i32 -> i16
          hec.enable %mem_global_4.r_en : i1
          hec.assign %mem_global_3.addr = %r_main_3.reg : i32 -> i8
          hec.enable %mem_global_3.r_en : i1
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_4.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_4.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %mem_global_3.r_data : i32 -> i32
          hec.transition {
            hec.goto @s12_0
          }
        }
        hec.state @s12_0 {
          hec.transition {
            hec.goto @s12_1
          }
        }
        hec.state @s12_1 {
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          %0 = hec.addi %r_main_4.reg %muli_main_0.result {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %r_main_2.reg : i32 -> i8
          hec.assign %mem_global_1.w_data = %0 : i32 -> i32
          hec.enable %mem_global_1.w_en : i1
          hec.transition {
            hec.goto @s14
          }
        }
        hec.state @s14 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_15"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s10_entry
          }
        }
        hec.state @s15 {
          hec.transition {
            hec.goto @s16
          }
        }
        hec.state @s16 {
          %0 = hec.addi %r_main_2.reg %c1_i32 {dump = "comb_16"} : (i32, i32) -> i32
          hec.assign %r_main_2.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c255_i32 {dump = "comb_17"} : (i32, i32) -> i1
          hec.assign %r_main_0.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s9_entry
          }
        }
        hec.state @s17 {
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          hec.transition {
            hec.done
          }
        }
      }
    } {dump = "op_44"}
  }
  tor.design @kernel_mvt {
    %c8_i32 = arith.constant {dump = "op_31"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_29"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_27"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<65536xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_44", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 18){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:3"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [1 : i32] [{type = "static-for"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [0 : i32] [{type = "static-for"}]
        tor.succ 9 : [8 : i32] [{type = "static"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:3"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [10 : i32] [{type = "static-for"}]
        tor.succ 16 : [15 : i32] [{type = "static"}]
        tor.succ 17 : [9 : i32] [{type = "static-for"}]
        tor.succ 18 : [17 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (0 to 7){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (1 to 5){
          %5 = tor.load %0[%arg0] on (2 to 3) {dump = "op_11"} : !tor.memref<256xi32, [], "rw">[i32]
          %6 = arith.shli %arg0, %c8_i32 {dump = "op_13", endtime = 3 : i32, starttime = 2 : i32} : i32
          %7 = tor.addi %arg1 %6 on (2 to 3) {dump = "op_14"} : (i32, i32) -> i32
          %8 = tor.load %4[%7] on (2 to 3) {dump = "op_15"} : !tor.memref<65536xi32, [], "r">[i32]
          %9 = tor.load %2[%arg1] on (2 to 3) {dump = "op_16"} : !tor.memref<256xi32, [], "r">[i32]
          %10 = tor.muli %8 %9 on (3 to 4) {dump = "op_17"} : (i32, i32) -> i32
          %11 = tor.addi %5 %10 on (4 to 5) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %11 to %0[%arg0] on (4 to 5) {dump = "op_19"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_21"}
      } {dump = "op_23"}
      tor.for %arg0 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
      on (9 to 16){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (10 to 14){
          %5 = tor.load %1[%arg0] on (11 to 12) {dump = "op_30"} : !tor.memref<256xi32, [], "rw">[i32]
          %6 = arith.shli %arg1, %c8_i32 {dump = "op_32", endtime = 12 : i32, starttime = 11 : i32} : i32
          %7 = tor.addi %arg0 %6 on (11 to 12) {dump = "op_33"} : (i32, i32) -> i32
          %8 = tor.load %4[%7] on (11 to 12) {dump = "op_34"} : !tor.memref<65536xi32, [], "r">[i32]
          %9 = tor.load %3[%arg1] on (11 to 12) {dump = "op_35"} : !tor.memref<256xi32, [], "r">[i32]
          %10 = tor.muli %8 %9 on (12 to 13) {dump = "op_36"} : (i32, i32) -> i32
          %11 = tor.addi %5 %10 on (13 to 14) {dump = "op_37"} : (i32, i32) -> i32
          tor.store %11 to %1[%arg0] on (13 to 14) {dump = "op_38"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_40"}
      } {dump = "op_42"}
      tor.return {dump = "op_43"}
    }
  } {dump = "op_45", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

