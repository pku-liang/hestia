module {
  tor.design @kernel_gesummv {
    %c8_i32 = arith.constant {dump = "op_25"} 8 : i32
    %c8_i32_0 = arith.constant {dump = "op_16"} 8 : i32
    %c255_i32 = arith.constant 255 : i32
    %c1_i32 = arith.constant {dump = "op_15"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_14"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_13"} 0 : i32
    %c255_i32_1 = arith.constant 255 : i32
    %c1_i32_2 = arith.constant {dump = "op_10"} 1 : i32
    %c256_i32_3 = arith.constant {dump = "op_9"} 256 : i32
    %c0_i32_4 = arith.constant {dump = "op_8"} 0 : i32
    %c0_i32_5 = arith.constant {dump = "op_7"} 0 : i32
    %c12_i32 = arith.constant {dump = "op_6"} 12 : i32
    %c45_i32 = arith.constant {dump = "op_5"} 45 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<65536xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<65536xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<256xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_45", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_4 : i32) to (%c255_i32_1 : i32) step (%c1_i32_2 : i32)
      on (0 to 0){
        tor.store %c0_i32_5 to %2[%arg0] on (0 to 0) {dump = "op_11"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        tor.store %c0_i32_5 to %4[%arg0] on (0 to 0) {dump = "op_12"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (0 to 0){
          %10 = arith.shli %arg0, %c8_i32_0 {dump = "op_17"} : i32
          %11 = tor.addi %arg1 %10 on (0 to 0) {dump = "op_18"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (0 to 0) {dump = "op_19"} : !tor.memref<65536xi32, [], "r">[i32]
          %13 = tor.load %3[%arg1] on (0 to 0) {dump = "op_20"} : !tor.memref<256xi32, [], "r">[i32]
          %14 = tor.muli %12 %13 on (0 to 0) {dump = "op_21"} : (i32, i32) -> i32
          %15 = tor.load %2[%arg0] on (0 to 0) {dump = "op_22"} : !tor.memref<256xi32, [], "rw">[i32]
          %16 = tor.addi %14 %15 on (0 to 0) {dump = "op_23"} : (i32, i32) -> i32
          tor.store %16 to %2[%arg0] on (0 to 0) {dump = "op_24"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
          %17 = arith.shli %arg0, %c8_i32 {dump = "op_26"} : i32
          %18 = tor.addi %arg1 %17 on (0 to 0) {dump = "op_27"} : (i32, i32) -> i32
          %19 = tor.load %1[%18] on (0 to 0) {dump = "op_28"} : !tor.memref<65536xi32, [], "r">[i32]
          %20 = tor.load %3[%arg1] on (0 to 0) {dump = "op_29"} : !tor.memref<256xi32, [], "r">[i32]
          %21 = tor.muli %19 %20 on (0 to 0) {dump = "op_30"} : (i32, i32) -> i32
          %22 = tor.load %4[%arg0] on (0 to 0) {dump = "op_31"} : !tor.memref<256xi32, [], "rw">[i32]
          %23 = tor.addi %21 %22 on (0 to 0) {dump = "op_32"} : (i32, i32) -> i32
          tor.store %23 to %4[%arg0] on (0 to 0) {dump = "op_33"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_35"}
        %5 = tor.load %2[%arg0] on (0 to 0) {dump = "op_36"} : !tor.memref<256xi32, [], "rw">[i32]
        %6 = tor.muli %5 %c12_i32 on (0 to 0) {dump = "op_37"} : (i32, i32) -> i32
        %7 = tor.load %4[%arg0] on (0 to 0) {dump = "op_38"} : !tor.memref<256xi32, [], "rw">[i32]
        %8 = tor.muli %7 %c45_i32 on (0 to 0) {dump = "op_39"} : (i32, i32) -> i32
        %9 = tor.addi %6 %8 on (0 to 0) {dump = "op_40"} : (i32, i32) -> i32
        tor.store %9 to %4[%arg0] on (0 to 0) {dump = "op_41"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_43"}
      tor.return {dump = "op_44"}
    }
  } {dump = "op_46", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

