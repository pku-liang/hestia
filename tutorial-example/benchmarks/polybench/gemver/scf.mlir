module {
  tor.design @kernel_gemver {
    %c8_i32 = arith.constant {dump = "op_73"} 8 : i32
    %c255_i32 = arith.constant 255 : i32
    %c1_i32 = arith.constant {dump = "op_71"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_70"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_69"} 0 : i32
    %c255_i32_0 = arith.constant 255 : i32
    %c1_i32_1 = arith.constant {dump = "op_68"} 1 : i32
    %c256_i32_2 = arith.constant {dump = "op_67"} 256 : i32
    %c0_i32_3 = arith.constant {dump = "op_66"} 0 : i32
    %c255_i32_4 = arith.constant 255 : i32
    %c1_i32_5 = arith.constant {dump = "op_59"} 1 : i32
    %c256_i32_6 = arith.constant {dump = "op_58"} 256 : i32
    %c0_i32_7 = arith.constant {dump = "op_57"} 0 : i32
    %c8_i32_8 = arith.constant {dump = "op_44"} 8 : i32
    %c255_i32_9 = arith.constant 255 : i32
    %c1_i32_10 = arith.constant {dump = "op_42"} 1 : i32
    %c256_i32_11 = arith.constant {dump = "op_41"} 256 : i32
    %c0_i32_12 = arith.constant {dump = "op_40"} 0 : i32
    %c255_i32_13 = arith.constant 255 : i32
    %c1_i32_14 = arith.constant {dump = "op_39"} 1 : i32
    %c256_i32_15 = arith.constant {dump = "op_38"} 256 : i32
    %c0_i32_16 = arith.constant {dump = "op_37"} 0 : i32
    %c8_i32_17 = arith.constant {dump = "op_29"} 8 : i32
    %c8_i32_18 = arith.constant {dump = "op_17"} 8 : i32
    %c255_i32_19 = arith.constant 255 : i32
    %c1_i32_20 = arith.constant {dump = "op_16"} 1 : i32
    %c256_i32_21 = arith.constant {dump = "op_15"} 256 : i32
    %c0_i32_22 = arith.constant {dump = "op_14"} 0 : i32
    %c255_i32_23 = arith.constant 255 : i32
    %c1_i32_24 = arith.constant {dump = "op_13"} 1 : i32
    %c256_i32_25 = arith.constant {dump = "op_12"} 256 : i32
    %c0_i32_26 = arith.constant {dump = "op_11"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_10"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_9"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<65536xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<256xi32, [], "r">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<256xi32, [], "r">
    %5 = tor.alloc {dump = "op_5"} : !tor.memref<256xi32, [], "rw">
    %6 = tor.alloc {dump = "op_6"} : !tor.memref<256xi32, [], "rw">
    %7 = tor.alloc {dump = "op_7"} : !tor.memref<256xi32, [], "r">
    %8 = tor.alloc {dump = "op_8"} : !tor.memref<256xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_87", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_26 : i32) to (%c255_i32_23 : i32) step (%c1_i32_24 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_22 : i32) to (%c255_i32_19 : i32) step (%c1_i32_20 : i32)
        on (0 to 0){
          %9 = arith.shli %arg0, %c8_i32_18 {dump = "op_18"} : i32
          %10 = tor.addi %arg1 %9 on (0 to 0) {dump = "op_19"} : (i32, i32) -> i32
          %11 = tor.load %0[%10] on (0 to 0) {dump = "op_20"} : !tor.memref<65536xi32, [], "rw">[i32]
          %12 = tor.load %1[%arg0] on (0 to 0) {dump = "op_21"} : !tor.memref<256xi32, [], "r">[i32]
          %13 = tor.load %2[%arg1] on (0 to 0) {dump = "op_22"} : !tor.memref<256xi32, [], "r">[i32]
          %14 = tor.muli %12 %13 on (0 to 0) {dump = "op_23"} : (i32, i32) -> i32
          %15 = tor.addi %11 %14 on (0 to 0) {dump = "op_24"} : (i32, i32) -> i32
          %16 = tor.load %3[%arg0] on (0 to 0) {dump = "op_25"} : !tor.memref<256xi32, [], "r">[i32]
          %17 = tor.load %4[%arg1] on (0 to 0) {dump = "op_26"} : !tor.memref<256xi32, [], "r">[i32]
          %18 = tor.muli %16 %17 on (0 to 0) {dump = "op_27"} : (i32, i32) -> i32
          %19 = tor.addi %15 %18 on (0 to 0) {dump = "op_28"} : (i32, i32) -> i32
          %20 = arith.shli %arg0, %c8_i32_17 {dump = "op_30"} : i32
          %21 = tor.addi %arg1 %20 on (0 to 0) {dump = "op_31"} : (i32, i32) -> i32
          tor.store %19 to %0[%21] on (0 to 0) {dump = "op_32"} : (i32, !tor.memref<65536xi32, [], "rw">[i32])
        } {dump = "op_34"}
      } {dump = "op_36"}
      tor.for %arg0 = (%c0_i32_16 : i32) to (%c255_i32_13 : i32) step (%c1_i32_14 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_12 : i32) to (%c255_i32_9 : i32) step (%c1_i32_10 : i32)
        on (0 to 0){
          %9 = tor.load %6[%arg0] on (0 to 0) {dump = "op_43"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg1, %c8_i32_8 {dump = "op_45"} : i32
          %11 = tor.addi %arg0 %10 on (0 to 0) {dump = "op_46"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (0 to 0) {dump = "op_47"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c45_i32 on (0 to 0) {dump = "op_48"} : (i32, i32) -> i32
          %14 = tor.load %7[%arg1] on (0 to 0) {dump = "op_49"} : !tor.memref<256xi32, [], "r">[i32]
          %15 = tor.muli %13 %14 on (0 to 0) {dump = "op_50"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (0 to 0) {dump = "op_51"} : (i32, i32) -> i32
          tor.store %16 to %6[%arg0] on (0 to 0) {dump = "op_52"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_54"}
      } {dump = "op_56"}
      tor.for %arg0 = (%c0_i32_7 : i32) to (%c255_i32_4 : i32) step (%c1_i32_5 : i32)
      on (0 to 0){
        %9 = tor.load %6[%arg0] on (0 to 0) {dump = "op_60"} : !tor.memref<256xi32, [], "rw">[i32]
        %10 = tor.load %8[%arg0] on (0 to 0) {dump = "op_61"} : !tor.memref<256xi32, [], "r">[i32]
        %11 = tor.addi %9 %10 on (0 to 0) {dump = "op_62"} : (i32, i32) -> i32
        tor.store %11 to %6[%arg0] on (0 to 0) {dump = "op_63"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_65"}
      tor.for %arg0 = (%c0_i32_3 : i32) to (%c255_i32_0 : i32) step (%c1_i32_1 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (0 to 0){
          %9 = tor.load %5[%arg0] on (0 to 0) {dump = "op_72"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg0, %c8_i32 {dump = "op_74"} : i32
          %11 = tor.addi %arg1 %10 on (0 to 0) {dump = "op_75"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (0 to 0) {dump = "op_76"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c12_i32 on (0 to 0) {dump = "op_77"} : (i32, i32) -> i32
          %14 = tor.load %6[%arg1] on (0 to 0) {dump = "op_78"} : !tor.memref<256xi32, [], "rw">[i32]
          %15 = tor.muli %13 %14 on (0 to 0) {dump = "op_79"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (0 to 0) {dump = "op_80"} : (i32, i32) -> i32
          tor.store %16 to %5[%arg0] on (0 to 0) {dump = "op_81"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_83"}
      } {dump = "op_85"}
      tor.return {dump = "op_86"}
    }
  } {dump = "op_88", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

