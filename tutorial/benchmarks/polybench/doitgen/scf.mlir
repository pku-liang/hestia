module {
  tor.design @kernel_doitgen {
    %c12_i32 = arith.constant {dump = "op_43"} 12 : i32
    %c3_i32 = arith.constant {dump = "op_40"} 3 : i32
    %c11_i32 = arith.constant 11 : i32
    %c1_i32 = arith.constant {dump = "op_38"} 1 : i32
    %c12_i32_0 = arith.constant {dump = "op_37"} 12 : i32
    %c0_i32 = arith.constant {dump = "op_36"} 0 : i32
    %c12_i32_1 = arith.constant {dump = "op_24"} 12 : i32
    %c12_i32_2 = arith.constant {dump = "op_20"} 12 : i32
    %c3_i32_3 = arith.constant {dump = "op_17"} 3 : i32
    %c11_i32_4 = arith.constant 11 : i32
    %c1_i32_5 = arith.constant {dump = "op_16"} 1 : i32
    %c12_i32_6 = arith.constant {dump = "op_15"} 12 : i32
    %c0_i32_7 = arith.constant {dump = "op_14"} 0 : i32
    %c11_i32_8 = arith.constant 11 : i32
    %c1_i32_9 = arith.constant {dump = "op_12"} 1 : i32
    %c12_i32_10 = arith.constant {dump = "op_11"} 12 : i32
    %c0_i32_11 = arith.constant {dump = "op_10"} 0 : i32
    %c7_i32 = arith.constant 7 : i32
    %c1_i32_12 = arith.constant {dump = "op_9"} 1 : i32
    %c8_i32 = arith.constant {dump = "op_8"} 8 : i32
    %c0_i32_13 = arith.constant {dump = "op_7"} 0 : i32
    %c9_i32 = arith.constant 9 : i32
    %c1_i32_14 = arith.constant {dump = "op_6"} 1 : i32
    %c10_i32 = arith.constant {dump = "op_5"} 10 : i32
    %c0_i32_15 = arith.constant {dump = "op_4"} 0 : i32
    %c0_i32_16 = arith.constant {dump = "op_3"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<960xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<144xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<12xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_54", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_15 : i32) to (%c9_i32 : i32) step (%c1_i32_14 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_13 : i32) to (%c7_i32 : i32) step (%c1_i32_12 : i32)
        on (0 to 0){
          tor.for %arg2 = (%c0_i32_11 : i32) to (%c11_i32_8 : i32) step (%c1_i32_9 : i32)
          on (0 to 0){
            tor.store %c0_i32_16 to %2[%arg2] on (0 to 0) {dump = "op_13"} : (i32, !tor.memref<12xi32, [], "rw">[i32])
            tor.for %arg3 = (%c0_i32_7 : i32) to (%c11_i32_4 : i32) step (%c1_i32_5 : i32)
            on (0 to 0){
              %3 = arith.shli %arg0, %c3_i32_3 {dump = "op_18"} : i32
              %4 = tor.addi %arg1 %3 on (0 to 0) {dump = "op_19"} : (i32, i32) -> i32
              %5 = tor.muli %4 %c12_i32_2 on (0 to 0) {dump = "op_21"} : (i32, i32) -> i32
              %6 = tor.addi %arg3 %5 on (0 to 0) {dump = "op_22"} : (i32, i32) -> i32
              %7 = tor.load %0[%6] on (0 to 0) {dump = "op_23"} : !tor.memref<960xi32, [], "rw">[i32]
              %8 = tor.muli %arg3 %c12_i32_1 on (0 to 0) {dump = "op_25"} : (i32, i32) -> i32
              %9 = tor.addi %arg2 %8 on (0 to 0) {dump = "op_26"} : (i32, i32) -> i32
              %10 = tor.load %1[%9] on (0 to 0) {dump = "op_27"} : !tor.memref<144xi32, [], "r">[i32]
              %11 = tor.muli %7 %10 on (0 to 0) {dump = "op_28"} : (i32, i32) -> i32
              %12 = tor.load %2[%arg2] on (0 to 0) {dump = "op_29"} : !tor.memref<12xi32, [], "rw">[i32]
              %13 = tor.addi %12 %11 on (0 to 0) {dump = "op_30"} : (i32, i32) -> i32
              tor.store %13 to %2[%arg2] on (0 to 0) {dump = "op_31"} : (i32, !tor.memref<12xi32, [], "rw">[i32])
            } {dump = "op_33"}
          } {dump = "op_35"}
          tor.for %arg2 = (%c0_i32 : i32) to (%c11_i32 : i32) step (%c1_i32 : i32)
          on (0 to 0){
            %3 = tor.load %2[%arg2] on (0 to 0) {dump = "op_39"} : !tor.memref<12xi32, [], "rw">[i32]
            %4 = arith.shli %arg0, %c3_i32 {dump = "op_41"} : i32
            %5 = tor.addi %arg1 %4 on (0 to 0) {dump = "op_42"} : (i32, i32) -> i32
            %6 = tor.muli %5 %c12_i32 on (0 to 0) {dump = "op_44"} : (i32, i32) -> i32
            %7 = tor.addi %arg2 %6 on (0 to 0) {dump = "op_45"} : (i32, i32) -> i32
            tor.store %3 to %0[%7] on (0 to 0) {dump = "op_46"} : (i32, !tor.memref<960xi32, [], "rw">[i32])
          } {dump = "op_48"}
        } {dump = "op_50"}
      } {dump = "op_52"}
      tor.return {dump = "op_53"}
    }
  } {dump = "op_55", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

