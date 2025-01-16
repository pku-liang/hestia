module {
  tor.design @kernel_syr2k {
    %c5_i32 = arith.constant {dump = "op_56"} 5 : i32
    %c5_i32_0 = arith.constant {dump = "op_51"} 5 : i32
    %c5_i32_1 = arith.constant {dump = "op_45"} 5 : i32
    %c5_i32_2 = arith.constant {dump = "op_40"} 5 : i32
    %c5_i32_3 = arith.constant {dump = "op_35"} 5 : i32
    %c5_i32_4 = arith.constant {dump = "op_30"} 5 : i32
    %c1_i32 = arith.constant {dump = "op_29"} 1 : i32
    %c1_i32_5 = arith.constant {dump = "op_27"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_26"} 0 : i32
    %c31_i32 = arith.constant 31 : i32
    %c1_i32_6 = arith.constant {dump = "op_25"} 1 : i32
    %c32_i32 = arith.constant {dump = "op_24"} 32 : i32
    %c0_i32_7 = arith.constant {dump = "op_23"} 0 : i32
    %c5_i32_8 = arith.constant {dump = "op_17"} 5 : i32
    %c5_i32_9 = arith.constant {dump = "op_12"} 5 : i32
    %c1_i32_10 = arith.constant {dump = "op_11"} 1 : i32
    %c1_i32_11 = arith.constant {dump = "op_9"} 1 : i32
    %c0_i32_12 = arith.constant {dump = "op_8"} 0 : i32
    %c31_i32_13 = arith.constant 31 : i32
    %c1_i32_14 = arith.constant {dump = "op_7"} 1 : i32
    %c32_i32_15 = arith.constant {dump = "op_6"} 32 : i32
    %c0_i32_16 = arith.constant {dump = "op_5"} 0 : i32
    %c45_i32 = arith.constant {dump = "op_4"} 45 : i32
    %c12_i32 = arith.constant {dump = "op_3"} 12 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1024xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<1024xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<1024xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_67", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_16 : i32) to (%c31_i32_13 : i32) step (%c1_i32_14 : i32)
      on (0 to 0){
        %3 = tor.addi %arg0 %c1_i32_11 on (0 to 0) {dump = "op_10"} : (i32, i32) -> i32
        %4 = tor.subi %3 %c1_i32_10 on (0 to 0) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32_12 : i32) to (%4 : i32) step (%c1_i32_10 : i32)
        on (0 to 0){
          %5 = arith.shli %arg0, %c5_i32_9 {dump = "op_13"} : i32
          %6 = tor.addi %arg1 %5 on (0 to 0) {dump = "op_14"} : (i32, i32) -> i32
          %7 = tor.load %0[%6] on (0 to 0) {dump = "op_15"} : !tor.memref<1024xi32, [], "rw">[i32]
          %8 = tor.muli %7 %c45_i32 on (0 to 0) {dump = "op_16"} : (i32, i32) -> i32
          %9 = arith.shli %arg0, %c5_i32_8 {dump = "op_18"} : i32
          %10 = tor.addi %arg1 %9 on (0 to 0) {dump = "op_19"} : (i32, i32) -> i32
          tor.store %8 to %0[%10] on (0 to 0) {dump = "op_20"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
        } {dump = "op_22"}
        tor.for %arg1 = (%c0_i32_7 : i32) to (%c31_i32 : i32) step (%c1_i32_6 : i32)
        on (0 to 0){
          %5 = tor.addi %arg0 %c1_i32_5 on (0 to 0) {dump = "op_28"} : (i32, i32) -> i32
          %6 = tor.subi %5 %c1_i32 on (0 to 0) {dump = "control_3"} : (i32, i32) -> i32
          tor.for %arg2 = (%c0_i32 : i32) to (%6 : i32) step (%c1_i32 : i32)
          on (0 to 0){
            %7 = arith.shli %arg2, %c5_i32_4 {dump = "op_31"} : i32
            %8 = tor.addi %arg1 %7 on (0 to 0) {dump = "op_32"} : (i32, i32) -> i32
            %9 = tor.load %1[%8] on (0 to 0) {dump = "op_33"} : !tor.memref<1024xi32, [], "r">[i32]
            %10 = tor.muli %9 %c12_i32 on (0 to 0) {dump = "op_34"} : (i32, i32) -> i32
            %11 = arith.shli %arg0, %c5_i32_3 {dump = "op_36"} : i32
            %12 = tor.addi %arg1 %11 on (0 to 0) {dump = "op_37"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (0 to 0) {dump = "op_38"} : !tor.memref<1024xi32, [], "r">[i32]
            %14 = tor.muli %10 %13 on (0 to 0) {dump = "op_39"} : (i32, i32) -> i32
            %15 = arith.shli %arg2, %c5_i32_2 {dump = "op_41"} : i32
            %16 = tor.addi %arg1 %15 on (0 to 0) {dump = "op_42"} : (i32, i32) -> i32
            %17 = tor.load %2[%16] on (0 to 0) {dump = "op_43"} : !tor.memref<1024xi32, [], "r">[i32]
            %18 = tor.muli %17 %c12_i32 on (0 to 0) {dump = "op_44"} : (i32, i32) -> i32
            %19 = arith.shli %arg0, %c5_i32_1 {dump = "op_46"} : i32
            %20 = tor.addi %arg1 %19 on (0 to 0) {dump = "op_47"} : (i32, i32) -> i32
            %21 = tor.load %1[%20] on (0 to 0) {dump = "op_48"} : !tor.memref<1024xi32, [], "r">[i32]
            %22 = tor.muli %18 %21 on (0 to 0) {dump = "op_49"} : (i32, i32) -> i32
            %23 = tor.addi %14 %22 on (0 to 0) {dump = "op_50"} : (i32, i32) -> i32
            %24 = arith.shli %arg0, %c5_i32_0 {dump = "op_52"} : i32
            %25 = tor.addi %arg2 %24 on (0 to 0) {dump = "op_53"} : (i32, i32) -> i32
            %26 = tor.load %0[%25] on (0 to 0) {dump = "op_54"} : !tor.memref<1024xi32, [], "rw">[i32]
            %27 = tor.addi %26 %23 on (0 to 0) {dump = "op_55"} : (i32, i32) -> i32
            %28 = arith.shli %arg0, %c5_i32 {dump = "op_57"} : i32
            %29 = tor.addi %arg2 %28 on (0 to 0) {dump = "op_58"} : (i32, i32) -> i32
            tor.store %27 to %0[%29] on (0 to 0) {dump = "op_59"} : (i32, !tor.memref<1024xi32, [], "rw">[i32])
          } {dump = "op_61"}
        } {dump = "op_63"}
      } {dump = "op_65"}
      tor.return {dump = "op_66"}
    }
  } {dump = "op_68", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

