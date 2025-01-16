module {
  tor.design @kernel_gemver {
    %c8_i32 = arith.constant {dump = "op_73"} 8 : i32
    %c255_i32 = arith.constant {dump = "new_constant_0"} 255 : i32
    %c1_i32 = arith.constant {dump = "op_71"} 1 : i32
    %c256_i32 = arith.constant {dump = "op_70"} 256 : i32
    %c0_i32 = arith.constant {dump = "op_69"} 0 : i32
    %c255_i32_0 = arith.constant {dump = "new_constant_1"} 255 : i32
    %c1_i32_1 = arith.constant {dump = "op_68"} 1 : i32
    %c256_i32_2 = arith.constant {dump = "op_67"} 256 : i32
    %c0_i32_3 = arith.constant {dump = "op_66"} 0 : i32
    %c255_i32_4 = arith.constant {dump = "new_constant_2"} 255 : i32
    %c1_i32_5 = arith.constant {dump = "op_59"} 1 : i32
    %c256_i32_6 = arith.constant {dump = "op_58"} 256 : i32
    %c0_i32_7 = arith.constant {dump = "op_57"} 0 : i32
    %c8_i32_8 = arith.constant {dump = "op_44"} 8 : i32
    %c255_i32_9 = arith.constant {dump = "new_constant_3"} 255 : i32
    %c1_i32_10 = arith.constant {dump = "op_42"} 1 : i32
    %c256_i32_11 = arith.constant {dump = "op_41"} 256 : i32
    %c0_i32_12 = arith.constant {dump = "op_40"} 0 : i32
    %c255_i32_13 = arith.constant {dump = "new_constant_4"} 255 : i32
    %c1_i32_14 = arith.constant {dump = "op_39"} 1 : i32
    %c256_i32_15 = arith.constant {dump = "op_38"} 256 : i32
    %c0_i32_16 = arith.constant {dump = "op_37"} 0 : i32
    %c8_i32_17 = arith.constant {dump = "op_29"} 8 : i32
    %c8_i32_18 = arith.constant {dump = "op_17"} 8 : i32
    %c255_i32_19 = arith.constant {dump = "new_constant_5"} 255 : i32
    %c1_i32_20 = arith.constant {dump = "op_16"} 1 : i32
    %c256_i32_21 = arith.constant {dump = "op_15"} 256 : i32
    %c0_i32_22 = arith.constant {dump = "op_14"} 0 : i32
    %c255_i32_23 = arith.constant {dump = "new_constant_6"} 255 : i32
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
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_87", resource = "../resource.json", strategy = "static"} {
      tor.timegraph (0 to 34){
        tor.succ 1 : [0 : i32] [{type = "static"}]
        tor.succ 2 : [1 : i32] [{type = "static"}]
        tor.succ 3 : [2 : i32] [{type = "static:1"}]
        tor.succ 4 : [3 : i32] [{type = "static:3"}]
        tor.succ 5 : [4 : i32] [{type = "static:1"}]
        tor.succ 6 : [1 : i32] [{type = "static-for"}]
        tor.succ 7 : [6 : i32] [{type = "static"}]
        tor.succ 8 : [0 : i32] [{type = "static-for"}]
        tor.succ 9 : [8 : i32] [{type = "static"}]
        tor.succ 10 : [9 : i32] [{type = "static"}]
        tor.succ 11 : [10 : i32] [{type = "static"}]
        tor.succ 12 : [11 : i32] [{type = "static:1"}]
        tor.succ 13 : [12 : i32] [{type = "static:3"}]
        tor.succ 14 : [13 : i32] [{type = "static:3"}]
        tor.succ 15 : [14 : i32] [{type = "static:1"}]
        tor.succ 16 : [10 : i32] [{type = "static-for"}]
        tor.succ 17 : [16 : i32] [{type = "static"}]
        tor.succ 18 : [9 : i32] [{type = "static-for"}]
        tor.succ 19 : [18 : i32] [{type = "static"}]
        tor.succ 20 : [19 : i32] [{type = "static"}]
        tor.succ 21 : [20 : i32] [{type = "static:1"}]
        tor.succ 22 : [21 : i32] [{type = "static:1"}]
        tor.succ 23 : [19 : i32] [{type = "static-for"}]
        tor.succ 24 : [23 : i32] [{type = "static"}]
        tor.succ 25 : [24 : i32] [{type = "static"}]
        tor.succ 26 : [25 : i32] [{type = "static"}]
        tor.succ 27 : [26 : i32] [{type = "static:1"}]
        tor.succ 28 : [27 : i32] [{type = "static:3"}]
        tor.succ 29 : [28 : i32] [{type = "static:3"}]
        tor.succ 30 : [29 : i32] [{type = "static:1"}]
        tor.succ 31 : [25 : i32] [{type = "static-for"}]
        tor.succ 32 : [31 : i32] [{type = "static"}]
        tor.succ 33 : [24 : i32] [{type = "static-for"}]
        tor.succ 34 : [33 : i32] [{type = "static"}]
      }
      tor.for %arg0 = (%c0_i32_26 : i32) to (%c255_i32_23 : i32) step (%c1_i32_24 : i32)
      on (0 to 7){
        tor.for %arg1 = (%c0_i32_22 : i32) to (%c255_i32_19 : i32) step (%c1_i32_20 : i32)
        on (1 to 5){
          %9 = arith.shli %arg0, %c8_i32_18 {dump = "op_18", endtime = 3 : i32, starttime = 2 : i32} : i32
          %10 = tor.addi %arg1 %9 on (2 to 3) {dump = "op_19"} : (i32, i32) -> i32
          %11 = tor.load %0[%10] on (2 to 3) {dump = "op_20"} : !tor.memref<65536xi32, [], "rw">[i32]
          %12 = tor.load %1[%arg0] on (2 to 3) {dump = "op_21"} : !tor.memref<256xi32, [], "r">[i32]
          %13 = tor.load %2[%arg1] on (2 to 3) {dump = "op_22"} : !tor.memref<256xi32, [], "r">[i32]
          %14 = tor.muli %12 %13 on (3 to 4) {dump = "op_23"} : (i32, i32) -> i32
          %15 = tor.addi %11 %14 on (4 to 5) {dump = "op_24"} : (i32, i32) -> i32
          %16 = tor.load %3[%arg0] on (2 to 3) {dump = "op_25"} : !tor.memref<256xi32, [], "r">[i32]
          %17 = tor.load %4[%arg1] on (2 to 3) {dump = "op_26"} : !tor.memref<256xi32, [], "r">[i32]
          %18 = tor.muli %16 %17 on (3 to 4) {dump = "op_27"} : (i32, i32) -> i32
          %19 = tor.addi %15 %18 on (4 to 5) {dump = "op_28"} : (i32, i32) -> i32
          %20 = arith.shli %arg0, %c8_i32_17 {dump = "op_30", endtime = 3 : i32, starttime = 2 : i32} : i32
          %21 = tor.addi %arg1 %20 on (2 to 3) {dump = "op_31"} : (i32, i32) -> i32
          tor.store %19 to %0[%21] on (4 to 5) {dump = "op_32"} : (i32, !tor.memref<65536xi32, [], "rw">[i32])
        } {dump = "op_34"}
      } {dump = "op_36"}
      tor.for %arg0 = (%c0_i32_16 : i32) to (%c255_i32_13 : i32) step (%c1_i32_14 : i32)
      on (9 to 17){
        tor.for %arg1 = (%c0_i32_12 : i32) to (%c255_i32_9 : i32) step (%c1_i32_10 : i32)
        on (10 to 15){
          %9 = tor.load %6[%arg0] on (11 to 12) {dump = "op_43"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg1, %c8_i32_8 {dump = "op_45", endtime = 12 : i32, starttime = 11 : i32} : i32
          %11 = tor.addi %arg0 %10 on (11 to 12) {dump = "op_46"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (11 to 12) {dump = "op_47"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c45_i32 on (12 to 13) {dump = "op_48"} : (i32, i32) -> i32
          %14 = tor.load %7[%arg1] on (11 to 12) {dump = "op_49"} : !tor.memref<256xi32, [], "r">[i32]
          %15 = tor.muli %13 %14 on (13 to 14) {dump = "op_50"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (14 to 15) {dump = "op_51"} : (i32, i32) -> i32
          tor.store %16 to %6[%arg0] on (14 to 15) {dump = "op_52"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_54"}
      } {dump = "op_56"}
      tor.for %arg0 = (%c0_i32_7 : i32) to (%c255_i32_4 : i32) step (%c1_i32_5 : i32)
      on (19 to 22){
        %9 = tor.load %6[%arg0] on (20 to 21) {dump = "op_60"} : !tor.memref<256xi32, [], "rw">[i32]
        %10 = tor.load %8[%arg0] on (20 to 21) {dump = "op_61"} : !tor.memref<256xi32, [], "r">[i32]
        %11 = tor.addi %9 %10 on (21 to 22) {dump = "op_62"} : (i32, i32) -> i32
        tor.store %11 to %6[%arg0] on (21 to 22) {dump = "op_63"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
      } {dump = "op_65"}
      tor.for %arg0 = (%c0_i32_3 : i32) to (%c255_i32_0 : i32) step (%c1_i32_1 : i32)
      on (24 to 32){
        tor.for %arg1 = (%c0_i32 : i32) to (%c255_i32 : i32) step (%c1_i32 : i32)
        on (25 to 30){
          %9 = tor.load %5[%arg0] on (26 to 27) {dump = "op_72"} : !tor.memref<256xi32, [], "rw">[i32]
          %10 = arith.shli %arg0, %c8_i32 {dump = "op_74", endtime = 27 : i32, starttime = 26 : i32} : i32
          %11 = tor.addi %arg1 %10 on (26 to 27) {dump = "op_75"} : (i32, i32) -> i32
          %12 = tor.load %0[%11] on (26 to 27) {dump = "op_76"} : !tor.memref<65536xi32, [], "rw">[i32]
          %13 = tor.muli %12 %c12_i32 on (27 to 28) {dump = "op_77"} : (i32, i32) -> i32
          %14 = tor.load %6[%arg1] on (26 to 27) {dump = "op_78"} : !tor.memref<256xi32, [], "rw">[i32]
          %15 = tor.muli %13 %14 on (28 to 29) {dump = "op_79"} : (i32, i32) -> i32
          %16 = tor.addi %9 %15 on (29 to 30) {dump = "op_80"} : (i32, i32) -> i32
          tor.store %16 to %5[%arg0] on (29 to 30) {dump = "op_81"} : (i32, !tor.memref<256xi32, [], "rw">[i32])
        } {dump = "op_83"}
      } {dump = "op_85"}
      tor.return {dump = "op_86"}
    }
  } {dump = "op_88", "flatten-array" = 1 : i32, "move-while" = 1 : i32}
}

