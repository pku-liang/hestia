module {
  tor.design @kernel_bicg {
    %c8_i32 = arith.constant {dump = "op_29"} 8 : i32
    %c8_i32_0 = arith.constant {dump = "op_21"} 8 : i32
    %c255_i32 = arith.constant 255 : i32
    %c1_i32 = arith.constant {dump = "op_18"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_17"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_16"} 0 : i32
    %c255_i32_1 = arith.constant 255 : i32
    %c1_i32_2 = arith.constant {dump = "op_14"} 1 : i32
    %c256_i32_3 = arith.constant {dump = "op_13"} 256 : i32
    %c0_i32_4 = arith.constant {dump = "op_12"} 0 : i32
    %c255_i32_5 = arith.constant 255 : i32
    %c1_i32_6 = arith.constant {dump = "op_8"} 1 : i32
    %c256_i32_7 = arith.constant {dump = "op_7"} 256 : i32
    %c0_i32_8 = arith.constant {dump = "op_6"} 0 : i32
    %c0_i32_9 = arith.constant {dump = "op_5"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<65536xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<256xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_42", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_8 : i32) to (%c255_i32_5 : i32) step (%c1_i32_6 : i32)
      on (0 to 0){
        tor.store %c0_i32_9 to %1[%arg0] on (0 to 0) {dump = "op_9"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_11"}
      tor.for %arg0 = (%c0_i32_4 : i32) to (%c255_i32_1 : i32) step (%c1_i32_2 : i32)
      on (0 to 0){
        tor.store %c0_i32_9 to %2[%arg0] on (0 to 0) {dump = "op_15"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (0 to 0){
          %5 = tor.load %1[%arg1] on (0 to 0) {dump = "op_19"} : !tor.memref<256xi32, [], "rw">[i32]
          %6 = tor.load %4[%arg0] on (0 to 0) {dump = "op_20"} : !tor.memref<256xi32, [], "r">[i32]
          %7 = arith.shli %arg0, %c8_i32_0 {dump = "op_22"} : i32
          %8 = tor.addi %arg1 %7 on (0 to 0) {dump = "op_23"} : (i32, i32) -> i32
          %9 = tor.load %0[%8] on (0 to 0) {dump = "op_24"} : !tor.memref<65536xi32, [], "r">[i32]
          %10 = tor.muli %6 %9 on (0 to 0) {dump = "op_25"} : (i32, i32) -> i32
          %11 = tor.addi %5 %10 on (0 to 0) {dump = "op_26"} : (i32, i32) -> i32
          tor.store %11 to %1[%arg1] on (0 to 0) {dump = "op_27"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
          %12 = tor.load %2[%arg0] on (0 to 0) {dump = "op_28"} : !tor.memref<256xi32, [], "rw">[i32]
          %13 = arith.shli %arg0, %c8_i32 {dump = "op_30"} : i32
          %14 = tor.addi %arg1 %13 on (0 to 0) {dump = "op_31"} : (i32, i32) -> i32
          %15 = tor.load %0[%14] on (0 to 0) {dump = "op_32"} : !tor.memref<65536xi32, [], "r">[i32]
          %16 = tor.load %3[%arg1] on (0 to 0) {dump = "op_33"} : !tor.memref<256xi32, [], "r">[i32]
          %17 = tor.muli %15 %16 on (0 to 0) {dump = "op_34"} : (i32, i32) -> i32
          %18 = tor.addi %12 %17 on (0 to 0) {dump = "op_35"} : (i32, i32) -> i32
          tor.store %18 to %2[%arg0] on (0 to 0) {dump = "op_36"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_38"}
      } {dump = "op_40"}
      tor.return {dump = "op_41"}
    }
  } {dump = "op_43", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

