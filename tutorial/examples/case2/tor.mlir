module {
  tor.design @kernel_syr2k {
    %c4_i32 = arith.constant {dump = "op_56"} 4 : i32
    %c4_i32_0 = arith.constant {dump = "op_51"} 4 : i32
    %c4_i32_1 = arith.constant {dump = "op_45"} 4 : i32
    %c4_i32_2 = arith.constant {dump = "op_40"} 4 : i32
    %c4_i32_3 = arith.constant {dump = "op_35"} 4 : i32
    %c4_i32_4 = arith.constant {dump = "op_30"} 4 : i32
    %c1_i32 = arith.constant {dump = "op_29"} 1 : i32
    %c1_i32_5 = arith.constant {dump = "op_27"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_26"} 0 : i32
    %c15_i32 = arith.constant {dump = "new_constant_0"} 15 : i32
    %c1_i32_6 = arith.constant {dump = "op_25"} 1 : i32
    %c16_i32 = arith.constant {dump = "op_24"} 16 : i32
    %c0_i32_7 = arith.constant {dump = "op_23"} 0 : i32
    %c4_i32_8 = arith.constant {dump = "op_17"} 4 : i32
    %c4_i32_9 = arith.constant {dump = "op_12"} 4 : i32
    %c1_i32_10 = arith.constant {dump = "op_11"} 1 : i32
    %c1_i32_11 = arith.constant {dump = "op_9"} 1 : i32
    %c0_i32_12 = arith.constant {dump = "op_8"} 0 : i32
    %c15_i32_13 = arith.constant {dump = "new_constant_1"} 15 : i32
    %c1_i32_14 = arith.constant {dump = "op_7"} 1 : i32
    %c16_i32_15 = arith.constant {dump = "op_6"} 16 : i32
    %c0_i32_16 = arith.constant {dump = "op_5"} 0 : i32
    %c12_i32 = arith.constant {dump = "op_4"} 12 : i32
    %c34_i32 = arith.constant {dump = "op_3"} 34 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_67", resource = "./resource_dynamatic.json", strategy = "static"} {
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
      tor.for %arg0 = (%c0_i32_16 : i32) to (%c15_i32_13 : i32) step (%c1_i32_14 : i32)
      on (0 to 22){
        %3 = tor.addi %arg0 %c1_i32_11 on (1 to 2) {dump = "op_10"} : (i32, i32) -> i32
        %4 = tor.subi %3 %c1_i32_10 on (1 to 2) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32_12 : i32) to (%4 : i32) step (%c1_i32_10 : i32)
        on (2 to 6){
          %5 = arith.shli %arg0, %c4_i32_9 {dump = "op_13", endtime = 4 : i32, starttime = 3 : i32} : i32
          %6 = tor.addi %arg1 %5 on (3 to 4) {dump = "op_14"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (3 to 4) {dump = "op_15"} : !tor.memref<256xi32, [], "rw">[i32]
          %8 = tor.muli %7 %c34_i32 on (4 to 5) {dump = "op_16"} : (i32, i32) -> i32
          %9 = arith.shli %arg0, %c4_i32_8 {dump = "op_18", endtime = 4 : i32, starttime = 3 : i32} : i32
          %10 = tor.addi %arg1 %9 on (3 to 4) {dump = "op_19"} : (i32, i32) -> i32
          tor.store %8 to %0[%10] on (5 to 6) {dump = "op_20"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_22"}
        tor.for %arg1 = (%c0_i32_7 : i32) to (%c15_i32 : i32) step (%c1_i32_6 : i32)
        on (8 to 20){
          tor.for %arg2 = (%c0_i32 : i32) to (%4 : i32) step (%c1_i32 : i32)
          on (10 to 18){
            %7 = arith.shli %arg2, %c4_i32_4 {dump = "op_31", endtime = 12 : i32, starttime = 11 : i32} : i32
            %8 = tor.addi %arg1 %7 on (11 to 12) {dump = "op_32"} : (i32, i32) -> i32
            %9 = tor.load %1[%8] on (12 to 13) {dump = "op_33"} : !tor.memref<256xi32, [], "r">[i32]
            %10 = tor.muli %9 %c12_i32 on (13 to 15) {dump = "op_34"} : (i32, i32) -> i32
            %11 = arith.shli %arg0, %c4_i32_3 {dump = "op_36", endtime = 12 : i32, starttime = 11 : i32} : i32
            %12 = tor.addi %arg1 %11 on (11 to 12) {dump = "op_37"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (12 to 13) {dump = "op_38"} : !tor.memref<256xi32, [], "r">[i32]
            %14 = tor.muli %10 %13 on (15 to 17) {dump = "op_39"} : (i32, i32) -> i32
            %15 = arith.shli %arg2, %c4_i32_2 {dump = "op_41", endtime = 12 : i32, starttime = 11 : i32} : i32
            %16 = tor.addi %arg1 %15 on (11 to 12) {dump = "op_42"} : (i32, i32) -> i32
            %17 = tor.load %2[%16] on (11 to 12) {dump = "op_43"} : !tor.memref<256xi32, [], "r">[i32]
            %18 = tor.muli %17 %c12_i32 on (12 to 14) {dump = "op_44"} : (i32, i32) -> i32
            %19 = arith.shli %arg0, %c4_i32_1 {dump = "op_46", endtime = 12 : i32, starttime = 11 : i32} : i32
            %20 = tor.addi %arg1 %19 on (11 to 12) {dump = "op_47"} : (i32, i32) -> i32
            %21 = tor.load %1[%20] on (11 to 12) {dump = "op_48"} : !tor.memref<256xi32, [], "r">[i32]
            %22 = tor.muli %18 %21 on (14 to 16) {dump = "op_49"} : (i32, i32) -> i32
            %23 = tor.addi %14 %22 on (17 to 18) {dump = "op_50"} : (i32, i32) -> i32
            %24 = arith.shli %arg0, %c4_i32_0 {dump = "op_52", endtime = 12 : i32, starttime = 11 : i32} : i32
            %25 = tor.addi %arg2 %24 on (11 to 12) {dump = "op_53"} : (i32, i32) -> i32
            %26 = tor.load %0[%25] on (11 to 12) {dump = "op_54"} : !tor.memref<256xi32, [], "rw">[i32]
            %27 = tor.addi %26 %23 on (17 to 18) {dump = "op_55"} : (i32, i32) -> i32
            %28 = arith.shli %arg0, %c4_i32 {dump = "op_57", endtime = 12 : i32, starttime = 11 : i32} : i32
            %29 = tor.addi %arg2 %28 on (11 to 12) {dump = "op_58"} : (i32, i32) -> i32
            tor.store %27 to %0[%29] on (17 to 18) {dump = "op_59"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
          } {dump = "op_61"}
        } {dump = "op_63"}
      } {dump = "op_65"}
      tor.return {dump = "op_66"}
    }
  } {dump = "op_68", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

