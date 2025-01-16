module {
  tor.design @kernel_jacobi_2d {
    %c30_i32 = arith.constant {dump = "op_94"} 30 : i32
    %c1_i32 = arith.constant {dump = "op_92"} 1 : i32
    %c30_i32_0 = arith.constant {dump = "op_87"} 30 : i32
    %c-1_i32 = arith.constant {dump = "op_85"} -1 : i32
    %c30_i32_1 = arith.constant {dump = "op_80"} 30 : i32
    %c1_i32_2 = arith.constant {dump = "op_78"} 1 : i32
    %c30_i32_3 = arith.constant {dump = "op_73"} 30 : i32
    %c1_i32_4 = arith.constant {dump = "op_71"} 1 : i32
    %c30_i32_5 = arith.constant {dump = "op_66"} 30 : i32
    %c-1_i32_6 = arith.constant {dump = "op_64"} -1 : i32
    %c30_i32_7 = arith.constant {dump = "op_60"} 30 : i32
    %c28_i32 = arith.constant 28 : i32
    %c1_i32_8 = arith.constant {dump = "op_59"} 1 : i32
    %c29_i32 = arith.constant {dump = "op_58"} 29 : i32
    %c1_i32_9 = arith.constant {dump = "op_57"} 1 : i32
    %c28_i32_10 = arith.constant 28 : i32
    %c1_i32_11 = arith.constant {dump = "op_56"} 1 : i32
    %c29_i32_12 = arith.constant {dump = "op_55"} 29 : i32
    %c1_i32_13 = arith.constant {dump = "op_54"} 1 : i32
    %c30_i32_14 = arith.constant {dump = "op_46"} 30 : i32
    %c1_i32_15 = arith.constant {dump = "op_44"} 1 : i32
    %c30_i32_16 = arith.constant {dump = "op_39"} 30 : i32
    %c-1_i32_17 = arith.constant {dump = "op_37"} -1 : i32
    %c30_i32_18 = arith.constant {dump = "op_32"} 30 : i32
    %c1_i32_19 = arith.constant {dump = "op_30"} 1 : i32
    %c30_i32_20 = arith.constant {dump = "op_25"} 30 : i32
    %c1_i32_21 = arith.constant {dump = "op_23"} 1 : i32
    %c30_i32_22 = arith.constant {dump = "op_18"} 30 : i32
    %c-1_i32_23 = arith.constant {dump = "op_16"} -1 : i32
    %c30_i32_24 = arith.constant {dump = "op_12"} 30 : i32
    %c28_i32_25 = arith.constant 28 : i32
    %c1_i32_26 = arith.constant {dump = "op_11"} 1 : i32
    %c29_i32_27 = arith.constant {dump = "op_10"} 29 : i32
    %c1_i32_28 = arith.constant {dump = "op_9"} 1 : i32
    %c28_i32_29 = arith.constant 28 : i32
    %c1_i32_30 = arith.constant {dump = "op_8"} 1 : i32
    %c29_i32_31 = arith.constant {dump = "op_7"} 29 : i32
    %c1_i32_32 = arith.constant {dump = "op_6"} 1 : i32
    %c19_i32 = arith.constant 19 : i32
    %c1_i32_33 = arith.constant {dump = "op_5"} 1 : i32
    %c20_i32 = arith.constant {dump = "op_4"} 20 : i32
    %c0_i32 = arith.constant {dump = "op_3"} 0 : i32
    %c2_i32 = arith.constant {dump = "op_2"} 2 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<900xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<900xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_105", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32_33 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c1_i32_32 : i32) to (%c28_i32_29 : i32) step (%c1_i32_30 : i32)
        on (0 to 0){
          tor.for %arg2 = (%c1_i32_28 : i32) to (%c28_i32_25 : i32) step (%c1_i32_26 : i32)
          on (0 to 0){
            %2 = tor.muli %arg1 %c30_i32_24 on (0 to 0) {dump = "op_13"} : (i32, i32) -> i32
            %3 = tor.addi %arg2 %2 on (0 to 0) {dump = "op_14"} : (i32, i32) -> i32
            %4 = tor.load %0[%3] on (0 to 0) {dump = "op_15"} : !tor.memref<900xi32, [], "rw">[i32]
            %5 = tor.addi %arg2 %c-1_i32_23 on (0 to 0) {dump = "op_17"} : (i32, i32) -> i32
            %6 = tor.muli %arg1 %c30_i32_22 on (0 to 0) {dump = "op_19"} : (i32, i32) -> i32
            %7 = tor.addi %5 %6 on (0 to 0) {dump = "op_20"} : (i32, i32) -> i32
            %8 = tor.load %0[%7] on (0 to 0) {dump = "op_21"} : !tor.memref<900xi32, [], "rw">[i32]
            %9 = tor.addi %4 %8 on (0 to 0) {dump = "op_22"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %c1_i32_21 on (0 to 0) {dump = "op_24"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32_20 on (0 to 0) {dump = "op_26"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (0 to 0) {dump = "op_27"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (0 to 0) {dump = "op_28"} : !tor.memref<900xi32, [], "rw">[i32]
            %14 = tor.addi %9 %13 on (0 to 0) {dump = "op_29"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32_19 on (0 to 0) {dump = "op_31"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32_18 on (0 to 0) {dump = "op_33"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (0 to 0) {dump = "op_34"} : (i32, i32) -> i32
            %18 = tor.load %0[%17] on (0 to 0) {dump = "op_35"} : !tor.memref<900xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (0 to 0) {dump = "op_36"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %c-1_i32_17 on (0 to 0) {dump = "op_38"} : (i32, i32) -> i32
            %21 = tor.muli %20 %c30_i32_16 on (0 to 0) {dump = "op_40"} : (i32, i32) -> i32
            %22 = tor.addi %arg2 %21 on (0 to 0) {dump = "op_41"} : (i32, i32) -> i32
            %23 = tor.load %0[%22] on (0 to 0) {dump = "op_42"} : !tor.memref<900xi32, [], "rw">[i32]
            %24 = tor.addi %19 %23 on (0 to 0) {dump = "op_43"} : (i32, i32) -> i32
            %25 = arith.shli %24, %c1_i32_15 {dump = "op_45"} : i32
            %26 = tor.muli %arg1 %c30_i32_14 on (0 to 0) {dump = "op_47"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (0 to 0) {dump = "op_48"} : (i32, i32) -> i32
            tor.store %25 to %1[%27] on (0 to 0) {dump = "op_49"} : (i32, !tor.memref<900xi32, [], "rw">[i32])
          } {dump = "op_51"}
        } {dump = "op_53"}
        tor.for %arg1 = (%c1_i32_13 : i32) to (%c28_i32_10 : i32) step (%c1_i32_11 : i32)
        on (0 to 0){
          tor.for %arg2 = (%c1_i32_9 : i32) to (%c28_i32 : i32) step (%c1_i32_8 : i32)
          on (0 to 0){
            %2 = tor.muli %arg1 %c30_i32_7 on (0 to 0) {dump = "op_61"} : (i32, i32) -> i32
            %3 = tor.addi %arg2 %2 on (0 to 0) {dump = "op_62"} : (i32, i32) -> i32
            %4 = tor.load %1[%3] on (0 to 0) {dump = "op_63"} : !tor.memref<900xi32, [], "rw">[i32]
            %5 = tor.addi %arg2 %c-1_i32_6 on (0 to 0) {dump = "op_65"} : (i32, i32) -> i32
            %6 = tor.muli %arg1 %c30_i32_5 on (0 to 0) {dump = "op_67"} : (i32, i32) -> i32
            %7 = tor.addi %5 %6 on (0 to 0) {dump = "op_68"} : (i32, i32) -> i32
            %8 = tor.load %1[%7] on (0 to 0) {dump = "op_69"} : !tor.memref<900xi32, [], "rw">[i32]
            %9 = tor.addi %4 %8 on (0 to 0) {dump = "op_70"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %c1_i32_4 on (0 to 0) {dump = "op_72"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32_3 on (0 to 0) {dump = "op_74"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (0 to 0) {dump = "op_75"} : (i32, i32) -> i32
            %13 = tor.load %1[%12] on (0 to 0) {dump = "op_76"} : !tor.memref<900xi32, [], "rw">[i32]
            %14 = tor.addi %9 %13 on (0 to 0) {dump = "op_77"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32_2 on (0 to 0) {dump = "op_79"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32_1 on (0 to 0) {dump = "op_81"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (0 to 0) {dump = "op_82"} : (i32, i32) -> i32
            %18 = tor.load %1[%17] on (0 to 0) {dump = "op_83"} : !tor.memref<900xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (0 to 0) {dump = "op_84"} : (i32, i32) -> i32
            %20 = tor.addi %arg1 %c-1_i32 on (0 to 0) {dump = "op_86"} : (i32, i32) -> i32
            %21 = tor.muli %20 %c30_i32_0 on (0 to 0) {dump = "op_88"} : (i32, i32) -> i32
            %22 = tor.addi %arg2 %21 on (0 to 0) {dump = "op_89"} : (i32, i32) -> i32
            %23 = tor.load %1[%22] on (0 to 0) {dump = "op_90"} : !tor.memref<900xi32, [], "rw">[i32]
            %24 = tor.addi %19 %23 on (0 to 0) {dump = "op_91"} : (i32, i32) -> i32
            %25 = arith.shli %24, %c1_i32 {dump = "op_93"} : i32
            %26 = tor.muli %arg1 %c30_i32 on (0 to 0) {dump = "op_95"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (0 to 0) {dump = "op_96"} : (i32, i32) -> i32
            tor.store %25 to %0[%27] on (0 to 0) {dump = "op_97"} : (i32, !tor.memref<900xi32, [], "rw">[i32])
          } {dump = "op_99"}
        } {dump = "op_101"}
      } {dump = "op_103"}
      tor.return {dump = "op_104"}
    }
  } {dump = "op_106", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

