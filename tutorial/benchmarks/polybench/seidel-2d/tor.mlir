module {
  tor.design @kernel_seidel_2d {
    %c40_i32 = arith.constant {dump = "op_80"} 40 : i32
    %c40_i32_0 = arith.constant {dump = "op_74"} 40 : i32
    %c1_i32 = arith.constant {dump = "op_72"} 1 : i32
    %c1_i32_1 = arith.constant {dump = "op_70"} 1 : i32
    %c40_i32_2 = arith.constant {dump = "op_65"} 40 : i32
    %c1_i32_3 = arith.constant {dump = "op_63"} 1 : i32
    %c40_i32_4 = arith.constant {dump = "op_58"} 40 : i32
    %c-1_i32 = arith.constant {dump = "op_56"} -1 : i32
    %c1_i32_5 = arith.constant {dump = "op_54"} 1 : i32
    %c40_i32_6 = arith.constant {dump = "op_49"} 40 : i32
    %c1_i32_7 = arith.constant {dump = "op_47"} 1 : i32
    %c40_i32_8 = arith.constant {dump = "op_42"} 40 : i32
    %c40_i32_9 = arith.constant {dump = "op_37"} 40 : i32
    %c-1_i32_10 = arith.constant {dump = "op_35"} -1 : i32
    %c40_i32_11 = arith.constant {dump = "op_30"} 40 : i32
    %c1_i32_12 = arith.constant {dump = "op_28"} 1 : i32
    %c-1_i32_13 = arith.constant {dump = "op_26"} -1 : i32
    %c40_i32_14 = arith.constant {dump = "op_21"} 40 : i32
    %c-1_i32_15 = arith.constant {dump = "op_19"} -1 : i32
    %c40_i32_16 = arith.constant {dump = "op_15"} 40 : i32
    %c-1_i32_17 = arith.constant {dump = "op_13"} -1 : i32
    %c-1_i32_18 = arith.constant {dump = "op_11"} -1 : i32
    %c38_i32 = arith.constant {dump = "new_constant_0"} 38 : i32
    %c1_i32_19 = arith.constant {dump = "op_10"} 1 : i32
    %c39_i32 = arith.constant {dump = "op_9"} 39 : i32
    %c1_i32_20 = arith.constant {dump = "op_8"} 1 : i32
    %c38_i32_21 = arith.constant {dump = "new_constant_1"} 38 : i32
    %c1_i32_22 = arith.constant {dump = "op_7"} 1 : i32
    %c39_i32_23 = arith.constant {dump = "op_6"} 39 : i32
    %c1_i32_24 = arith.constant {dump = "op_5"} 1 : i32
    %c19_i32 = arith.constant {dump = "new_constant_2"} 19 : i32
    %c1_i32_25 = arith.constant {dump = "op_4"} 1 : i32
    %c20_i32 = arith.constant {dump = "op_3"} 20 : i32
    %c0_i32 = arith.constant {dump = "op_2"} 0 : i32
    %c9_i32 = arith.constant {dump = "op_1"} 9 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<1600xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_91", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 24){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static"}]
        tor.succ 4 : [3 : i32] [{type = "static:1"}]
        tor.succ 5 : [4 : i32] [{type = "static:2"}]
        tor.succ 6 : [5 : i32] [{type = "static:1"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:1"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static:1"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:1"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [15 : i32] [{type = "static:1"}]
        tor.succ 17 : [16 : i32] [{type = "static:2"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [2 : i32] [{type = "static-for"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [1 : i32] [{type = "static-for"}]
        tor.succ 22 : [21 : i32] [{type = "static"}]
        tor.succ 23 : [0 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32 : i32) to (%c19_i32 : i32) step (%c1_i32_25 : i32)
      on (0 to 22){
        tor.for %arg1 = (%c1_i32_24 : i32) to (%c38_i32_21 : i32) step (%c1_i32_22 : i32)
        on (1 to 20){
          tor.for %arg2 = (%c1_i32_20 : i32) to (%c38_i32 : i32) step (%c1_i32_19 : i32)
          on (2 to 18){
            %1 = tor.addi %arg1 %c-1_i32_18 on (3 to 4) {dump = "op_12"} : (i32, i32) -> i32
            %2 = tor.addi %arg2 %c-1_i32_17 on (3 to 4) {dump = "op_14"} : (i32, i32) -> i32
            %3 = tor.muli %1 %c40_i32_16 on (3 to 5) {dump = "op_16"} : (i32, i32) -> i32
            %4 = tor.addi %2 %3 on (5 to 6) {dump = "op_17"} : (i32, i32) -> i32
            %5 = tor.load %0[%4] on (13 to 14) {dump = "op_18"} : !tor.memref<1600xi32, [], "rw">[i32]
            %6 = tor.addi %arg1 %c-1_i32_15 on (3 to 4) {dump = "op_20"} : (i32, i32) -> i32
            %7 = tor.muli %6 %c40_i32_14 on (3 to 5) {dump = "op_22"} : (i32, i32) -> i32
            %8 = tor.addi %arg2 %7 on (5 to 6) {dump = "op_23"} : (i32, i32) -> i32
            %9 = tor.load %0[%8] on (12 to 13) {dump = "op_24"} : !tor.memref<1600xi32, [], "rw">[i32]
            %10 = tor.addi %5 %9 on (14 to 15) {dump = "op_25"} : (i32, i32) -> i32
            %11 = tor.addi %arg1 %c-1_i32_13 on (3 to 4) {dump = "op_27"} : (i32, i32) -> i32
            %12 = tor.addi %arg2 %c1_i32_12 on (3 to 4) {dump = "op_29"} : (i32, i32) -> i32
            %13 = tor.muli %11 %c40_i32_11 on (3 to 5) {dump = "op_31"} : (i32, i32) -> i32
            %14 = tor.addi %12 %13 on (5 to 6) {dump = "op_32"} : (i32, i32) -> i32
            %15 = tor.load %0[%14] on (11 to 12) {dump = "op_33"} : !tor.memref<1600xi32, [], "rw">[i32]
            %16 = tor.addi %10 %15 on (14 to 15) {dump = "op_34"} : (i32, i32) -> i32
            %17 = tor.addi %arg2 %c-1_i32_10 on (3 to 4) {dump = "op_36"} : (i32, i32) -> i32
            %18 = tor.muli %arg1 %c40_i32_9 on (3 to 5) {dump = "op_38"} : (i32, i32) -> i32
            %19 = tor.addi %17 %18 on (5 to 6) {dump = "op_39"} : (i32, i32) -> i32
            %20 = tor.load %0[%19] on (7 to 8) {dump = "op_40"} : !tor.memref<1600xi32, [], "rw">[i32]
            %21 = tor.addi %16 %20 on (14 to 15) {dump = "op_41"} : (i32, i32) -> i32
            %22 = tor.muli %arg1 %c40_i32_8 on (3 to 5) {dump = "op_43"} : (i32, i32) -> i32
            %23 = tor.addi %arg2 %22 on (5 to 6) {dump = "op_44"} : (i32, i32) -> i32
            %24 = tor.load %0[%23] on (5 to 6) {dump = "op_45"} : !tor.memref<1600xi32, [], "rw">[i32]
            %25 = tor.addi %21 %24 on (14 to 15) {dump = "op_46"} : (i32, i32) -> i32
            %26 = tor.addi %arg2 %c1_i32_7 on (3 to 4) {dump = "op_48"} : (i32, i32) -> i32
            %27 = tor.muli %arg1 %c40_i32_6 on (3 to 5) {dump = "op_50"} : (i32, i32) -> i32
            %28 = tor.addi %26 %27 on (5 to 6) {dump = "op_51"} : (i32, i32) -> i32
            %29 = tor.load %0[%28] on (6 to 7) {dump = "op_52"} : !tor.memref<1600xi32, [], "rw">[i32]
            %30 = tor.addi %25 %29 on (14 to 15) {dump = "op_53"} : (i32, i32) -> i32
            %31 = tor.addi %arg1 %c1_i32_5 on (3 to 4) {dump = "op_55"} : (i32, i32) -> i32
            %32 = tor.addi %arg2 %c-1_i32 on (3 to 4) {dump = "op_57"} : (i32, i32) -> i32
            %33 = tor.muli %31 %c40_i32_4 on (3 to 5) {dump = "op_59"} : (i32, i32) -> i32
            %34 = tor.addi %32 %33 on (5 to 6) {dump = "op_60"} : (i32, i32) -> i32
            %35 = tor.load %0[%34] on (10 to 11) {dump = "op_61"} : !tor.memref<1600xi32, [], "rw">[i32]
            %36 = tor.addi %30 %35 on (15 to 16) {dump = "op_62"} : (i32, i32) -> i32
            %37 = tor.addi %arg1 %c1_i32_3 on (3 to 4) {dump = "op_64"} : (i32, i32) -> i32
            %38 = tor.muli %37 %c40_i32_2 on (3 to 5) {dump = "op_66"} : (i32, i32) -> i32
            %39 = tor.addi %arg2 %38 on (5 to 6) {dump = "op_67"} : (i32, i32) -> i32
            %40 = tor.load %0[%39] on (9 to 10) {dump = "op_68"} : !tor.memref<1600xi32, [], "rw">[i32]
            %41 = tor.addi %36 %40 on (15 to 16) {dump = "op_69"} : (i32, i32) -> i32
            %42 = tor.addi %arg1 %c1_i32_1 on (3 to 4) {dump = "op_71"} : (i32, i32) -> i32
            %43 = tor.addi %arg2 %c1_i32 on (3 to 4) {dump = "op_73"} : (i32, i32) -> i32
            %44 = tor.muli %42 %c40_i32_0 on (3 to 5) {dump = "op_75"} : (i32, i32) -> i32
            %45 = tor.addi %43 %44 on (5 to 6) {dump = "op_76"} : (i32, i32) -> i32
            %46 = tor.load %0[%45] on (8 to 9) {dump = "op_77"} : !tor.memref<1600xi32, [], "rw">[i32]
            %47 = tor.addi %41 %46 on (15 to 16) {dump = "op_78"} : (i32, i32) -> i32
            %48 = tor.muli %47 %c9_i32 on (15 to 17) {dump = "op_79"} : (i32, i32) -> i32
            %49 = tor.muli %arg1 %c40_i32 on (3 to 5) {dump = "op_81"} : (i32, i32) -> i32
            %50 = tor.addi %arg2 %49 on (5 to 6) {dump = "op_82"} : (i32, i32) -> i32
            tor.store %48 to %0[%50] on (17 to 18) {dump = "op_83"} : (i32, !tor.memref<1600xi32, [], "rw">[i32])
          } {dump = "op_85"}
        } {dump = "op_87"}
      } {dump = "op_89"}
      tor.return {dump = "op_90"}
    }
  } {dump = "op_92", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

