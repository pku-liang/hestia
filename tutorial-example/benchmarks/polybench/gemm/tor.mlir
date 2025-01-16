module {
  tor.design @kernel_gemm {
    %c5_i32 = arith.constant {dump = "op_43"} 5 : i32
    %c5_i32_0 = arith.constant {dump = "op_38"} 5 : i32
    %c5_i32_1 = arith.constant {dump = "op_33"} 5 : i32
    %c6_i32 = arith.constant {dump = "op_28"} 6 : i32
    %c31_i32 = arith.constant {dump = "new_constant_0"} 31 : i32
    %c1_i32 = arith.constant {dump = "op_27"} 1 : i32
    %c32_i32 = arith.constant {dump = "op_26"} 32 : i32
    %c0_i32 = arith.constant {dump = "op_25"} 0 : i32
    %c63_i32 = arith.constant {dump = "new_constant_1"} 63 : i32
    %c1_i32_2 = arith.constant {dump = "op_24"} 1 : i32
    %c64_i32 = arith.constant {dump = "op_23"} 64 : i32
    %c0_i32_3 = arith.constant {dump = "op_22"} 0 : i32
    %c5_i32_4 = arith.constant {dump = "op_16"} 5 : i32
    %c5_i32_5 = arith.constant {dump = "op_11"} 5 : i32
    %c31_i32_6 = arith.constant {dump = "new_constant_2"} 31 : i32
    %c1_i32_7 = arith.constant {dump = "op_10"} 1 : i32
    %c32_i32_8 = arith.constant {dump = "op_9"} 32 : i32
    %c0_i32_9 = arith.constant {dump = "op_8"} 0 : i32
    %c31_i32_10 = arith.constant {dump = "new_constant_3"} 31 : i32
    %c1_i32_11 = arith.constant {dump = "op_7"} 1 : i32
    %c32_i32_12 = arith.constant {dump = "op_6"} 32 : i32
    %c0_i32_13 = arith.constant {dump = "op_5"} 0 : i32
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
      tor.for %arg0 = (%c0_i32_13 : i32) to (%c31_i32_10 : i32) step (%c1_i32_11 : i32)
      on (0 to 17){
        tor.for %arg1 = (%c0_i32_9 : i32) to (%c31_i32_6 : i32) step (%c1_i32_7 : i32)
        on (1 to 5){
          %3 = arith.shli %arg0, %c5_i32_5 {dump = "op_12", endtime = 3 : i32, starttime = 2 : i32} : i32
          %4 = tor.addi %arg1 %3 on (2 to 3) {dump = "op_13"} : (i32, i32) -> i32
          %5 = tor.load %0[%4] on (2 to 3) {dump = "op_14"} : !tor.memref<1024xi32, [], "rw">[i32]
          %6 = tor.muli %5 %c45_i32 on (3 to 4) {dump = "op_15"} : (i32, i32) -> i32
          %7 = arith.shli %arg0, %c5_i32_4 {dump = "op_17", endtime = 3 : i32, starttime = 2 : i32} : i32
          %8 = tor.addi %arg1 %7 on (2 to 3) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %6 to %0[%8] on (4 to 5) {dump = "op_19"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
        } {dump = "op_21"}
        tor.for %arg1 = (%c0_i32_3 : i32) to (%c63_i32 : i32) step (%c1_i32_2 : i32)
        on (7 to 15){
          tor.for %arg2 = (%c0_i32 : i32) to (%c31_i32 : i32) step (%c1_i32 : i32)
          on (8 to 13){
            %3 = arith.shli %arg0, %c6_i32 {dump = "op_29", endtime = 10 : i32, starttime = 9 : i32} : i32
            %4 = tor.addi %arg1 %3 on (9 to 10) {dump = "op_30"} : (i32, i32) -> i32
            %5 = tor.load %1[%4] on (9 to 10) {dump = "op_31"} : !tor.memref<2048xi32, [], "r">[i32]
            %6 = tor.muli %5 %c12_i32 on (10 to 11) {dump = "op_32"} : (i32, i32) -> i32
            %7 = arith.shli %arg1, %c5_i32_1 {dump = "op_34", endtime = 10 : i32, starttime = 9 : i32} : i32
            %8 = tor.addi %arg2 %7 on (9 to 10) {dump = "op_35"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (9 to 10) {dump = "op_36"} : !tor.memref<2048xi32, [], "r">[i32]
            %10 = tor.muli %6 %9 on (11 to 12) {dump = "op_37"} : (i32, i32) -> i32
            %11 = arith.shli %arg0, %c5_i32_0 {dump = "op_39", endtime = 10 : i32, starttime = 9 : i32} : i32
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
  } {dump = "op_55", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

