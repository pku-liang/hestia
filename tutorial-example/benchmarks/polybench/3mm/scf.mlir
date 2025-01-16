module {
  tor.design @kernel_3mm {
    %c22_i32 = arith.constant {dump = "op_109"} 22 : i32
    %c22_i32_0 = arith.constant {dump = "op_104"} 22 : i32
    %c22_i32_1 = arith.constant {dump = "op_99"} 22 : i32
    %c18_i32 = arith.constant {dump = "op_95"} 18 : i32
    %c17_i32 = arith.constant 17 : i32
    %c1_i32 = arith.constant {dump = "op_94"} 1 : i32
    %c18_i32_2 = arith.constant {dump = "op_93"} 18 : i32
    %c0_i32 = arith.constant {dump = "op_92"} 0 : i32
    %c22_i32_3 = arith.constant {dump = "op_88"} 22 : i32
    %c21_i32 = arith.constant 21 : i32
    %c1_i32_4 = arith.constant {dump = "op_87"} 1 : i32
    %c22_i32_5 = arith.constant {dump = "op_86"} 22 : i32
    %c0_i32_6 = arith.constant {dump = "op_85"} 0 : i32
    %c15_i32 = arith.constant 15 : i32
    %c1_i32_7 = arith.constant {dump = "op_84"} 1 : i32
    %c16_i32 = arith.constant {dump = "op_83"} 16 : i32
    %c0_i32_8 = arith.constant {dump = "op_82"} 0 : i32
    %c22_i32_9 = arith.constant {dump = "op_72"} 22 : i32
    %c22_i32_10 = arith.constant {dump = "op_67"} 22 : i32
    %c22_i32_11 = arith.constant {dump = "op_62"} 22 : i32
    %c24_i32 = arith.constant {dump = "op_58"} 24 : i32
    %c23_i32 = arith.constant 23 : i32
    %c1_i32_12 = arith.constant {dump = "op_57"} 1 : i32
    %c24_i32_13 = arith.constant {dump = "op_56"} 24 : i32
    %c0_i32_14 = arith.constant {dump = "op_55"} 0 : i32
    %c22_i32_15 = arith.constant {dump = "op_51"} 22 : i32
    %c21_i32_16 = arith.constant 21 : i32
    %c1_i32_17 = arith.constant {dump = "op_50"} 1 : i32
    %c22_i32_18 = arith.constant {dump = "op_49"} 22 : i32
    %c0_i32_19 = arith.constant {dump = "op_48"} 0 : i32
    %c17_i32_20 = arith.constant 17 : i32
    %c1_i32_21 = arith.constant {dump = "op_47"} 1 : i32
    %c18_i32_22 = arith.constant {dump = "op_46"} 18 : i32
    %c0_i32_23 = arith.constant {dump = "op_45"} 0 : i32
    %c18_i32_24 = arith.constant {dump = "op_35"} 18 : i32
    %c18_i32_25 = arith.constant {dump = "op_30"} 18 : i32
    %c18_i32_26 = arith.constant {dump = "op_25"} 18 : i32
    %c20_i32 = arith.constant {dump = "op_21"} 20 : i32
    %c19_i32 = arith.constant 19 : i32
    %c1_i32_27 = arith.constant {dump = "op_20"} 1 : i32
    %c20_i32_28 = arith.constant {dump = "op_19"} 20 : i32
    %c0_i32_29 = arith.constant {dump = "op_18"} 0 : i32
    %c18_i32_30 = arith.constant {dump = "op_14"} 18 : i32
    %c17_i32_31 = arith.constant 17 : i32
    %c1_i32_32 = arith.constant {dump = "op_13"} 1 : i32
    %c18_i32_33 = arith.constant {dump = "op_12"} 18 : i32
    %c0_i32_34 = arith.constant {dump = "op_11"} 0 : i32
    %c15_i32_35 = arith.constant 15 : i32
    %c1_i32_36 = arith.constant {dump = "op_10"} 1 : i32
    %c16_i32_37 = arith.constant {dump = "op_9"} 16 : i32
    %c0_i32_38 = arith.constant {dump = "op_8"} 0 : i32
    %c0_i32_39 = arith.constant {dump = "op_7"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<288xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<320xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<360xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<396xi32, [], "rw">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<432xi32, [], "r">
    %5 = tor.alloc {dump = "op_5"} : !tor.memref<528xi32, [], "r">
    %6 = tor.alloc {dump = "op_6"} : !tor.memref<352xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_120", resource = "../resource.json"} {
      tor.for %arg0 = (%c0_i32_38 : i32) to (%c15_i32_35 : i32) step (%c1_i32_36 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_34 : i32) to (%c17_i32_31 : i32) step (%c1_i32_32 : i32)
        on (0 to 0){
          %7 = tor.muli %arg0 %c18_i32_30 on (0 to 0) {dump = "op_15"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (0 to 0) {dump = "op_16"} : (i32, i32) -> i32
          tor.store %c0_i32_39 to %0[%8] on (0 to 0) {dump = "op_17"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32_29 : i32) to (%c19_i32 : i32) step (%c1_i32_27 : i32)
          on (0 to 0){
            %9 = tor.muli %arg0 %c20_i32 on (0 to 0) {dump = "op_22"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (0 to 0) {dump = "op_23"} : (i32, i32) -> i32
            %11 = tor.load %1[%10] on (0 to 0) {dump = "op_24"} : !tor.memref<320xi32, [], "r">[i32]
            %12 = tor.muli %arg2 %c18_i32_26 on (0 to 0) {dump = "op_26"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (0 to 0) {dump = "op_27"} : (i32, i32) -> i32
            %14 = tor.load %2[%13] on (0 to 0) {dump = "op_28"} : !tor.memref<360xi32, [], "r">[i32]
            %15 = tor.muli %11 %14 on (0 to 0) {dump = "op_29"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c18_i32_25 on (0 to 0) {dump = "op_31"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (0 to 0) {dump = "op_32"} : (i32, i32) -> i32
            %18 = tor.load %0[%17] on (0 to 0) {dump = "op_33"} : !tor.memref<288xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (0 to 0) {dump = "op_34"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c18_i32_24 on (0 to 0) {dump = "op_36"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (0 to 0) {dump = "op_37"} : (i32, i32) -> i32
            tor.store %19 to %0[%21] on (0 to 0) {dump = "op_38"} : (i32, !tor.memref<288xi32, [], "rw">[i32])
          } {dump = "op_40"}
        } {dump = "op_42"}
      } {dump = "op_44"}
      tor.for %arg0 = (%c0_i32_23 : i32) to (%c17_i32_20 : i32) step (%c1_i32_21 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_19 : i32) to (%c21_i32_16 : i32) step (%c1_i32_17 : i32)
        on (0 to 0){
          %7 = tor.muli %arg0 %c22_i32_15 on (0 to 0) {dump = "op_52"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (0 to 0) {dump = "op_53"} : (i32, i32) -> i32
          tor.store %c0_i32_39 to %3[%8] on (0 to 0) {dump = "op_54"} : (i32, !tor.memref<396xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32_14 : i32) to (%c23_i32 : i32) step (%c1_i32_12 : i32)
          on (0 to 0){
            %9 = tor.muli %arg0 %c24_i32 on (0 to 0) {dump = "op_59"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (0 to 0) {dump = "op_60"} : (i32, i32) -> i32
            %11 = tor.load %4[%10] on (0 to 0) {dump = "op_61"} : !tor.memref<432xi32, [], "r">[i32]
            %12 = tor.muli %arg2 %c22_i32_11 on (0 to 0) {dump = "op_63"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (0 to 0) {dump = "op_64"} : (i32, i32) -> i32
            %14 = tor.load %5[%13] on (0 to 0) {dump = "op_65"} : !tor.memref<528xi32, [], "r">[i32]
            %15 = tor.muli %11 %14 on (0 to 0) {dump = "op_66"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c22_i32_10 on (0 to 0) {dump = "op_68"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (0 to 0) {dump = "op_69"} : (i32, i32) -> i32
            %18 = tor.load %3[%17] on (0 to 0) {dump = "op_70"} : !tor.memref<396xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (0 to 0) {dump = "op_71"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c22_i32_9 on (0 to 0) {dump = "op_73"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (0 to 0) {dump = "op_74"} : (i32, i32) -> i32
            tor.store %19 to %3[%21] on (0 to 0) {dump = "op_75"} : (i32, !tor.memref<396xi32, [], "rw">[i32])
          } {dump = "op_77"}
        } {dump = "op_79"}
      } {dump = "op_81"}
      tor.for %arg0 = (%c0_i32_8 : i32) to (%c15_i32 : i32) step (%c1_i32_7 : i32)
      on (0 to 0){
        tor.for %arg1 = (%c0_i32_6 : i32) to (%c21_i32 : i32) step (%c1_i32_4 : i32)
        on (0 to 0){
          %7 = tor.muli %arg0 %c22_i32_3 on (0 to 0) {dump = "op_89"} : (i32, i32) -> i32
          %8 = tor.addi %arg1 %7 on (0 to 0) {dump = "op_90"} : (i32, i32) -> i32
          tor.store %c0_i32_39 to %6[%8] on (0 to 0) {dump = "op_91"} : (i32, !tor.memref<352xi32, [], "rw">[i32])
          tor.for %arg2 = (%c0_i32 : i32) to (%c17_i32 : i32) step (%c1_i32 : i32)
          on (0 to 0){
            %9 = tor.muli %arg0 %c18_i32 on (0 to 0) {dump = "op_96"} : (i32, i32) -> i32
            %10 = tor.addi %arg2 %9 on (0 to 0) {dump = "op_97"} : (i32, i32) -> i32
            %11 = tor.load %0[%10] on (0 to 0) {dump = "op_98"} : !tor.memref<288xi32, [], "rw">[i32]
            %12 = tor.muli %arg2 %c22_i32_1 on (0 to 0) {dump = "op_100"} : (i32, i32) -> i32
            %13 = tor.addi %arg1 %12 on (0 to 0) {dump = "op_101"} : (i32, i32) -> i32
            %14 = tor.load %3[%13] on (0 to 0) {dump = "op_102"} : !tor.memref<396xi32, [], "rw">[i32]
            %15 = tor.muli %11 %14 on (0 to 0) {dump = "op_103"} : (i32, i32) -> i32
            %16 = tor.muli %arg0 %c22_i32_0 on (0 to 0) {dump = "op_105"} : (i32, i32) -> i32
            %17 = tor.addi %arg1 %16 on (0 to 0) {dump = "op_106"} : (i32, i32) -> i32
            %18 = tor.load %6[%17] on (0 to 0) {dump = "op_107"} : !tor.memref<352xi32, [], "rw">[i32]
            %19 = tor.addi %18 %15 on (0 to 0) {dump = "op_108"} : (i32, i32) -> i32
            %20 = tor.muli %arg0 %c22_i32 on (0 to 0) {dump = "op_110"} : (i32, i32) -> i32
            %21 = tor.addi %arg1 %20 on (0 to 0) {dump = "op_111"} : (i32, i32) -> i32
            tor.store %19 to %6[%21] on (0 to 0) {dump = "op_112"} : (i32, !tor.memref<352xi32, [], "rw">[i32])
          } {dump = "op_114"}
        } {dump = "op_116"}
      } {dump = "op_118"}
      tor.return {dump = "op_119"}
    }
  } {dump = "op_121", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

