module {
  tor.design @kernel_jacobi_1d {
    %c1_i32 = arith.constant {dump = "op_30"} 1 : i32
    %c-1_i32 = arith.constant {dump = "op_25"} -1 : i32
    %c254_i32 = arith.constant {dump = "new_constant_0"} 254 : i32
    %c1_i32_0 = arith.constant {dump = "op_24"} 1 : i32
    %c255_i32 = arith.constant {dump = "op_23"} 255 : i32
    %c1_i32_1 = arith.constant {dump = "op_22"} 1 : i32
    %c1_i32_2 = arith.constant {dump = "op_14"} 1 : i32
    %c-1_i32_3 = arith.constant {dump = "op_9"} -1 : i32
    %c254_i32_4 = arith.constant {dump = "new_constant_1"} 254 : i32
    %c1_i32_5 = arith.constant {dump = "op_8"} 1 : i32
    %c255_i32_6 = arith.constant {dump = "op_7"} 255 : i32
    %c1_i32_7 = arith.constant {dump = "op_6"} 1 : i32
    %c149_i32 = arith.constant {dump = "new_constant_2"} 149 : i32
    %c1_i32_8 = arith.constant {dump = "op_5"} 1 : i32
    %c150_i32 = arith.constant {dump = "op_4"} 150 : i32
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
      tor.for %arg0 = (%c0_i32 : i32) to (%c149_i32 : i32) step (%c1_i32_8 : i32)
      on (0 to 19){
        tor.for %arg1 = (%c1_i32_7 : i32) to (%c254_i32_4 : i32) step (%c1_i32_5 : i32)
        on (1 to 8){
          %2 = tor.addi %arg1 %c-1_i32_3 on (2 to 3) {dump = "op_10"} : (i32, i32) -> i32
          %3 = tor.load %0[%2] on (4 to 5) {dump = "op_11"} : !tor.memref<256xi32, [], "rw">[i32]
          %4 = tor.load %0[%arg1] on (2 to 3) {dump = "op_12"} : !tor.memref<256xi32, [], "rw">[i32]
          %5 = tor.addi %3 %4 on (5 to 6) {dump = "op_13"} : (i32, i32) -> i32
          %6 = tor.addi %arg1 %c1_i32_2 on (2 to 3) {dump = "op_15"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (3 to 4) {dump = "op_16"} : !tor.memref<256xi32, [], "rw">[i32]
          %8 = tor.addi %5 %7 on (5 to 6) {dump = "op_17"} : (i32, i32) -> i32
          %9 = tor.muli %8 %c3_i32 on (5 to 7) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %9 to %1[%arg1] on (7 to 8) {dump = "op_19"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_21"}
        tor.for %arg1 = (%c1_i32_1 : i32) to (%c254_i32 : i32) step (%c1_i32_0 : i32)
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
  } {dump = "op_42", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

