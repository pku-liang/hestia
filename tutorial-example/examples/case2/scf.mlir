module {
  tor.design @kernel_syr2k {
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<256xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_67", resource = "./resource_dynamatic.json"} {
      %c34_i32 = arith.constant {dump = "op_3"} 34 : i32
      %c12_i32 = arith.constant {dump = "op_4"} 12 : i32
      %c0 = arith.constant {dump = "op_5"} 0 : index
      %c16 = arith.constant {dump = "op_6"} 16 : index
      %c1 = arith.constant {dump = "op_7"} 1 : index
      scf.for %arg0 = %c0 to %c16 step %c1 {
        %c0_0 = arith.constant {dump = "op_8"} 0 : index
        %c1_1 = arith.constant {dump = "op_9"} 1 : index
        %3 = arith.addi %arg0, %c1_1 {dump = "op_10"} : index
        %c1_2 = arith.constant {dump = "op_11"} 1 : index
        scf.for %arg1 = %c0_0 to %3 step %c1_2 {
          %c4 = arith.constant {dump = "op_12"} 4 : index
          %4 = arith.shli %arg0, %c4 {dump = "op_13"} : index
          %5 = arith.addi %arg1, %4 {dump = "op_14"} : index
          %6 = tor.load %0[%5] on (0 to 0) {dump = "op_15"} : !tor.memref<256xi32, [], "rw">[index]
          %7 = arith.muli %6, %c34_i32 {dump = "op_16"} : i32
          %c4_6 = arith.constant {dump = "op_17"} 4 : index
          %8 = arith.shli %arg0, %c4_6 {dump = "op_18"} : index
          %9 = arith.addi %arg1, %8 {dump = "op_19"} : index
          tor.store %7 to %0[%9] on (0 to 0) {dump = "op_20"} : (i32, !tor.memref<256xi32, [], "rw">[index])
        } {dump = "op_22"}
        %c0_3 = arith.constant {dump = "op_23"} 0 : index
        %c16_4 = arith.constant {dump = "op_24"} 16 : index
        %c1_5 = arith.constant {dump = "op_25"} 1 : index
        scf.for %arg1 = %c0_3 to %c16_4 step %c1_5 {
          %c0_6 = arith.constant {dump = "op_26"} 0 : index
          %c1_7 = arith.constant {dump = "op_27"} 1 : index
          %4 = arith.addi %arg0, %c1_7 {dump = "op_28"} : index
          %c1_8 = arith.constant {dump = "op_29"} 1 : index
          scf.for %arg2 = %c0_6 to %4 step %c1_8 {
            %c4 = arith.constant {dump = "op_30"} 4 : index
            %5 = arith.shli %arg2, %c4 {dump = "op_31"} : index
            %6 = arith.addi %arg1, %5 {dump = "op_32"} : index
            %7 = tor.load %1[%6] on (0 to 0) {dump = "op_33"} : !tor.memref<256xi32, [], "r">[index]
            %8 = arith.muli %7, %c12_i32 {dump = "op_34"} : i32
            %c4_9 = arith.constant {dump = "op_35"} 4 : index
            %9 = arith.shli %arg0, %c4_9 {dump = "op_36"} : index
            %10 = arith.addi %arg1, %9 {dump = "op_37"} : index
            %11 = tor.load %2[%10] on (0 to 0) {dump = "op_38"} : !tor.memref<256xi32, [], "r">[index]
            %12 = arith.muli %8, %11 {dump = "op_39"} : i32
            %c4_10 = arith.constant {dump = "op_40"} 4 : index
            %13 = arith.shli %arg2, %c4_10 {dump = "op_41"} : index
            %14 = arith.addi %arg1, %13 {dump = "op_42"} : index
            %15 = tor.load %2[%14] on (0 to 0) {dump = "op_43"} : !tor.memref<256xi32, [], "r">[index]
            %16 = arith.muli %15, %c12_i32 {dump = "op_44"} : i32
            %c4_11 = arith.constant {dump = "op_45"} 4 : index
            %17 = arith.shli %arg0, %c4_11 {dump = "op_46"} : index
            %18 = arith.addi %arg1, %17 {dump = "op_47"} : index
            %19 = tor.load %1[%18] on (0 to 0) {dump = "op_48"} : !tor.memref<256xi32, [], "r">[index]
            %20 = arith.muli %16, %19 {dump = "op_49"} : i32
            %21 = arith.addi %12, %20 {dump = "op_50"} : i32
            %c4_12 = arith.constant {dump = "op_51"} 4 : index
            %22 = arith.shli %arg0, %c4_12 {dump = "op_52"} : index
            %23 = arith.addi %arg2, %22 {dump = "op_53"} : index
            %24 = tor.load %0[%23] on (0 to 0) {dump = "op_54"} : !tor.memref<256xi32, [], "rw">[index]
            %25 = arith.addi %24, %21 {dump = "op_55"} : i32
            %c4_13 = arith.constant {dump = "op_56"} 4 : index
            %26 = arith.shli %arg0, %c4_13 {dump = "op_57"} : index
            %27 = arith.addi %arg2, %26 {dump = "op_58"} : index
            tor.store %25 to %0[%27] on (0 to 0) {dump = "op_59"} : (i32, !tor.memref<256xi32, [], "rw">[index])
          } {dump = "op_61"}
        } {dump = "op_63"}
      } {dump = "op_65"}
      tor.return {dump = "op_66"}
    }
  } {dump = "op_68", "flatten-array" = 1 : i32}
}

