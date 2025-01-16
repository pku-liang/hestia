module {
  hec.design @kernel_syr2k {
    %true = arith.constant {dump = "const_38"} true
    %c5_i32 = arith.constant {dump = "op_12"} 5 : i32
    %c31_i32 = arith.constant {dump = "new_constant_1"} 31 : i32
    %c1_i32 = arith.constant {dump = "op_7"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_5"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_4"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %mem_global_0.w_en, %mem_global_0.r_en, %mem_global_0.addr, %mem_global_0.w_data, %mem_global_0.r_data = hec.primitive "mem_global_0" is "mem" {len = 1024 : i32, ports = "rw"} : i1, i1, i10, i32, i32
    %mem_global_1.r_en, %mem_global_1.addr, %mem_global_1.r_data = hec.primitive "mem_global_1" is "mem" {len = 1024 : i32, ports = "r"} : i1, i10, i32
    %mem_global_2.r_en, %mem_global_2.addr, %mem_global_2.r_data = hec.primitive "mem_global_2" is "mem" {len = 1024 : i32, ports = "r"} : i1, i10, i32
    hec.component @main(%arg0: i1) -> (%arg1: i1)
		{interface="naked", style="STG"}{
      %muli_main_0.operand0, %muli_main_0.operand1, %muli_main_0.result = hec.primitive "muli_main_0" is "mul_integer" : i32, i32, i32
      %r_main_0.reg = hec.primitive "r_main_0" is "register" : i1
      %r_main_3.reg = hec.primitive "r_main_3" is "register" : i32
      %r_main_4.reg = hec.primitive "r_main_4" is "register" : i32
      %r_main_5.reg = hec.primitive "r_main_5" is "register" : i32
      %r_main_1.reg = hec.primitive "r_main_1" is "register" : i1
      %r_main_6.reg = hec.primitive "r_main_6" is "register" : i32
      %r_main_7.reg = hec.primitive "r_main_7" is "register" : i32
      %r_main_8.reg = hec.primitive "r_main_8" is "register" : i32
      %r_main_9.reg = hec.primitive "r_main_9" is "register" : i32
      %r_main_10.reg = hec.primitive "r_main_10" is "register" : i32
      %r_main_2.reg = hec.primitive "r_main_2" is "register" : i1
      %r_main_16.reg = hec.primitive "r_main_16" is "register" : i32
      %r_main_19.reg = hec.primitive "r_main_19" is "register" : i32
      %r_main_21.reg = hec.primitive "r_main_21" is "register" : i32
      hec.stateset {
        hec.state @s0* {
          hec.assign %r_main_0.reg = %true : i1 -> i1
          hec.assign %r_main_3.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s1
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
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_1"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.subi %0 %c1_i32 {dump = "comb_2"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s2
          }
        }
        hec.state @s2 {
          %0 = hec.cmpi "sle" %c0_i32 %r_main_5.reg {dump = "comb_3"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %0 : i1 -> i1
          %1 = hec.not %0 {dump = "comb_4"} : i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s3
            hec.goto @s7 if %1
          }
        } {control = 1 : i32}
        hec.state @s2_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_5"} : i1
          hec.transition {
            hec.goto @s3
            hec.goto @s7 if %0
          }
        } {control = 1 : i32}
        hec.state @s3 {
          %0 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_6"} : i32
          hec.assign %r_main_6.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %0 {dump = "comb_7"} : (i32, i32) -> i32
          hec.assign %r_main_7.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %1 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %2 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_8"} : i32
          hec.assign %r_main_9.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %2 {dump = "comb_9"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %3 : i32 -> i32
          hec.transition {
            hec.goto @s4
          }
        }
        hec.state @s4 {
          hec.assign %r_main_8.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_0.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c45_i32 : i32 -> i32
          hec.transition {
            hec.goto @s4_0
          }
        }
        hec.state @s4_0 {
          hec.transition {
            hec.goto @s4_1
          }
        }
        hec.state @s4_1 {
          hec.transition {
            hec.goto @s5
          }
        }
        hec.state @s5 {
          hec.assign %r_main_6.reg = %muli_main_0.result : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_10.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %muli_main_0.result : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s6
          }
        }
        hec.state @s6 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_10"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %r_main_5.reg {dump = "comb_11"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s2_entry
          }
        }
        hec.state @s7 {
          hec.assign %r_main_1.reg = %true : i1 -> i1
          hec.assign %r_main_4.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s9
          }
        }
        hec.state @s8_entry {
          %0 = hec.not %r_main_1.reg {dump = "comb_12"} : i1
          hec.transition {
            hec.goto @s9
            hec.goto @s21 if %0
          }
        } {control = 1 : i32}
        hec.state @s9 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_13"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.subi %0 %c1_i32 {dump = "comb_14"} : (i32, i32) -> i32
          hec.assign %r_main_6.reg = %1 : i32 -> i32
          hec.transition {
            hec.goto @s10
          }
        }
        hec.state @s10 {
          %0 = hec.cmpi "sle" %c0_i32 %r_main_6.reg {dump = "comb_15"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %0 : i1 -> i1
          %1 = hec.not %0 {dump = "comb_16"} : i1
          hec.assign %r_main_5.reg = %c0_i32 : i32 -> i32
          hec.transition {
            hec.goto @s11
            hec.goto @s19 if %1
          }
        } {control = 1 : i32}
        hec.state @s10_entry {
          %0 = hec.not %r_main_2.reg {dump = "comb_17"} : i1
          hec.transition {
            hec.goto @s11
            hec.goto @s19 if %0
          }
        } {control = 1 : i32}
        hec.state @s11 {
          %0 = hec.shift_left %r_main_5.reg %c5_i32 {dump = "comb_18"} : i32
          hec.assign %r_main_7.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_4.reg %0 {dump = "comb_19"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %1 : i32 -> i32
          %2 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_20"} : i32
          hec.assign %r_main_9.reg = %2 : i32 -> i32
          %3 = hec.addi %r_main_4.reg %2 {dump = "comb_21"} : (i32, i32) -> i32
          hec.assign %r_main_10.reg = %3 : i32 -> i32
          %4 = hec.shift_left %r_main_5.reg %c5_i32 {dump = "comb_22"} : i32
          %5 = hec.addi %r_main_4.reg %4 {dump = "comb_23"} : (i32, i32) -> i32
          hec.assign %mem_global_2.addr = %5 : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          %6 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_24"} : i32
          %7 = hec.addi %r_main_4.reg %6 {dump = "comb_25"} : (i32, i32) -> i32
          hec.assign %mem_global_1.addr = %7 : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          %8 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_26"} : i32
          %9 = hec.addi %r_main_5.reg %8 {dump = "comb_27"} : (i32, i32) -> i32
          hec.assign %mem_global_0.addr = %9 : i32 -> i10
          hec.enable %mem_global_0.r_en : i1
          %10 = hec.shift_left %r_main_3.reg %c5_i32 {dump = "comb_28"} : i32
          %11 = hec.addi %r_main_5.reg %10 {dump = "comb_29"} : (i32, i32) -> i32
          hec.assign %r_main_21.reg = %11 : i32 -> i32
          hec.transition {
            hec.goto @s12
          }
        }
        hec.state @s12 {
          hec.assign %r_main_16.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %r_main_19.reg = %mem_global_0.r_data : i32 -> i32
          hec.assign %mem_global_1.addr = %r_main_8.reg : i32 -> i10
          hec.enable %mem_global_1.r_en : i1
          hec.assign %mem_global_2.addr = %r_main_10.reg : i32 -> i10
          hec.enable %mem_global_2.r_en : i1
          hec.assign %muli_main_0.operand0 = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
          hec.transition {
            hec.goto @s13
          }
        }
        hec.state @s13 {
          hec.assign %r_main_7.reg = %mem_global_1.r_data : i32 -> i32
          hec.assign %r_main_9.reg = %mem_global_2.r_data : i32 -> i32
          hec.assign %muli_main_0.operand0 = %mem_global_1.r_data : i32 -> i32
          hec.assign %muli_main_0.operand1 = %c12_i32 : i32 -> i32
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
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_16.reg : i32 -> i32
          hec.transition {
            hec.goto @s15
          }
        }
        hec.state @s15 {
          hec.assign %r_main_8.reg = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand0 = %muli_main_0.result : i32 -> i32
          hec.assign %muli_main_0.operand1 = %r_main_9.reg : i32 -> i32
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
          hec.assign %r_main_7.reg = %muli_main_0.result : i32 -> i32
          hec.transition {
            hec.goto @s17
          }
        }
        hec.state @s17 {
          hec.assign %r_main_10.reg = %muli_main_0.result : i32 -> i32
          %0 = hec.addi %muli_main_0.result %r_main_7.reg {dump = "comb_30"} : (i32, i32) -> i32
          hec.assign %r_main_8.reg = %0 : i32 -> i32
          %1 = hec.addi %r_main_19.reg %0 {dump = "comb_31"} : (i32, i32) -> i32
          hec.assign %r_main_9.reg = %1 : i32 -> i32
          hec.assign %mem_global_0.addr = %r_main_21.reg : i32 -> i10
          hec.assign %mem_global_0.w_data = %1 : i32 -> i32
          hec.enable %mem_global_0.w_en : i1
          hec.transition {
            hec.goto @s18
          }
        }
        hec.state @s18 {
          %0 = hec.addi %r_main_5.reg %c1_i32 {dump = "comb_32"} : (i32, i32) -> i32
          hec.assign %r_main_5.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %r_main_6.reg {dump = "comb_33"} : (i32, i32) -> i1
          hec.assign %r_main_2.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s10_entry
          }
        }
        hec.state @s19 {
          hec.transition {
            hec.goto @s20
          }
        }
        hec.state @s20 {
          %0 = hec.addi %r_main_4.reg %c1_i32 {dump = "comb_34"} : (i32, i32) -> i32
          hec.assign %r_main_4.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c31_i32 {dump = "comb_35"} : (i32, i32) -> i1
          hec.assign %r_main_1.reg = %1 : i1 -> i1
          hec.transition {
            hec.goto @s8_entry
          }
        }
        hec.state @s21 {
          hec.transition {
            hec.goto @s22
          }
        }
        hec.state @s22 {
          %0 = hec.addi %r_main_3.reg %c1_i32 {dump = "comb_36"} : (i32, i32) -> i32
          hec.assign %r_main_3.reg = %0 : i32 -> i32
          %1 = hec.cmpi "sle" %0 %c31_i32 {dump = "comb_37"} : (i32, i32) -> i1
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
    } {dump = "op_67"}
  }
  tor.design @kernel_syr2k {
    %c5_i32 = arith.constant {dump = "op_56"} 5 : i32
    %c1_i32 = arith.constant {dump = "op_29"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_26"} 0 : i32
    %c31_i32 = arith.constant {dump = "new_constant_0"} 31 : i32
    %c45_i32 = arith.constant {dump = "op_4"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1024xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<1024xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<1024xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_67", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 24){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static:1"}]
        tor.succ 3 : [2 : i32] [{type = "static"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static:3"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [2 : i32] [{type = "static-for"}]
        tor.succ 8 : [7 : i32] [{type = "static"}]
        tor.succ 9 : [8 : i32] [{type = "static"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:2"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:2"}]
        tor.succ 17 : [16 : i32] [{type = "static:1"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [10 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [8 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
        tor.succ 23 : [0 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
      on (0 to 22){
        %3 = tor.addi %arg0 %c1_i32 on (1 to 2) {dump = "op_10"} : (i32, i32) -> i32
        %4 = tor.subi %3 %c1_i32 on (1 to 2) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32 : i32) to (%4 : i32) step (%c1_i32 : i32)
        on (2 to 6){
          %5 = arith.shli %arg0, %c5_i32 {dump = "op_13", endtime = 4 : i32, starttime = 3 : i32} : i32
          %6 = tor.addi %arg1 %5 on (3 to 4) {dump = "op_14"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (3 to 4) {dump = "op_15"} : !tor.memref<1024xi32, [], "rw">[i32]
          %8 = tor.muli %7 %c45_i32 on (4 to 5) {dump = "op_16"} : (i32, i32) -> i32
          %9 = arith.shli %arg0, %c5_i32 {dump = "op_18", endtime = 4 : i32, starttime = 3 : i32} : i32
          %10 = tor.addi %arg1 %9 on (3 to 4) {dump = "op_19"} : (i32, i32) -> i32
          tor.store %8 to %0[%10] on (5 to 6) {dump = "op_20"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
        } {dump = "op_22"}
        tor.for %arg1 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
        on (8 to 20){
          %5 = tor.addi %arg0 %c1_i32 on (9 to 10) {dump = "op_28"} : (i32, i32) -> i32
          %6 = tor.subi %5 %c1_i32 on (9 to 10) {dump = "control_3"} : (i32, i32) -> i32
          tor.for %arg2 = (%c0_i32 : i32) to (%6 : i32) step (%c1_i32 : i32)
          on (10 to 18){
            %7 = arith.shli %arg2, %c5_i32 {dump = "op_31", endtime = 12 : i32, starttime = 11 : i32} : i32
            %8 = tor.addi %arg1 %7 on (11 to 12) {dump = "op_32"} : (i32, i32) -> i32
            %9 = tor.load %1[%8] on (12 to 13) {dump = "op_33"} : !tor.memref<1024xi32, [], "r">[i32]
            %10 = tor.muli %9 %c12_i32 on (13 to 15) {dump = "op_34"} : (i32, i32) -> i32
            %11 = arith.shli %arg0, %c5_i32 {dump = "op_36", endtime = 12 : i32, starttime = 11 : i32} : i32
            %12 = tor.addi %arg1 %11 on (11 to 12) {dump = "op_37"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (12 to 13) {dump = "op_38"} : !tor.memref<1024xi32, [], "r">[i32]
            %14 = tor.muli %10 %13 on (15 to 17) {dump = "op_39"} : (i32, i32) -> i32
            %15 = arith.shli %arg2, %c5_i32 {dump = "op_41", endtime = 12 : i32, starttime = 11 : i32} : i32
            %16 = tor.addi %arg1 %15 on (11 to 12) {dump = "op_42"} : (i32, i32) -> i32
            %17 = tor.load %2[%16] on (11 to 12) {dump = "op_43"} : !tor.memref<1024xi32, [], "r">[i32]
            %18 = tor.muli %17 %c12_i32 on (12 to 14) {dump = "op_44"} : (i32, i32) -> i32
            %19 = arith.shli %arg0, %c5_i32 {dump = "op_46", endtime = 12 : i32, starttime = 11 : i32} : i32
            %20 = tor.addi %arg1 %19 on (11 to 12) {dump = "op_47"} : (i32, i32) -> i32
            %21 = tor.load %1[%20] on (11 to 12) {dump = "op_48"} : !tor.memref<1024xi32, [], "r">[i32]
            %22 = tor.muli %18 %21 on (14 to 16) {dump = "op_49"} : (i32, i32) -> i32
            %23 = tor.addi %14 %22 on (17 to 18) {dump = "op_50"} : (i32, i32) -> i32
            %24 = arith.shli %arg0, %c5_i32 {dump = "op_52", endtime = 12 : i32, starttime = 11 : i32} : i32
            %25 = tor.addi %arg2 %24 on (11 to 12) {dump = "op_53"} : (i32, i32) -> i32
            %26 = tor.load %0[%25] on (11 to 12) {dump = "op_54"} : !tor.memref<1024xi32, [], "rw">[i32]
            %27 = tor.addi %26 %23 on (17 to 18) {dump = "op_55"} : (i32, i32) -> i32
            %28 = arith.shli %arg0, %c5_i32 {dump = "op_57", endtime = 12 : i32, starttime = 11 : i32} : i32
            %29 = tor.addi %arg2 %28 on (11 to 12) {dump = "op_58"} : (i32, i32) -> i32
            tor.store %27 to %0[%29] on (17 to 18) {dump = "op_59"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
          } {dump = "op_61"}
        } {dump = "op_63"}
      } {dump = "op_65"}
      tor.return {dump = "op_66"}
    }
  } {dump = "op_68", "flatten-array" = 1 : i32, "move-while" = 1 : i32, staticPass = "Done"}
}

