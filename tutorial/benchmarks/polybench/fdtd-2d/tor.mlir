module {
  tor.design @kernel_fdtd_2d {
    %c30_i32 = arith.constant {dump = "op_117"} 30 : i32
    %c30_i32_0 = arith.constant {dump = "op_110"} 30 : i32
    %c30_i32_1 = arith.constant {dump = "op_105"} 30 : i32
    %c1_i32 = arith.constant {dump = "op_103"} 1 : i32
    %c30_i32_2 = arith.constant {dump = "op_98"} 30 : i32
    %c30_i32_3 = arith.constant {dump = "op_94"} 30 : i32
    %c1_i32_4 = arith.constant {dump = "op_92"} 1 : i32
    %c30_i32_5 = arith.constant {dump = "op_88"} 30 : i32
    %c28_i32 = arith.constant {dump = "new_constant_0"} 28 : i32
    %c1_i32_6 = arith.constant {dump = "op_87"} 1 : i32
    %c29_i32 = arith.constant {dump = "op_86"} 29 : i32
    %c0_i32 = arith.constant {dump = "op_85"} 0 : i32
    %c18_i32 = arith.constant {dump = "new_constant_1"} 18 : i32
    %c1_i32_7 = arith.constant {dump = "op_84"} 1 : i32
    %c19_i32 = arith.constant {dump = "op_83"} 19 : i32
    %c0_i32_8 = arith.constant {dump = "op_82"} 0 : i32
    %c30_i32_9 = arith.constant {dump = "op_74"} 30 : i32
    %c30_i32_10 = arith.constant {dump = "op_67"} 30 : i32
    %c-1_i32 = arith.constant {dump = "op_65"} -1 : i32
    %c30_i32_11 = arith.constant {dump = "op_61"} 30 : i32
    %c30_i32_12 = arith.constant {dump = "op_57"} 30 : i32
    %c29_i32_13 = arith.constant {dump = "new_constant_2"} 29 : i32
    %c1_i32_14 = arith.constant {dump = "op_56"} 1 : i32
    %c30_i32_15 = arith.constant {dump = "op_55"} 30 : i32
    %c1_i32_16 = arith.constant {dump = "op_54"} 1 : i32
    %c19_i32_17 = arith.constant {dump = "new_constant_3"} 19 : i32
    %c1_i32_18 = arith.constant {dump = "op_53"} 1 : i32
    %c20_i32 = arith.constant {dump = "op_52"} 20 : i32
    %c0_i32_19 = arith.constant {dump = "op_51"} 0 : i32
    %c30_i32_20 = arith.constant {dump = "op_43"} 30 : i32
    %c30_i32_21 = arith.constant {dump = "op_36"} 30 : i32
    %c-1_i32_22 = arith.constant {dump = "op_34"} -1 : i32
    %c30_i32_23 = arith.constant {dump = "op_30"} 30 : i32
    %c30_i32_24 = arith.constant {dump = "op_26"} 30 : i32
    %c29_i32_25 = arith.constant {dump = "new_constant_4"} 29 : i32
    %c1_i32_26 = arith.constant {dump = "op_25"} 1 : i32
    %c30_i32_27 = arith.constant {dump = "op_24"} 30 : i32
    %c0_i32_28 = arith.constant {dump = "op_23"} 0 : i32
    %c19_i32_29 = arith.constant {dump = "new_constant_5"} 19 : i32
    %c1_i32_30 = arith.constant {dump = "op_22"} 1 : i32
    %c20_i32_31 = arith.constant {dump = "op_21"} 20 : i32
    %c1_i32_32 = arith.constant {dump = "op_20"} 1 : i32
    %c0_i32_33 = arith.constant {dump = "unknown_0"} 0 : i32
    %c30_i32_34 = arith.constant {dump = "op_14"} 30 : i32
    %c0_i32_35 = arith.constant {dump = "op_13"} 0 : i32
    %c29_i32_36 = arith.constant {dump = "new_constant_6"} 29 : i32
    %c1_i32_37 = arith.constant {dump = "op_11"} 1 : i32
    %c30_i32_38 = arith.constant {dump = "op_10"} 30 : i32
    %c0_i32_39 = arith.constant {dump = "op_9"} 0 : i32
    %c19_i32_40 = arith.constant {dump = "new_constant_7"} 19 : i32
    %c1_i32_41 = arith.constant {dump = "op_8"} 1 : i32
    %c20_i32_42 = arith.constant {dump = "op_7"} 20 : i32
    %c0_i32_43 = arith.constant {dump = "op_6"} 0 : i32
    %c5_i32 = arith.constant {dump = "op_5"} 5 : i32
    %c7_i32 = arith.constant {dump = "op_4"} 7 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<600xi32, [], "rw">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<600xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<600xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<20xi32, [], "r">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_128", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 47){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [1 : i32] [{type = "static-for"}]
        tor.succ 6 : [5 : i32] [{type = "static"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [7 : i32] [{type = "static"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static:2"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:2"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [7 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [6 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [20 : i32] [{type = "static"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static:2"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [24 : i32] [{type = "static:1"}]
        tor.succ 26 : [25 : i32] [{type = "static:1"}]
        tor.succ 27 : [26 : i32] [{type = "static:2"}]
        tor.succ 28 : [27 : i32] [{type = "static:1"}]
        tor.succ 29 : [20 : i32] [{type = "static-for"}]
        tor.succ 30 : [29 : i32] [{type = "static"}]
        tor.succ 31 : [19 : i32] [{type = "static-for"}]
        tor.succ 32 : [31 : i32] [{type = "static"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
        tor.succ 34 : [33 : i32] [{type = "static"}]
        tor.succ 35 : [34 : i32] [{type = "static:1"}]
        tor.succ 36 : [35 : i32] [{type = "static:2"}]
        tor.succ 37 : [36 : i32] [{type = "static:1"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [38 : i32] [{type = "static:1"}]
        tor.succ 40 : [39 : i32] [{type = "static:2"}]
        tor.succ 41 : [40 : i32] [{type = "static:1"}]
        tor.succ 42 : [33 : i32] [{type = "static-for"}]
        tor.succ 43 : [42 : i32] [{type = "static"}]
        tor.succ 44 : [32 : i32] [{type = "static-for"}]
        tor.succ 45 : [44 : i32] [{type = "static"}]
        tor.succ 46 : [0 : i32] [{type = "static-for"}]
        tor.succ 47 : [46 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32_43 : i32) to (%c19_i32_40 : i32) step (%c1_i32_41 : i32)
      on (0 to 45){
        tor.for %arg1 = (%c0_i32_39 : i32) to (%c29_i32_36 : i32) step (%c1_i32_37 : i32)
        on (1 to 4){
          %4 = tor.load %3[%arg0] on (2 to 3) {dump = "op_12"} : !tor.memref<20xi32, [], "r">[i32]
          %5 = tor.addi %arg1 %c0_i32_33 on (2 to 3) {dump = "op_16"} : (i32, i32) -> i32
          tor.store %4 to %1[%5] on (3 to 4) {dump = "op_17"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
        } {dump = "op_19"}
        tor.for %arg1 = (%c1_i32_32 : i32) to (%c19_i32_29 : i32) step (%c1_i32_30 : i32)
        on (6 to 17){
          tor.for %arg2 = (%c0_i32_28 : i32) to (%c29_i32_25 : i32) step (%c1_i32_26 : i32)
          on (7 to 15){
            %4 = tor.muli %arg1 %c30_i32_24 on (8 to 10) {dump = "op_27"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (10 to 11) {dump = "op_28"} : (i32, i32) -> i32
            %6 = tor.load %1[%5] on (10 to 11) {dump = "op_29"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.muli %arg1 %c30_i32_23 on (8 to 10) {dump = "op_31"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (10 to 11) {dump = "op_32"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (10 to 11) {dump = "op_33"} : !tor.memref<600xi32, [], "rw">[i32]
            %10 = tor.addi %arg1 %c-1_i32_22 on (8 to 9) {dump = "op_35"} : (i32, i32) -> i32
            %11 = tor.muli %10 %c30_i32_21 on (8 to 10) {dump = "op_37"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %11 on (10 to 11) {dump = "op_38"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (11 to 12) {dump = "op_39"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %9 %13 on (12 to 13) {dump = "op_40"} : (i32, i32) -> i32
            %15 = tor.muli %14 %c5_i32 on (12 to 14) {dump = "op_41"} : (i32, i32) -> i32
            %16 = tor.subi %6 %15 on (14 to 15) {dump = "op_42"} : (i32, i32) -> i32
            %17 = tor.muli %arg1 %c30_i32_20 on (8 to 10) {dump = "op_44"} : (i32, i32) -> i32
            %18 = tor.addi %arg2 %17 on (10 to 11) {dump = "op_45"} : (i32, i32) -> i32
            tor.store %16 to %1[%18] on (14 to 15) {dump = "op_46"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_48"}
        } {dump = "op_50"}
        tor.for %arg1 = (%c0_i32_19 : i32) to (%c19_i32_17 : i32) step (%c1_i32_18 : i32)
        on (19 to 30){
          tor.for %arg2 = (%c1_i32_16 : i32) to (%c29_i32_13 : i32) step (%c1_i32_14 : i32)
          on (20 to 28){
            %4 = tor.muli %arg1 %c30_i32_12 on (21 to 23) {dump = "op_58"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (23 to 24) {dump = "op_59"} : (i32, i32) -> i32
            %6 = tor.load %0[%5] on (23 to 24) {dump = "op_60"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.muli %arg1 %c30_i32_11 on (21 to 23) {dump = "op_62"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (23 to 24) {dump = "op_63"} : (i32, i32) -> i32
            %9 = tor.load %2[%8] on (23 to 24) {dump = "op_64"} : !tor.memref<600xi32, [], "rw">[i32]
            %10 = tor.addi %arg2 %c-1_i32 on (21 to 22) {dump = "op_66"} : (i32, i32) -> i32
            %11 = tor.muli %arg1 %c30_i32_10 on (21 to 23) {dump = "op_68"} : (i32, i32) -> i32
            %12 = tor.addi %10 %11 on (23 to 24) {dump = "op_69"} : (i32, i32) -> i32
            %13 = tor.load %2[%12] on (24 to 25) {dump = "op_70"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %9 %13 on (25 to 26) {dump = "op_71"} : (i32, i32) -> i32
            %15 = tor.muli %14 %c5_i32 on (25 to 27) {dump = "op_72"} : (i32, i32) -> i32
            %16 = tor.subi %6 %15 on (27 to 28) {dump = "op_73"} : (i32, i32) -> i32
            %17 = tor.muli %arg1 %c30_i32_9 on (21 to 23) {dump = "op_75"} : (i32, i32) -> i32
            %18 = tor.addi %arg2 %17 on (23 to 24) {dump = "op_76"} : (i32, i32) -> i32
            tor.store %16 to %0[%18] on (27 to 28) {dump = "op_77"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_79"}
        } {dump = "op_81"}
        tor.for %arg1 = (%c0_i32_8 : i32) to (%c18_i32 : i32) step (%c1_i32_7 : i32)
        on (32 to 43){
          tor.for %arg2 = (%c0_i32 : i32) to (%c28_i32 : i32) step (%c1_i32_6 : i32)
          on (33 to 41){
            %4 = tor.muli %arg1 %c30_i32_5 on (34 to 36) {dump = "op_89"} : (i32, i32) -> i32
            %5 = tor.addi %arg2 %4 on (36 to 37) {dump = "op_90"} : (i32, i32) -> i32
            %6 = tor.load %2[%5] on (36 to 37) {dump = "op_91"} : !tor.memref<600xi32, [], "rw">[i32]
            %7 = tor.addi %arg2 %c1_i32_4 on (34 to 35) {dump = "op_93"} : (i32, i32) -> i32
            %8 = tor.muli %arg1 %c30_i32_3 on (34 to 36) {dump = "op_95"} : (i32, i32) -> i32
            %9 = tor.addi %7 %8 on (36 to 37) {dump = "op_96"} : (i32, i32) -> i32
            %10 = tor.load %0[%9] on (37 to 38) {dump = "op_97"} : !tor.memref<600xi32, [], "rw">[i32]
            %11 = tor.muli %arg1 %c30_i32_2 on (34 to 36) {dump = "op_99"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %11 on (36 to 37) {dump = "op_100"} : (i32, i32) -> i32
            %13 = tor.load %0[%12] on (36 to 37) {dump = "op_101"} : !tor.memref<600xi32, [], "rw">[i32]
            %14 = tor.subi %10 %13 on (38 to 39) {dump = "op_102"} : (i32, i32) -> i32
            %15 = tor.addi %arg1 %c1_i32 on (34 to 35) {dump = "op_104"} : (i32, i32) -> i32
            %16 = tor.muli %15 %c30_i32_1 on (34 to 36) {dump = "op_106"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %16 on (36 to 37) {dump = "op_107"} : (i32, i32) -> i32
            %18 = tor.load %1[%17] on (37 to 38) {dump = "op_108"} : !tor.memref<600xi32, [], "rw">[i32]
            %19 = tor.addi %14 %18 on (38 to 39) {dump = "op_109"} : (i32, i32) -> i32
            %20 = tor.muli %arg1 %c30_i32_0 on (34 to 36) {dump = "op_111"} : (i32, i32) -> i32
            %21 = tor.addi %arg2 %20 on (36 to 37) {dump = "op_112"} : (i32, i32) -> i32
            %22 = tor.load %1[%21] on (36 to 37) {dump = "op_113"} : !tor.memref<600xi32, [], "rw">[i32]
            %23 = tor.subi %19 %22 on (38 to 39) {dump = "op_114"} : (i32, i32) -> i32
            %24 = tor.muli %23 %c7_i32 on (38 to 40) {dump = "op_115"} : (i32, i32) -> i32
            %25 = tor.subi %6 %24 on (40 to 41) {dump = "op_116"} : (i32, i32) -> i32
            %26 = tor.muli %arg1 %c30_i32 on (34 to 36) {dump = "op_118"} : (i32, i32) -> i32
            %27 = tor.addi %arg2 %26 on (36 to 37) {dump = "op_119"} : (i32, i32) -> i32
            tor.store %25 to %2[%27] on (40 to 41) {dump = "op_120"} : (i32, !tor.memref<600xi32, [], "rw">[i32])
          } {dump = "op_122"}
        } {dump = "op_124"}
      } {dump = "op_126"}
      tor.return {dump = "op_127"}
    }
  } {dump = "op_129", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

