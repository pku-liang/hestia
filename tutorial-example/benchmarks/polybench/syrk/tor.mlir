module {
  tor.design @kernel_syrk {
    %c5_i32 = arith.constant {dump = "op_44"} 5 : i32
    %c5_i32_0 = arith.constant {dump = "op_39"} 5 : i32
    %c5_i32_1 = arith.constant {dump = "op_34"} 5 : i32
    %c5_i32_2 = arith.constant {dump = "op_29"} 5 : i32
    %c1_i32 = arith.constant {dump = "op_28"} 1 : i32
    %c1_i32_3 = arith.constant {dump = "op_26"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_25"} 0 : i32
    %c31_i32 = arith.constant {dump = "new_constant_0"} 31 : i32
    %c1_i32_4 = arith.constant {dump = "op_24"} 1 : i32
    %c32_i32 = arith.constant {dump = "op_23"} 32 : i32
    %c0_i32_5 = arith.constant {dump = "op_22"} 0 : i32
    %c5_i32_6 = arith.constant {dump = "op_16"} 5 : i32
    %c5_i32_7 = arith.constant {dump = "op_11"} 5 : i32
    %c1_i32_8 = arith.constant {dump = "op_10"} 1 : i32
    %c1_i32_9 = arith.constant {dump = "op_8"} 1 : i32
    %c0_i32_10 = arith.constant {dump = "op_7"} 0 : i32
    %c31_i32_11 = arith.constant {dump = "new_constant_1"} 31 : i32
    %c1_i32_12 = arith.constant {dump = "op_6"} 1 : i32
    %c32_i32_13 = arith.constant {dump = "op_5"} 32 : i32
    %c0_i32_14 = arith.constant {dump = "op_4"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_3"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_2"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1024xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<1024xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_55", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 22){
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
        tor.succ 14 : [13 : i32] [{type = "static:3"}]
        tor.succ 15 : [14 : i32] [{type = "static:3"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [10 : i32] [{type = "static-for"}]
        tor.succ 18 : [17 : i32] [{type = "static"}]
        tor.succ 19 : [8 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [0 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32_14 : i32) to (%c31_i32_11 : i32) step (%c1_i32_12 : i32)
      on (0 to 20){
        %2 = tor.addi %arg0 %c1_i32_9 on (1 to 2) {dump = "op_9"} : (i32, i32) -> i32
        %3 = tor.subi %2 %c1_i32_8 on (1 to 2) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32_10 : i32) to (%3 : i32) step (%c1_i32_8 : i32)
        on (2 to 6){
          %4 = arith.shli %arg0, %c5_i32_7 {dump = "op_12", endtime = 4 : i32, starttime = 3 : i32} : i32
          %5 = tor.addi %arg1 %4 on (3 to 4) {dump = "op_13"} : (i32, i32) -> i32
          %6 = tor.load %0[%5] on (3 to 4) {dump = "op_14"} : !tor.memref<1024xi32, [], "rw">[i32]
          %7 = tor.muli %6 %c45_i32 on (4 to 5) {dump = "op_15"} : (i32, i32) -> i32
          %8 = arith.shli %arg0, %c5_i32_6 {dump = "op_17", endtime = 4 : i32, starttime = 3 : i32} : i32
          %9 = tor.addi %arg1 %8 on (3 to 4) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %7 to %0[%9] on (5 to 6) {dump = "op_19"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
        } {dump = "op_21"}
        tor.for %arg1 = (%c0_i32_5 : i32) to (%c31_i32 : i32) step (%c1_i32_4 : i32)
        on (8 to 18){
          %4 = tor.addi %arg0 %c1_i32_3 on (9 to 10) {dump = "op_27"} : (i32, i32) -> i32
          %5 = tor.subi %4 %c1_i32 on (9 to 10) {dump = "control_3"} : (i32, i32) -> i32
          tor.for %arg2 = (%c0_i32 : i32) to (%5 : i32) step (%c1_i32 : i32)
          on (10 to 16){
            %6 = arith.shli %arg0, %c5_i32_2 {dump = "op_30", endtime = 12 : i32, starttime = 11 : i32} : i32
            %7 = tor.addi %arg1 %6 on (11 to 12) {dump = "op_31"} : (i32, i32) -> i32
            %8 = tor.load %1[%7] on (12 to 13) {dump = "op_32"} : !tor.memref<1024xi32, [], "r">[i32]
            %9 = tor.muli %8 %c12_i32 on (13 to 14) {dump = "op_33"} : (i32, i32) -> i32
            %10 = arith.shli %arg2, %c5_i32_1 {dump = "op_35", endtime = 12 : i32, starttime = 11 : i32} : i32
            %11 = tor.addi %arg1 %10 on (11 to 12) {dump = "op_36"} : (i32, i32) -> i32
            %12 = tor.load %1[%11] on (11 to 12) {dump = "op_37"} : !tor.memref<1024xi32, [], "r">[i32]
            %13 = tor.muli %9 %12 on (14 to 15) {dump = "op_38"} : (i32, i32) -> i32
            %14 = arith.shli %arg0, %c5_i32_0 {dump = "op_40", endtime = 12 : i32, starttime = 11 : i32} : i32
            %15 = tor.addi %arg2 %14 on (11 to 12) {dump = "op_41"} : (i32, i32) -> i32
            %16 = tor.load %0[%15] on (11 to 12) {dump = "op_42"} : !tor.memref<1024xi32, [], "rw">[i32]
            %17 = tor.addi %16 %13 on (15 to 16) {dump = "op_43"} : (i32, i32) -> i32
            %18 = arith.shli %arg0, %c5_i32 {dump = "op_45", endtime = 12 : i32, starttime = 11 : i32} : i32
            %19 = tor.addi %arg2 %18 on (11 to 12) {dump = "op_46"} : (i32, i32) -> i32
            tor.store %17 to %0[%19] on (15 to 16) {dump = "op_47"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
          } {dump = "op_49"}
        } {dump = "op_51"}
      } {dump = "op_53"}
      tor.return {dump = "op_54"}
    }
  } {dump = "op_56", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

