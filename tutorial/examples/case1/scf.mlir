module {
  tor.design @kernel_2mm {
    %0 = tor.alloc {dump = "op_0"} : !tor.memref<64xi32, [], "r">
    %1 = tor.alloc {dump = "op_1"} : !tor.memref<32xi32, [], "r">
    %2 = tor.alloc {dump = "op_2"} : !tor.memref<512xi32, [], "r">
    %3 = tor.alloc {dump = "op_3"} : !tor.memref<1024xi32, [], "rw">
    %4 = tor.alloc {dump = "op_4"} : !tor.memref<512xi32, [], "rw">
    %5 = tor.alloc {dump = "op_5"} : !tor.memref<512xi32, [], "rw">
    %6 = tor.alloc {dump = "op_6"} : !tor.memref<512xi32, [], "rw">
    %7 = tor.alloc {dump = "op_7"} : !tor.memref<512xi32, [], "rw">
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dump = "op_137", resource = "../resource.json"} {
      %c16 = arith.constant {dump = "op_8"} 16 : index
      %c3 = arith.constant {dump = "op_9"} 3 : index
      %c2 = arith.constant {dump = "op_10"} 2 : index
      %c4 = arith.constant {dump = "op_11"} 4 : index
      %c8 = arith.constant {dump = "op_12"} 8 : index
      %c7_i32 = arith.constant {"code-line" = 11 : i32, dump = "op_13"} 7 : i32
      %c6_i32 = arith.constant {"code-line" = 11 : i32, dump = "op_14"} 6 : i32
      %c0 = arith.constant {dump = "op_15"} 0 : index
      %c64 = arith.constant {dump = "op_16"} 64 : index
      %c1 = arith.constant {dump = "op_17"} 1 : index
      scf.for %arg0 = %c0 to %c64 step %c1 {
        scf.for %arg1 = %c0 to %c8 step %c1 {
          %8 = tor.load %0[%arg0] on (0 to 0) {"code-line" = 19 : i32, dump = "op_18"} : !tor.memref<64xi32, [], "r">[index]
          %9 = arith.muli %8, %c6_i32 {"code-line" = 19 : i32, dump = "op_19"} : i32
          %c2_0 = arith.constant {dump = "op_20"} 2 : index
          %10 = arith.shli %arg1, %c2_0 {dump = "op_21"} : index
          %11 = tor.load %1[%10] on (0 to 0) {"code-line" = 19 : i32, dump = "op_22"} : !tor.memref<32xi32, [], "r">[index]
          %12 = arith.muli %9, %11 {"code-line" = 19 : i32, dump = "op_23"} : i32
          %c3_1 = arith.constant {dump = "op_24"} 3 : index
          %13 = arith.shli %arg0, %c3_1 {dump = "op_25"} : index
          %14 = arith.addi %arg1, %13 {dump = "op_26"} : index
          tor.store %12 to %4[%14] on (0 to 0) {"code-line" = 19 : i32, dump = "op_27"} : (i32, !tor.memref<512xi32, [], "rw">[index])
          %15 = arith.muli %8, %c6_i32 {"code-line" = 19 : i32, dump = "op_28"} : i32
          %c2_2 = arith.constant {dump = "op_29"} 2 : index
          %16 = arith.shli %arg1, %c2_2 {dump = "op_30"} : index
          %17 = arith.addi %16, %c1 {dump = "op_31"} : index
          %18 = tor.load %1[%17] on (0 to 0) {"code-line" = 19 : i32, dump = "op_32"} : !tor.memref<32xi32, [], "r">[index]
          %19 = arith.muli %15, %18 {"code-line" = 19 : i32, dump = "op_33"} : i32
          %c3_3 = arith.constant {dump = "op_34"} 3 : index
          %20 = arith.shli %arg0, %c3_3 {dump = "op_35"} : index
          %21 = arith.addi %arg1, %20 {dump = "op_36"} : index
          tor.store %19 to %5[%21] on (0 to 0) {"code-line" = 19 : i32, dump = "op_37"} : (i32, !tor.memref<512xi32, [], "rw">[index])
          %22 = arith.muli %8, %c6_i32 {"code-line" = 19 : i32, dump = "op_38"} : i32
          %c2_4 = arith.constant {dump = "op_39"} 2 : index
          %23 = arith.shli %arg1, %c2_4 {dump = "op_40"} : index
          %24 = arith.addi %23, %c2 {dump = "op_41"} : index
          %25 = tor.load %1[%24] on (0 to 0) {"code-line" = 19 : i32, dump = "op_42"} : !tor.memref<32xi32, [], "r">[index]
          %26 = arith.muli %22, %25 {"code-line" = 19 : i32, dump = "op_43"} : i32
          %c3_5 = arith.constant {dump = "op_44"} 3 : index
          %27 = arith.shli %arg0, %c3_5 {dump = "op_45"} : index
          %28 = arith.addi %arg1, %27 {dump = "op_46"} : index
          tor.store %26 to %6[%28] on (0 to 0) {"code-line" = 19 : i32, dump = "op_47"} : (i32, !tor.memref<512xi32, [], "rw">[index])
          %29 = arith.muli %8, %c6_i32 {"code-line" = 19 : i32, dump = "op_48"} : i32
          %c2_6 = arith.constant {dump = "op_49"} 2 : index
          %30 = arith.shli %arg1, %c2_6 {dump = "op_50"} : index
          %31 = arith.addi %30, %c3 {dump = "op_51"} : index
          %32 = tor.load %1[%31] on (0 to 0) {"code-line" = 19 : i32, dump = "op_52"} : !tor.memref<32xi32, [], "r">[index]
          %33 = arith.muli %29, %32 {"code-line" = 19 : i32, dump = "op_53"} : i32
          %c3_7 = arith.constant {dump = "op_54"} 3 : index
          %34 = arith.shli %arg0, %c3_7 {dump = "op_55"} : index
          %35 = arith.addi %arg1, %34 {dump = "op_56"} : index
          tor.store %33 to %7[%35] on (0 to 0) {"code-line" = 19 : i32, dump = "op_57"} : (i32, !tor.memref<512xi32, [], "rw">[index])
        } {"code-line" = 14 : i32, dump = "op_59", unroll = 4 : i32, "unroll-line" = 15 : i32}
      } {"code-line" = 13 : i32, dump = "op_61"}
      scf.for %arg0 = %c0 to %c64 step %c1 {
        scf.for %arg1 = %c0 to %c16 step %c1 {
          %c4_0 = arith.constant {dump = "op_62"} 4 : index
          %8 = arith.shli %arg0, %c4_0 {dump = "op_63"} : index
          %9 = arith.addi %arg1, %8 {dump = "op_64"} : index
          %10 = tor.load %3[%9] on (0 to 0) {"code-line" = 24 : i32, dump = "op_65"} : !tor.memref<1024xi32, [], "rw">[index]
          %11 = arith.muli %10, %c7_i32 {"code-line" = 24 : i32, dump = "op_66"} : i32
          %c4_1 = arith.constant {dump = "op_67"} 4 : index
          %12 = arith.shli %arg0, %c4_1 {dump = "op_68"} : index
          %13 = arith.addi %arg1, %12 {dump = "op_69"} : index
          tor.store %11 to %3[%13] on (0 to 0) {"code-line" = 24 : i32, dump = "op_70"} : (i32, !tor.memref<1024xi32, [], "rw">[index])
          scf.for %arg2 = %c0 to %c8 step %c1 {
            %c3_2 = arith.constant {dump = "op_71"} 3 : index
            %14 = arith.shli %arg0, %c3_2 {dump = "op_72"} : index
            %15 = arith.addi %arg2, %14 {dump = "op_73"} : index
            %16 = tor.load %4[%15] on (0 to 0) {"code-line" = 27 : i32, dump = "op_74"} : !tor.memref<512xi32, [], "rw">[index]
            %c2_3 = arith.constant {dump = "op_75"} 2 : index
            %17 = arith.shli %arg2, %c2_3 {dump = "op_76"} : index
            %c4_4 = arith.constant {dump = "op_77"} 4 : index
            %18 = arith.shli %17, %c4_4 {dump = "op_78"} : index
            %19 = arith.addi %arg1, %18 {dump = "op_79"} : index
            %20 = tor.load %2[%19] on (0 to 0) {"code-line" = 27 : i32, dump = "op_80"} : !tor.memref<512xi32, [], "r">[index]
            %21 = arith.muli %16, %20 {"code-line" = 27 : i32, dump = "op_81"} : i32
            %c4_5 = arith.constant {dump = "op_82"} 4 : index
            %22 = arith.shli %arg0, %c4_5 {dump = "op_83"} : index
            %23 = arith.addi %arg1, %22 {dump = "op_84"} : index
            %24 = tor.load %3[%23] on (0 to 0) {"code-line" = 27 : i32, dump = "op_85"} : !tor.memref<1024xi32, [], "rw">[index]
            %25 = arith.addi %24, %21 {"code-line" = 27 : i32, dump = "op_86"} : i32
            %c3_6 = arith.constant {dump = "op_87"} 3 : index
            %26 = arith.shli %arg0, %c3_6 {dump = "op_88"} : index
            %27 = arith.addi %arg2, %26 {dump = "op_89"} : index
            %28 = tor.load %5[%27] on (0 to 0) {"code-line" = 27 : i32, dump = "op_90"} : !tor.memref<512xi32, [], "rw">[index]
            %c2_7 = arith.constant {dump = "op_91"} 2 : index
            %29 = arith.shli %arg2, %c2_7 {dump = "op_92"} : index
            %30 = arith.addi %29, %c1 {dump = "op_93"} : index
            %c4_8 = arith.constant {dump = "op_94"} 4 : index
            %31 = arith.shli %30, %c4_8 {dump = "op_95"} : index
            %32 = arith.addi %arg1, %31 {dump = "op_96"} : index
            %33 = tor.load %2[%32] on (0 to 0) {"code-line" = 27 : i32, dump = "op_97"} : !tor.memref<512xi32, [], "r">[index]
            %34 = arith.muli %28, %33 {"code-line" = 27 : i32, dump = "op_98"} : i32
            %35 = arith.addi %25, %34 {"code-line" = 27 : i32, dump = "op_99"} : i32
            %c3_9 = arith.constant {dump = "op_100"} 3 : index
            %36 = arith.shli %arg0, %c3_9 {dump = "op_101"} : index
            %37 = arith.addi %arg2, %36 {dump = "op_102"} : index
            %38 = tor.load %6[%37] on (0 to 0) {"code-line" = 27 : i32, dump = "op_103"} : !tor.memref<512xi32, [], "rw">[index]
            %c2_10 = arith.constant {dump = "op_104"} 2 : index
            %39 = arith.shli %arg2, %c2_10 {dump = "op_105"} : index
            %40 = arith.addi %39, %c2 {dump = "op_106"} : index
            %c4_11 = arith.constant {dump = "op_107"} 4 : index
            %41 = arith.shli %40, %c4_11 {dump = "op_108"} : index
            %42 = arith.addi %arg1, %41 {dump = "op_109"} : index
            %43 = tor.load %2[%42] on (0 to 0) {"code-line" = 27 : i32, dump = "op_110"} : !tor.memref<512xi32, [], "r">[index]
            %44 = arith.muli %38, %43 {"code-line" = 27 : i32, dump = "op_111"} : i32
            %45 = arith.addi %35, %44 {"code-line" = 27 : i32, dump = "op_112"} : i32
            %c2_12 = arith.constant {dump = "op_113"} 2 : index
            %46 = arith.shli %arg0, %c2_12 {dump = "op_114"} : index
            %47 = arith.addi %arg2, %46 {dump = "op_115"} : index
            %48 = tor.load %7[%47] on (0 to 0) {"code-line" = 27 : i32, dump = "op_116"} : !tor.memref<512xi32, [], "rw">[index]
            %c2_13 = arith.constant {dump = "op_117"} 2 : index
            %49 = arith.shli %arg2, %c2_13 {dump = "op_118"} : index
            %50 = arith.addi %49, %c3 {dump = "op_119"} : index
            %c4_14 = arith.constant {dump = "op_120"} 4 : index
            %51 = arith.shli %50, %c4_14 {dump = "op_121"} : index
            %52 = arith.addi %arg1, %51 {dump = "op_122"} : index
            %53 = tor.load %2[%52] on (0 to 0) {"code-line" = 27 : i32, dump = "op_123"} : !tor.memref<512xi32, [], "r">[index]
            %54 = arith.muli %48, %53 {"code-line" = 27 : i32, dump = "op_124"} : i32
            %55 = arith.addi %45, %54 {"code-line" = 27 : i32, dump = "op_125"} : i32
            %c4_15 = arith.constant {dump = "op_126"} 4 : index
            %56 = arith.shli %arg0, %c4_15 {dump = "op_127"} : index
            %57 = arith.addi %arg1, %56 {dump = "op_128"} : index
            tor.store %55 to %3[%57] on (0 to 0) {"code-line" = 27 : i32, dump = "op_129"} : (i32, !tor.memref<1024xi32, [], "rw">[index])
          } {"code-line" = 25 : i32, dump = "op_131", unroll = 4 : i32, "unroll-line" = 26 : i32}
        } {"code-line" = 23 : i32, dump = "op_133"}
      } {"code-line" = 22 : i32, dump = "op_135"}
      tor.return {dump = "op_136"}
    }
  } {dump = "op_138", "flatten-array" = 1 : i32}
}

