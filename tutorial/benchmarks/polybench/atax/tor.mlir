module {
  tor.design @kernel_atax {
    %c8_i32 = arith.constant {dump = "op_33"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_31"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_30"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_29"} 0 : i32
    %c8_i32_0 = arith.constant {dump = "op_19"} 8 : i32
    %c255_i32_1 = arith.constant {dump = "new_constant_1"} 255 : i32
    %c1_i32_2 = arith.constant {dump = "op_17"} 1 : i32
    %c256_i32_3 = arith.constant {dump = "op_16"} 256 : i32
    %c0_i32_4 = arith.constant {dump = "op_15"} 0 : i32
    %c255_i32_5 = arith.constant {dump = "new_constant_2"} 255 : i32
    %c1_i32_6 = arith.constant {dump = "op_13"} 1 : i32
    %c256_i32_7 = arith.constant {dump = "op_12"} 256 : i32
    %c0_i32_8 = arith.constant {dump = "op_11"} 0 : i32
    %c255_i32_9 = arith.constant {dump = "new_constant_3"} 255 : i32
    %c1_i32_10 = arith.constant {dump = "op_7"} 1 : i32
    %c256_i32_11 = arith.constant {dump = "op_6"} 256 : i32
    %c0_i32_12 = arith.constant {dump = "op_5"} 0 : i32
    %c0_i32_13 = arith.constant {dump = "op_4"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<65536xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_46", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 20){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static:1"}]
        tor.succ 3 : [0 : i32] [{type = "static-for"}]
        tor.succ 4 : [3 : i32] [{type = "static"}]
        tor.succ 5 : [4 : i32] [{type = "static"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [8 : i32] [{type = "static:3"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [6 : i32] [{type = "static-for"}]
        tor.succ 12 : [11 : i32] [{type = "static"}]
        tor.succ 13 : [12 : i32] [{type = "static"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:3"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [12 : i32] [{type = "static-for"}]
        tor.succ 18 : [17 : i32] [{type = "static"}]
        tor.succ 19 : [4 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32_12 : i32) to (%c255_i32_9 : i32) step (%c1_i32_10 : i32)
      on (0 to 2){
        tor.store %c0_i32_13 to %2[%arg0] on (1 to 2) {dump = "op_8"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_10"}
      tor.for %arg0 = (%c0_i32_8 : i32) to (%c255_i32_5 : i32) step (%c1_i32_6 : i32)
      on (4 to 18){
        tor.store %c0_i32_13 to %3[%arg0] on (5 to 6) {dump = "op_14"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        tor.for %arg1 = (%c0_i32_4 : i32) to (%c255_i32_1 : i32) step (%c1_i32_2 : i32)
        on (6 to 10){
          %4 = tor.load %3[%arg0] on (7 to 8) {dump = "op_18"} : !tor.memref<256xi32, [], "rw">[i32]
          %5 = arith.shli %arg0, %c8_i32_0 {dump = "op_20", endtime = 8 : i32, starttime = 7 : i32} : i32
          %6 = tor.addi %arg1 %5 on (7 to 8) {dump = "op_21"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (7 to 8) {dump = "op_22"} : !tor.memref<65536xi32, [], "r">[i32]
          %8 = tor.load %1[%arg1] on (7 to 8) {dump = "op_23"} : !tor.memref<256xi32, [], "r">[i32]
          %9 = tor.muli %7 %8 on (8 to 9) {dump = "op_24"} : (i32, i32) -> i32
          %10 = tor.addi %4 %9 on (9 to 10) {dump = "op_25"} : (i32, i32) -> i32
          tor.store %10 to %3[%arg0] on (9 to 10) {dump = "op_26"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_28"}
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (12 to 16){
          %4 = tor.load %2[%arg1] on (13 to 14) {dump = "op_32"} : !tor.memref<256xi32, [], "rw">[i32]
          %5 = arith.shli %arg0, %c8_i32 {dump = "op_34", endtime = 14 : i32, starttime = 13 : i32} : i32
          %6 = tor.addi %arg1 %5 on (13 to 14) {dump = "op_35"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (13 to 14) {dump = "op_36"} : !tor.memref<65536xi32, [], "r">[i32]
          %8 = tor.load %3[%arg0] on (13 to 14) {dump = "op_37"} : !tor.memref<256xi32, [], "rw">[i32]
          %9 = tor.muli %7 %8 on (14 to 15) {dump = "op_38"} : (i32, i32) -> i32
          %10 = tor.addi %4 %9 on (15 to 16) {dump = "op_39"} : (i32, i32) -> i32
          tor.store %10 to %2[%arg1] on (15 to 16) {dump = "op_40"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_42"}
      } {dump = "op_44"}
      tor.return {dump = "op_45"}
    }
  } {dump = "op_47", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

