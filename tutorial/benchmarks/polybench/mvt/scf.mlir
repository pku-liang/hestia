module {
  tor.design @kernel_mvt {
    %c8_i32 = arith.constant {dump = "op_31"} 8 : i32
    %c255_i32 = arith.constant 255 : i32
    %c1_i32 = arith.constant {dump = "op_29"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_28"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_27"} 0 : i32
    %c255_i32_0 = arith.constant 255 : i32
    %c1_i32_1 = arith.constant {dump = "op_26"} 1 : i32
    %c256_i32_2 = arith.constant {dump = "op_25"} 256 : i32
    %c0_i32_3 = arith.constant {dump = "op_24"} 0 : i32
    %c8_i32_4 = arith.constant {dump = "op_12"} 8 : i32
    %c255_i32_5 = arith.constant 255 : i32
    %c1_i32_6 = arith.constant {dump = "op_10"} 1 : i32
    %c256_i32_7 = arith.constant {dump = "op_9"} 256 : i32
    %c0_i32_8 = arith.constant {dump = "op_8"} 0 : i32
    %c255_i32_9 = arith.constant 255 : i32
    %c1_i32_10 = arith.constant {dump = "op_7"} 1 : i32
    %c256_i32_11 = arith.constant {dump = "op_6"} 256 : i32
    %c0_i32_12 = arith.constant {dump = "op_5"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<65536xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_44", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_12 : i32) to (%c255_i32_9 : i32) step (%c1_i32_10 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_8 : i32) to (%c255_i32_5 : i32) step (%c1_i32_6 : i32)
        on (0 to 0){
          %5 = tor.load %0[%arg0] on (0 to 0) {dump = "op_11"} : !tor.memref<256xi32, [], "rw">[i32]
          %6 = arith.shli %arg0, %c8_i32_4 {dump = "op_13"} : i32
          %7 = tor.addi %arg1 %6 on (0 to 0) {dump = "op_14"} : (i32, i32) -> i32
          %8 = tor.load %4[%7] on (0 to 0) {dump = "op_15"} : !tor.memref<65536xi32, [], "r">[i32]
          %9 = tor.load %2[%arg1] on (0 to 0) {dump = "op_16"} : !tor.memref<256xi32, [], "r">[i32]
          %10 = tor.muli %8 %9 on (0 to 0) {dump = "op_17"} : (i32, i32) -> i32
          %11 = tor.addi %5 %10 on (0 to 0) {dump = "op_18"} : (i32, i32) -> i32
          tor.store %11 to %0[%arg0] on (0 to 0) {dump = "op_19"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_21"}
      } {dump = "op_23"}
      tor.for %arg0 = (%c0_i32_3 : i32) to (%c255_i32_0 : i32) step (%c1_i32_1 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (0 to 0){
          %5 = tor.load %1[%arg0] on (0 to 0) {dump = "op_30"} : !tor.memref<256xi32, [], "rw">[i32]
          %6 = arith.shli %arg1, %c8_i32 {dump = "op_32"} : i32
          %7 = tor.addi %arg0 %6 on (0 to 0) {dump = "op_33"} : (i32, i32) -> i32
          %8 = tor.load %4[%7] on (0 to 0) {dump = "op_34"} : !tor.memref<65536xi32, [], "r">[i32]
          %9 = tor.load %3[%arg1] on (0 to 0) {dump = "op_35"} : !tor.memref<256xi32, [], "r">[i32]
          %10 = tor.muli %8 %9 on (0 to 0) {dump = "op_36"} : (i32, i32) -> i32
          %11 = tor.addi %5 %10 on (0 to 0) {dump = "op_37"} : (i32, i32) -> i32
          tor.store %11 to %1[%arg0] on (0 to 0) {dump = "op_38"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_40"}
      } {dump = "op_42"}
      tor.return {dump = "op_43"}
    }
  } {dump = "op_45", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

