module {
  tor.design @kernel_durbin {
    %c1_i32 = arith.constant {dump = "op_78"} 1 : i32
    %c0_i32 = arith.constant {dump = "op_77"} 0 : i32
    %c-1_i32 = arith.constant {dump = "op_69"} -1 : i32
    %c-1_i32_0 = arith.constant {dump = "op_66"} -1 : i32
    %c1_i32_1 = arith.constant {dump = "op_64"} 1 : i32
    %c0_i32_2 = arith.constant {dump = "op_63"} 0 : i32
    %c0_i32_3 = arith.constant {dump = "op_61"} 0 : i32
    %c0_i32_4 = arith.constant {dump = "op_57"} 0 : i32
    %c0_i32_5 = arith.constant {dump = "op_52"} 0 : i32
    %c0_i32_6 = arith.constant {dump = "op_49"} 0 : i32
    %c-1_i32_7 = arith.constant {dump = "op_44"} -1 : i32
    %c-1_i32_8 = arith.constant {dump = "op_41"} -1 : i32
    %c1_i32_9 = arith.constant {dump = "op_40"} 1 : i32
    %c0_i32_10 = arith.constant {dump = "op_39"} 0 : i32
    %c0_i32_11 = arith.constant {dump = "op_37"} 0 : i32
    %c0_i32_12 = arith.constant {dump = "op_35"} 0 : i32
    %c0_i32_13 = arith.constant {dump = "op_32"} 0 : i32
    %c0_i32_14 = arith.constant {dump = "op_28"} 0 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32_15 = arith.constant {dump = "op_27"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_26"} 256 : i32
    %c1_i32_16 = arith.constant {dump = "op_25"} 1 : i32
    %c0_i32_17 = arith.constant {dump = "op_23"} 0 : i32
    %c0_i32_18 = arith.constant {dump = "op_21"} 0 : i32
    %c0_i32_19 = arith.constant {dump = "op_19"} 0 : i32
    %c0_i32_20 = arith.constant {dump = "op_17"} 0 : i32
    %c0_i32_21 = arith.constant {dump = "op_15"} 0 : i32
    %c0_i32_22 = arith.constant {dump = "op_13"} 0 : i32
    %c0_i32_23 = arith.constant {dump = "op_11"} 0 : i32
    %c0_i32_24 = arith.constant {dump = "op_9"} 0 : i32
    %c0_i32_25 = arith.constant {dump = "op_8"} 0 : i32
    %c1_i32_26 = arith.constant {dump = "op_7"} 1 : i32
    %c0_i32_27 = arith.constant {dump = "op_6"} 0 : i32
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<256xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<256xi32, [], "rw">
    %2 = tor.alloc {dump = "op_2", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %3 = tor.alloc {dump = "op_3", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %4 = tor.alloc {dump = "op_4", local_type = "local"} : !tor.memref<1xi32, [], "rw">
    %5 = tor.alloc {dump = "op_5", local_type = "local"} : !tor.memref<256xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_87", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 40){
        tor.succ 1 : [0 : i32] [{type = "static:1"}]
        tor.succ 2 : [1 : i32] [{type = "static:1"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [5 : i32] [{type = "static:3"}]
        tor.succ 7 : [6 : i32] [{type = "static:1"}]
        tor.succ 8 : [7 : i32] [{type = "static:2"}]
        tor.succ 9 : [8 : i32] [{type = "static:1"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static:1"}]
        tor.succ 12 : [11 : i32] [{type = "static:2"}]
        tor.succ 13 : [12 : i32] [{type = "static:1"}]
        tor.succ 14 : [13 : i32] [{type = "static:3"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [9 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [17 : i32] [{type = "static:1"}]
        tor.succ 19 : [18 : i32] [{type = "static:1"}]
        tor.succ 20 : [19 : i32] [{type = "static:5"}]
        tor.succ 21 : [20 : i32] [{type = "static:3"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [22 : i32] [{type = "static"}]
        tor.succ 24 : [23 : i32] [{type = "static:1"}]
        tor.succ 25 : [24 : i32] [{type = "static:2"}]
        tor.succ 26 : [25 : i32] [{type = "static:1"}]
        tor.succ 27 : [26 : i32] [{type = "static:6"}]
        tor.succ 28 : [27 : i32] [{type = "static:3"}]
        tor.succ 29 : [28 : i32] [{type = "static:1"}]
        tor.succ 30 : [22 : i32] [{type = "static-for"}]
        tor.succ 31 : [30 : i32] [{type = "static"}]
        tor.succ 32 : [31 : i32] [{type = "static:1"}]
        tor.succ 33 : [32 : i32] [{type = "static"}]
        tor.succ 34 : [33 : i32] [{type = "static:1"}]
        tor.succ 35 : [34 : i32] [{type = "static:1"}]
        tor.succ 36 : [32 : i32] [{type = "static-for"}]
        tor.succ 37 : [36 : i32] [{type = "static"}]
        tor.succ 38 : [37 : i32] [{type = "static:1"}]
        tor.succ 39 : [3 : i32] [{type = "static-for"}]
        tor.succ 40 : [39 : i32] [{type = "static"}]
      }
      tor.store %c0_i32_25 to %2[%c0_i32_24] on (0 to 1) {dump = "op_10"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.store %c0_i32_25 to %3[%c0_i32_23] on (0 to 1) {dump = "op_12"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.store %c0_i32_25 to %4[%c0_i32_22] on (0 to 1) {dump = "op_14"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      %6 = tor.load %0[%c0_i32_21] on (1 to 2) {dump = "op_16"} : !tor.memref<256xi32, [], "r">[i32]
      tor.store %6 to %1[%c0_i32_20] on (2 to 3) {dump = "op_18"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      tor.store %c1_i32_26 to %3[%c0_i32_19] on (1 to 2) {dump = "op_20"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      %7 = tor.load %0[%c0_i32_18] on (0 to 1) {dump = "op_22"} : !tor.memref<256xi32, [], "r">[i32]
      tor.store %7 to %4[%c0_i32_17] on (1 to 2) {dump = "op_24"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
      tor.for %arg0 = (%c1_i32_16 : i32) to (%c255_i32 : i32) step (%c1_i32_15 : i32)
      on (3 to 38){
        %8 = tor.load %4[%c0_i32_14] on (4 to 5) {dump = "op_29"} : !tor.memref<1xi32, [], "rw">[i32]
        %9 = tor.muli %8 %8 on (5 to 6) {dump = "op_30"} : (i32, i32) -> i32
        %10 = tor.subi %c1_i32_26 %9 on (6 to 7) {dump = "op_31"} : (i32, i32) -> i32
        %11 = tor.load %3[%c0_i32_13] on (4 to 5) {dump = "op_33"} : !tor.memref<1xi32, [], "rw">[i32]
        %12 = tor.muli %10 %11 on (6 to 8) {dump = "op_34"} : (i32, i32) -> i32
        tor.store %12 to %3[%c0_i32_12] on (8 to 9) {dump = "op_36"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        tor.store %c0_i32_27 to %2[%c0_i32_11] on (4 to 5) {dump = "op_38"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        %13 = tor.subi %arg0 %c1_i32_9 on (4 to 5) {dump = "control_1"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32_10 : i32) to (%13 : i32) step (%c1_i32_9 : i32)
        on (9 to 15){
          %20 = tor.muli %arg1 %c-1_i32_8 on (10 to 12) {dump = "op_42"} : (i32, i32) -> i32
          %21 = tor.addi %arg0 %20 on (12 to 13) {dump = "op_43"} : (i32, i32) -> i32
          %22 = tor.addi %21 %c-1_i32_7 on (12 to 13) {dump = "op_45"} : (i32, i32) -> i32
          %23 = tor.load %0[%22] on (12 to 13) {dump = "op_46"} : !tor.memref<256xi32, [], "r">[i32]
          %24 = tor.load %1[%arg1] on (10 to 11) {dump = "op_47"} : !tor.memref<256xi32, [], "rw">[i32]
          %25 = tor.muli %23 %24 on (13 to 14) {dump = "op_48"} : (i32, i32) -> i32
          %26 = tor.load %2[%c0_i32_6] on (10 to 11) {dump = "op_50"} : !tor.memref<1xi32, [], "rw">[i32]
          %27 = tor.addi %26 %25 on (14 to 15) {dump = "op_51"} : (i32, i32) -> i32
          tor.store %27 to %2[%c0_i32_5] on (14 to 15) {dump = "op_53"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        } {dump = "op_55"}
        %14 = tor.load %0[%arg0] on (17 to 18) {dump = "op_56"} : !tor.memref<256xi32, [], "r">[i32]
        %15 = tor.load %2[%c0_i32_4] on (17 to 18) {dump = "op_58"} : !tor.memref<1xi32, [], "rw">[i32]
        %16 = tor.addi %14 %15 on (18 to 19) {dump = "op_59"} : (i32, i32) -> i32
        %17 = tor.muli %16 %12 on (20 to 21) {dump = "op_60"} : (i32, i32) -> i32
        tor.store %17 to %4[%c0_i32_3] on (21 to 22) {dump = "op_62"} : (i32, !tor.memref<1xi32, [], "rw">[i32])
        %18 = tor.subi %arg0 %c1_i32_1 on (17 to 18) {dump = "control_2"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32_2 : i32) to (%18 : i32) step (%c1_i32_1 : i32)
        on (22 to 29){
          %20 = tor.load %1[%arg1] on (23 to 24) {dump = "op_65"} : !tor.memref<256xi32, [], "rw">[i32]
          %21 = tor.muli %arg1 %c-1_i32_0 on (23 to 25) {dump = "op_67"} : (i32, i32) -> i32
          %22 = tor.addi %arg0 %21 on (25 to 26) {dump = "op_68"} : (i32, i32) -> i32
          %23 = tor.addi %22 %c-1_i32 on (25 to 26) {dump = "op_70"} : (i32, i32) -> i32
          %24 = tor.load %1[%23] on (25 to 26) {dump = "op_71"} : !tor.memref<256xi32, [], "rw">[i32]
          %25 = tor.muli %17 %24 on (27 to 28) {dump = "op_72"} : (i32, i32) -> i32
          %26 = tor.addi %20 %25 on (28 to 29) {dump = "op_73"} : (i32, i32) -> i32
          tor.store %26 to %5[%arg1] on (28 to 29) {dump = "op_74"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_76"}
        %19 = tor.subi %arg0 %c1_i32 on (31 to 32) {dump = "control_3"} : (i32, i32) -> i32
        tor.for %arg1 = (%c0_i32 : i32) to (%19 : i32) step (%c1_i32 : i32)
        on (32 to 35){
          %20 = tor.load %5[%arg1] on (33 to 34) {dump = "op_79"} : !tor.memref<256xi32, [], "rw">[i32]
          tor.store %20 to %1[%arg1] on (34 to 35) {dump = "op_80"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_82"}
        tor.store %17 to %1[%arg0] on (37 to 38) {dump = "op_83"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_85"}
      tor.return {dump = "op_86"}
    }
  } {dump = "op_88", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

