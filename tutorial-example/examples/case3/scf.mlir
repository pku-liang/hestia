module {
  tor.design @optical_flow {
    %0 = tor.alloc {dump = "op_0", local_type = "local"} : !tor.memref<6xf32, [], "rw">
    %1 = tor.alloc {dump = "op_1", local_type = "local"} : !tor.memref<6xf32, [], "rw">
    %2 = tor.alloc {dump = "op_2", local_type = "local"} : !tor.memref<18xf32, [], "rw">
    %3 = tor.alloc {dump = "op_3", local_type = "local"} : !tor.memref<6xf32, [], "rw">
    %4 = tor.alloc {dump = "op_4", local_type = "local"} : !tor.memref<6xf32, [], "rw">
    %5 = tor.alloc {dump = "op_5", local_type = "local"} : !tor.memref<6144xf32, [], "rw">
    %6 = tor.alloc {dump = "op_6", local_type = "local"} : !tor.memref<6144xf32, [], "rw">
    %7 = tor.alloc {dump = "op_7", local_type = "local"} : !tor.memref<6144xf32, [], "rw">
    %8 = tor.alloc {dump = "op_8", local_type = "local"} : !tor.memref<21xf32, [], "rw">
    %9 = tor.alloc {dump = "op_9", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %10 = tor.alloc {dump = "op_10", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %11 = tor.alloc {dump = "op_11", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %12 = tor.alloc {dump = "op_12", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %13 = tor.alloc {dump = "op_13", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %14 = tor.alloc {dump = "op_14", local_type = "local"} : !tor.memref<3072xf32, [], "rw">
    %15 = tor.alloc {dump = "op_15", local_type = "local"} : !tor.memref<3072xf32, [], "r">
    %16 = tor.alloc {dump = "op_16", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %17 = tor.alloc {dump = "op_17", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %18 = tor.alloc {dump = "op_18", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %19 = tor.alloc {dump = "op_19", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %20 = tor.alloc {dump = "op_20", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %21 = tor.alloc {dump = "op_21", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %22 = tor.alloc {dump = "op_22", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %23 = tor.alloc {dump = "op_23", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %24 = tor.alloc {dump = "op_24", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %25 = tor.alloc {dump = "op_25", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %26 = tor.alloc {dump = "op_26", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %27 = tor.alloc {dump = "op_27", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %28 = tor.alloc {dump = "op_28", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %29 = tor.alloc {dump = "op_29", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %30 = tor.alloc {dump = "op_30", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %31 = tor.alloc {dump = "op_31", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %32 = tor.alloc {dump = "op_32", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %33 = tor.alloc {dump = "op_33", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %34 = tor.alloc {dump = "op_34", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %35 = tor.alloc {dump = "op_35", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %36 = tor.alloc {dump = "op_36", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %37 = tor.alloc {dump = "op_37", local_type = "local"} : !tor.memref<1xf32, [], "rw">
    %38 = tor.alloc {dump = "op_38", local_type = "local"} : !tor.memref<1024xf32, [], "rw">
    %39 = tor.alloc {dump = "op_39", local_type = "local"} : !tor.memref<1024xf32, [], "rw">
    %40 = tor.alloc {dump = "op_40", local_type = "local"} : !tor.memref<1024xf32, [], "rw">
    %41 = tor.alloc {dump = "op_41", local_type = "local"} : !tor.memref<1024xf32, [], "rw">
    %42 = tor.alloc {dump = "op_42"} : !tor.memref<446464xi64, [], "r">
    %43 = tor.alloc {dump = "op_43"} : !tor.memref<892928xf32, [], "w">
    %44 = tor.stream_create {dump = "op_44"} : <f32>[1024]
    %45 = tor.stream_create {dump = "op_45"} : <f32>[1024]
    %46 = tor.stream_create {dump = "op_46"} : <f32>[1024]
    %47 = tor.stream_create {dump = "op_47"} : <f32>[1024]
    %48 = tor.stream_create {dump = "op_48"} : <f32>[1024]
    %49 = tor.stream_create {dump = "op_49"} : <f32>[1024]
    %50 = tor.stream_create {dump = "op_50"} : <f32>[1024]
    %51 = tor.stream_create {dump = "op_51"} : <f32>[1024]
    %52 = tor.stream_create {dump = "op_52"} : <f32>[1024]
    %53 = tor.stream_create {dump = "op_53"} : <f32>[1024]
    %54 = tor.stream_create {dump = "op_54"} : <f32>[1024]
    %55 = tor.stream_create {dump = "op_55"} : <f32>[1024]
    %56 = tor.stream_create {dump = "op_56"} : <f32>[1024]
    %57 = tor.stream_create {dump = "op_57"} : <f32>[1024]
    %58 = tor.stream_create {dump = "op_58"} : <f32>[1024]
    %59 = tor.stream_create {dump = "op_59"} : <f32>[1024]
    %60 = tor.stream_create {dump = "op_60"} : <f32>[1024]
    %61 = tor.stream_create {dump = "op_61"} : <f32>[1024]
    %62 = tor.stream_create {dump = "op_62"} : <f32>[1024]
    %63 = tor.stream_create {dump = "op_63"} : <f32>[1024]
    %64 = tor.stream_create {dump = "op_64"} : <f32>[1024]
    %65 = tor.stream_create {dump = "op_65"} : <f32>[1024]
    %66 = tor.stream_create {dump = "op_66"} : <f32>[1024]
    %67 = tor.stream_create {dump = "op_67"} : <f32>[1024]
    %68 = tor.stream_create {dump = "op_68"} : <f32>[1024]
    %69 = tor.stream_create {dump = "op_69"} : <f32>[1024]
    %70 = tor.stream_create {dump = "op_70"} : <f32>[1024]
    %71 = tor.stream_create {dump = "op_71"} : <f32>[1024]
    %72 = tor.stream_create {dump = "op_72"} : <f32>[1024]
    %73 = tor.stream_create {dump = "op_73"} : <f32>[1024]
    %74 = tor.stream_create {dump = "op_74"} : <f32>[4096]
    %75 = tor.stream_create {dump = "op_75"} : <f32>[1024]
    %76 = tor.stream_create {dump = "op_76"} : <f32>[1024]
    tor.func @gradient_xy_calc_1(...) attributes {clock = 6.000000e+00 : f32, dump = "op_366", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c-2 = arith.constant {dump = "op_77"} -2 : index
      %c1023 = arith.constant {dump = "op_78"} 1023 : index
      %c435 = arith.constant {dump = "op_79"} 435 : index
      %c1026 = arith.constant {dump = "op_80"} 1026 : index
      %c-4 = arith.constant {dump = "op_81"} -4 : index
      %c1 = arith.constant {dump = "op_82"} 1 : index
      %c438 = arith.constant {dump = "op_83"} 438 : index
      %c0 = arith.constant {dump = "op_84"} 0 : index
      %cst = arith.constant {dump = "op_85"} -1.000000e+00 : f32
      %cst_0 = arith.constant {dump = "op_86"} 8.000000e+00 : f32
      %cst_1 = arith.constant {dump = "op_87"} -8.000000e+00 : f32
      %cst_2 = arith.constant {dump = "op_88"} 1.200000e+01 : f32
      %c2_i32 = arith.constant {"code-line" = 89 : i32, dump = "op_89"} 2 : i32
      %c5_i32 = arith.constant {"code-line" = 80 : i32, dump = "op_90"} 5 : i32
      %cst_3 = arith.constant {dump = "op_91"} 0.000000e+00 : f32
      %false = arith.constant {dump = "op_92"} false
      %c1024_i32 = arith.constant {"code-line" = 13 : i32, dump = "op_93"} 1024 : i32
      %c436_i32 = arith.constant {"code-line" = 12 : i32, dump = "op_94"} 436 : i32
      %c4_i32 = arith.constant {"code-line" = 52 : i32, dump = "op_95"} 4 : i32
      %c0_i32 = arith.constant {dump = "op_96"} 0 : i32
      %77:4 = scf.for %arg0 = %c0 to %c438 step %c1 iter_args(%arg1 = %c0_i32, %arg2 = %c0_i32, %arg3 = %c0_i32, %arg4 = %c0_i32) -> (i32, i32, i32, i32) {
        %78 = arith.index_cast %arg0 {dump = "op_97"} : index to i32
        %79 = arith.addi %arg0, %c-4 {dump = "op_98"} : index
        %80 = arith.cmpi sge, %79, %c0 {dump = "op_99"} : index
        %81 = scf.if %80 -> (i1) {
          %83 = arith.cmpi slt, %78, %c436_i32 {dump = "op_100"} : i32
          scf.yield {dump = "op_101"} %83 : i1
        } else {
          scf.yield {dump = "op_102"} %false : i1
        } {dump = "op_103"}
        %82:4 = scf.for %arg5 = %c0 to %c1026 step %c1 iter_args(%arg6 = %arg1, %arg7 = %arg2, %arg8 = %arg3, %arg9 = %arg4) -> (i32, i32, i32, i32) {
          %83 = arith.index_cast %arg5 {dump = "op_104"} : index to i32
          %84 = tor.load %38[%arg5] on (0 to 0) {dump = "op_105"} : !tor.memref<1024xf32, [], "rw">[index]
          %c0_4 = arith.constant {dump = "op_106"} 0 : index
          tor.store %84 to %33[%c0_4] on (0 to 0) {dump = "op_107"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          %85 = tor.load %39[%arg5] on (0 to 0) {dump = "op_108"} : !tor.memref<1024xf32, [], "rw">[index]
          %c0_5 = arith.constant {dump = "op_109"} 0 : index
          tor.store %85 to %34[%c0_5] on (0 to 0) {dump = "op_110"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          %86 = tor.load %40[%arg5] on (0 to 0) {dump = "op_111"} : !tor.memref<1024xf32, [], "rw">[index]
          %c0_6 = arith.constant {dump = "op_112"} 0 : index
          tor.store %86 to %35[%c0_6] on (0 to 0) {dump = "op_113"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          %87 = tor.load %41[%arg5] on (0 to 0) {dump = "op_114"} : !tor.memref<1024xf32, [], "rw">[index]
          %c0_7 = arith.constant {dump = "op_115"} 0 : index
          tor.store %87 to %36[%c0_7] on (0 to 0) {dump = "op_116"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          %88 = arith.subi %c435, %arg0 {dump = "op_117"} : index
          %89 = arith.cmpi sge, %88, %c0 {dump = "op_118"} : index
          %90 = scf.if %89 -> (i1) {
            %97 = arith.cmpi slt, %83, %c1024_i32 {dump = "op_119"} : i32
            scf.yield {dump = "op_120"} %97 : i1
          } else {
            scf.yield {dump = "op_121"} %false : i1
          } {dump = "op_122"}
          scf.if %90 {
            %97 = tor.stream_read %45 {dump = "op_123"} : <f32> -> f32
            %c0_8 = arith.constant {dump = "op_124"} 0 : index
            tor.store %97 to %37[%c0_8] on (0 to 0) {dump = "op_125"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          } else {
            %97 = arith.subi %c1023, %arg5 {dump = "op_127"} : index
            %98 = arith.cmpi sge, %97, %c0 {dump = "op_128"} : index
            scf.if %98 {
              %c0_8 = arith.constant {dump = "op_129"} 0 : index
              tor.store %cst_3 to %37[%c0_8] on (0 to 0) {dump = "op_130"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            } {dump = "op_132"}
          } {dump = "op_134"}
          %91 = arith.select %90, %c4_i32, %arg9 {dump = "op_135"} : i32
          %92 = scf.if %90 -> (i32) {
            %c0_8 = arith.constant {dump = "op_136"} 0 : index
            %97 = tor.load %34[%c0_8] on (0 to 0) {dump = "op_137"} : !tor.memref<1xf32, [], "rw">[index]
            tor.store %97 to %38[%arg5] on (0 to 0) {dump = "op_138"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
            %c0_9 = arith.constant {dump = "op_139"} 0 : index
            %98 = tor.load %35[%c0_9] on (0 to 0) {dump = "op_140"} : !tor.memref<1xf32, [], "rw">[index]
            tor.store %98 to %39[%arg5] on (0 to 0) {dump = "op_141"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
            %c0_10 = arith.constant {dump = "op_142"} 0 : index
            %99 = tor.load %36[%c0_10] on (0 to 0) {dump = "op_143"} : !tor.memref<1xf32, [], "rw">[index]
            tor.store %99 to %40[%arg5] on (0 to 0) {dump = "op_144"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
            %c0_11 = arith.constant {dump = "op_145"} 0 : index
            %100 = tor.load %37[%c0_11] on (0 to 0) {dump = "op_146"} : !tor.memref<1xf32, [], "rw">[index]
            tor.store %100 to %41[%arg5] on (0 to 0) {dump = "op_147"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
            scf.yield {dump = "op_148"} %arg8 : i32
          } else {
            %97 = arith.cmpi slt, %83, %c1024_i32 {dump = "op_149"} : i32
            %98 = arith.select %97, %c4_i32, %arg8 {dump = "op_150"} : i32
            %99 = arith.subi %c1023, %arg5 {dump = "op_151"} : index
            %100 = arith.cmpi sge, %99, %c0 {dump = "op_152"} : index
            scf.if %100 {
              %c0_8 = arith.constant {dump = "op_153"} 0 : index
              %101 = tor.load %34[%c0_8] on (0 to 0) {dump = "op_154"} : !tor.memref<1xf32, [], "rw">[index]
              tor.store %101 to %38[%arg5] on (0 to 0) {dump = "op_155"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
              %c0_9 = arith.constant {dump = "op_156"} 0 : index
              %102 = tor.load %35[%c0_9] on (0 to 0) {dump = "op_157"} : !tor.memref<1xf32, [], "rw">[index]
              tor.store %102 to %39[%arg5] on (0 to 0) {dump = "op_158"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
              %c0_10 = arith.constant {dump = "op_159"} 0 : index
              %103 = tor.load %36[%c0_10] on (0 to 0) {dump = "op_160"} : !tor.memref<1xf32, [], "rw">[index]
              tor.store %103 to %40[%arg5] on (0 to 0) {dump = "op_161"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
              %c0_11 = arith.constant {dump = "op_162"} 0 : index
              %104 = tor.load %37[%c0_11] on (0 to 0) {dump = "op_163"} : !tor.memref<1xf32, [], "rw">[index]
              tor.store %104 to %41[%arg5] on (0 to 0) {dump = "op_164"} : (f32, !tor.memref<1024xf32, [], "rw">[index])
            } {dump = "op_166"}
            scf.yield {dump = "op_167"} %98 : i32
          } {dump = "op_168"}
          %93 = arith.select %90, %c5_i32, %arg7 {dump = "op_169"} : i32
          scf.if %90 {
            %c0_8 = arith.constant {dump = "op_170"} 0 : index
            %97 = tor.load %17[%c0_8] on (0 to 0) {dump = "op_171"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_9 = arith.constant {dump = "op_172"} 0 : index
            tor.store %97 to %16[%c0_9] on (0 to 0) {dump = "op_173"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_10 = arith.constant {dump = "op_174"} 0 : index
            %98 = tor.load %18[%c0_10] on (0 to 0) {dump = "op_175"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_11 = arith.constant {dump = "op_176"} 0 : index
            tor.store %98 to %17[%c0_11] on (0 to 0) {dump = "op_177"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_12 = arith.constant {dump = "op_178"} 0 : index
            %99 = tor.load %20[%c0_12] on (0 to 0) {dump = "op_179"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_13 = arith.constant {dump = "op_180"} 0 : index
            tor.store %99 to %19[%c0_13] on (0 to 0) {dump = "op_181"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_14 = arith.constant {dump = "op_182"} 0 : index
            %100 = tor.load %21[%c0_14] on (0 to 0) {dump = "op_183"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_15 = arith.constant {dump = "op_184"} 0 : index
            tor.store %100 to %20[%c0_15] on (0 to 0) {dump = "op_185"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_16 = arith.constant {dump = "op_186"} 0 : index
            %101 = tor.load %23[%c0_16] on (0 to 0) {dump = "op_187"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_17 = arith.constant {dump = "op_188"} 0 : index
            tor.store %101 to %22[%c0_17] on (0 to 0) {dump = "op_189"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_18 = arith.constant {dump = "op_190"} 0 : index
            %102 = tor.load %24[%c0_18] on (0 to 0) {dump = "op_191"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_19 = arith.constant {dump = "op_192"} 0 : index
            tor.store %102 to %23[%c0_19] on (0 to 0) {dump = "op_193"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_20 = arith.constant {dump = "op_194"} 0 : index
            %103 = tor.load %25[%c0_20] on (0 to 0) {dump = "op_195"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_21 = arith.constant {dump = "op_196"} 0 : index
            tor.store %103 to %24[%c0_21] on (0 to 0) {dump = "op_197"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_22 = arith.constant {dump = "op_198"} 0 : index
            %104 = tor.load %26[%c0_22] on (0 to 0) {dump = "op_199"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_23 = arith.constant {dump = "op_200"} 0 : index
            tor.store %104 to %25[%c0_23] on (0 to 0) {dump = "op_201"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_24 = arith.constant {dump = "op_202"} 0 : index
            %105 = tor.load %28[%c0_24] on (0 to 0) {dump = "op_203"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_25 = arith.constant {dump = "op_204"} 0 : index
            tor.store %105 to %27[%c0_25] on (0 to 0) {dump = "op_205"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_26 = arith.constant {dump = "op_206"} 0 : index
            %106 = tor.load %29[%c0_26] on (0 to 0) {dump = "op_207"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_27 = arith.constant {dump = "op_208"} 0 : index
            tor.store %106 to %28[%c0_27] on (0 to 0) {dump = "op_209"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_28 = arith.constant {dump = "op_210"} 0 : index
            %107 = tor.load %31[%c0_28] on (0 to 0) {dump = "op_211"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_29 = arith.constant {dump = "op_212"} 0 : index
            tor.store %107 to %30[%c0_29] on (0 to 0) {dump = "op_213"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_30 = arith.constant {dump = "op_214"} 0 : index
            %108 = tor.load %32[%c0_30] on (0 to 0) {dump = "op_215"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_31 = arith.constant {dump = "op_216"} 0 : index
            tor.store %108 to %31[%c0_31] on (0 to 0) {dump = "op_217"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_32 = arith.constant {dump = "op_218"} 0 : index
            %109 = tor.load %33[%c0_32] on (0 to 0) {dump = "op_219"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_33 = arith.constant {dump = "op_220"} 0 : index
            tor.store %109 to %18[%c0_33] on (0 to 0) {dump = "op_221"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_34 = arith.constant {dump = "op_222"} 0 : index
            %110 = tor.load %34[%c0_34] on (0 to 0) {dump = "op_223"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_35 = arith.constant {dump = "op_224"} 0 : index
            tor.store %110 to %21[%c0_35] on (0 to 0) {dump = "op_225"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_36 = arith.constant {dump = "op_226"} 0 : index
            %111 = tor.load %35[%c0_36] on (0 to 0) {dump = "op_227"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_37 = arith.constant {dump = "op_228"} 0 : index
            tor.store %111 to %26[%c0_37] on (0 to 0) {dump = "op_229"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_38 = arith.constant {dump = "op_230"} 0 : index
            %112 = tor.load %36[%c0_38] on (0 to 0) {dump = "op_231"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_39 = arith.constant {dump = "op_232"} 0 : index
            tor.store %112 to %29[%c0_39] on (0 to 0) {dump = "op_233"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_40 = arith.constant {dump = "op_234"} 0 : index
            %113 = tor.load %37[%c0_40] on (0 to 0) {dump = "op_235"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_41 = arith.constant {dump = "op_236"} 0 : index
            tor.store %113 to %32[%c0_41] on (0 to 0) {dump = "op_237"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          } else {
            %c0_8 = arith.constant {dump = "op_239"} 0 : index
            %97 = tor.load %17[%c0_8] on (0 to 0) {dump = "op_240"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_9 = arith.constant {dump = "op_241"} 0 : index
            tor.store %97 to %16[%c0_9] on (0 to 0) {dump = "op_242"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_10 = arith.constant {dump = "op_243"} 0 : index
            %98 = tor.load %18[%c0_10] on (0 to 0) {dump = "op_244"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_11 = arith.constant {dump = "op_245"} 0 : index
            tor.store %98 to %17[%c0_11] on (0 to 0) {dump = "op_246"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_12 = arith.constant {dump = "op_247"} 0 : index
            %99 = tor.load %20[%c0_12] on (0 to 0) {dump = "op_248"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_13 = arith.constant {dump = "op_249"} 0 : index
            tor.store %99 to %19[%c0_13] on (0 to 0) {dump = "op_250"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_14 = arith.constant {dump = "op_251"} 0 : index
            %100 = tor.load %21[%c0_14] on (0 to 0) {dump = "op_252"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_15 = arith.constant {dump = "op_253"} 0 : index
            tor.store %100 to %20[%c0_15] on (0 to 0) {dump = "op_254"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_16 = arith.constant {dump = "op_255"} 0 : index
            %101 = tor.load %23[%c0_16] on (0 to 0) {dump = "op_256"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_17 = arith.constant {dump = "op_257"} 0 : index
            tor.store %101 to %22[%c0_17] on (0 to 0) {dump = "op_258"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_18 = arith.constant {dump = "op_259"} 0 : index
            %102 = tor.load %24[%c0_18] on (0 to 0) {dump = "op_260"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_19 = arith.constant {dump = "op_261"} 0 : index
            tor.store %102 to %23[%c0_19] on (0 to 0) {dump = "op_262"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_20 = arith.constant {dump = "op_263"} 0 : index
            %103 = tor.load %25[%c0_20] on (0 to 0) {dump = "op_264"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_21 = arith.constant {dump = "op_265"} 0 : index
            tor.store %103 to %24[%c0_21] on (0 to 0) {dump = "op_266"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_22 = arith.constant {dump = "op_267"} 0 : index
            %104 = tor.load %26[%c0_22] on (0 to 0) {dump = "op_268"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_23 = arith.constant {dump = "op_269"} 0 : index
            tor.store %104 to %25[%c0_23] on (0 to 0) {dump = "op_270"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_24 = arith.constant {dump = "op_271"} 0 : index
            %105 = tor.load %28[%c0_24] on (0 to 0) {dump = "op_272"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_25 = arith.constant {dump = "op_273"} 0 : index
            tor.store %105 to %27[%c0_25] on (0 to 0) {dump = "op_274"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_26 = arith.constant {dump = "op_275"} 0 : index
            %106 = tor.load %29[%c0_26] on (0 to 0) {dump = "op_276"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_27 = arith.constant {dump = "op_277"} 0 : index
            tor.store %106 to %28[%c0_27] on (0 to 0) {dump = "op_278"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_28 = arith.constant {dump = "op_279"} 0 : index
            %107 = tor.load %31[%c0_28] on (0 to 0) {dump = "op_280"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_29 = arith.constant {dump = "op_281"} 0 : index
            tor.store %107 to %30[%c0_29] on (0 to 0) {dump = "op_282"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_30 = arith.constant {dump = "op_283"} 0 : index
            %108 = tor.load %32[%c0_30] on (0 to 0) {dump = "op_284"} : !tor.memref<1xf32, [], "rw">[index]
            %c0_31 = arith.constant {dump = "op_285"} 0 : index
            tor.store %108 to %31[%c0_31] on (0 to 0) {dump = "op_286"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_32 = arith.constant {dump = "op_287"} 0 : index
            tor.store %cst_3 to %18[%c0_32] on (0 to 0) {dump = "op_288"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_33 = arith.constant {dump = "op_289"} 0 : index
            tor.store %cst_3 to %21[%c0_33] on (0 to 0) {dump = "op_290"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_34 = arith.constant {dump = "op_291"} 0 : index
            tor.store %cst_3 to %26[%c0_34] on (0 to 0) {dump = "op_292"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_35 = arith.constant {dump = "op_293"} 0 : index
            tor.store %cst_3 to %29[%c0_35] on (0 to 0) {dump = "op_294"} : (f32, !tor.memref<1xf32, [], "rw">[index])
            %c0_36 = arith.constant {dump = "op_295"} 0 : index
            tor.store %cst_3 to %32[%c0_36] on (0 to 0) {dump = "op_296"} : (f32, !tor.memref<1xf32, [], "rw">[index])
          } {dump = "op_298"}
          %94 = scf.if %81 -> (i1) {
            %97 = arith.cmpi sge, %83, %c4_i32 {dump = "op_299"} : i32
            scf.yield {dump = "op_300"} %97 : i1
          } else {
            scf.yield {dump = "op_301"} %false : i1
          } {dump = "op_302"}
          %95 = scf.if %94 -> (i1) {
            %97 = arith.cmpi slt, %83, %c1024_i32 {dump = "op_303"} : i32
            scf.yield {dump = "op_304"} %97 : i1
          } else {
            scf.yield {dump = "op_305"} %false : i1
          } {dump = "op_306"}
          %96 = arith.select %95, %c5_i32, %arg6 {dump = "op_307"} : i32
          scf.if %95 {
            %c0_8 = arith.constant {dump = "op_308"} 0 : index
            %97 = tor.load %22[%c0_8] on (0 to 0) {dump = "op_309"} : !tor.memref<1xf32, [], "rw">[index]
            %98 = arith.addf %97, %cst_3 {dump = "op_310"} : f32
            %c0_9 = arith.constant {dump = "op_311"} 0 : index
            %99 = tor.load %16[%c0_9] on (0 to 0) {dump = "op_312"} : !tor.memref<1xf32, [], "rw">[index]
            %100 = arith.addf %99, %cst_3 {dump = "op_313"} : f32
            %c0_10 = arith.constant {dump = "op_314"} 0 : index
            %101 = tor.load %23[%c0_10] on (0 to 0) {dump = "op_315"} : !tor.memref<1xf32, [], "rw">[index]
            %102 = arith.mulf %101, %cst_1 {"code-line" = 103 : i32, dump = "op_316"} : f32
            %103 = arith.addf %98, %102 {dump = "op_317"} : f32
            %c0_11 = arith.constant {dump = "op_318"} 0 : index
            %104 = tor.load %19[%c0_11] on (0 to 0) {dump = "op_319"} : !tor.memref<1xf32, [], "rw">[index]
            %105 = arith.mulf %104, %cst_1 {"code-line" = 104 : i32, dump = "op_320"} : f32
            %106 = arith.addf %100, %105 {dump = "op_321"} : f32
            %c0_12 = arith.constant {dump = "op_322"} 0 : index
            %107 = tor.load %24[%c0_12] on (0 to 0) {dump = "op_323"} : !tor.memref<1xf32, [], "rw">[index]
            %108 = arith.mulf %107, %cst_3 {"code-line" = 103 : i32, dump = "op_324"} : f32
            %109 = arith.addf %103, %108 {dump = "op_325"} : f32
            %110 = arith.mulf %107, %cst_3 {"code-line" = 104 : i32, dump = "op_326"} : f32
            %111 = arith.addf %106, %110 {dump = "op_327"} : f32
            %c0_13 = arith.constant {dump = "op_328"} 0 : index
            %112 = tor.load %25[%c0_13] on (0 to 0) {dump = "op_329"} : !tor.memref<1xf32, [], "rw">[index]
            %113 = arith.mulf %112, %cst_0 {"code-line" = 103 : i32, dump = "op_330"} : f32
            %114 = arith.addf %109, %113 {dump = "op_331"} : f32
            %c0_14 = arith.constant {dump = "op_332"} 0 : index
            %115 = tor.load %27[%c0_14] on (0 to 0) {dump = "op_333"} : !tor.memref<1xf32, [], "rw">[index]
            %116 = arith.mulf %115, %cst_0 {"code-line" = 104 : i32, dump = "op_334"} : f32
            %117 = arith.addf %111, %116 {dump = "op_335"} : f32
            %c0_15 = arith.constant {dump = "op_336"} 0 : index
            %118 = tor.load %26[%c0_15] on (0 to 0) {dump = "op_337"} : !tor.memref<1xf32, [], "rw">[index]
            %119 = arith.mulf %118, %cst {"code-line" = 103 : i32, dump = "op_338"} : f32
            %120 = arith.addf %114, %119 {dump = "op_339"} : f32
            %c0_16 = arith.constant {dump = "op_340"} 0 : index
            %121 = tor.load %30[%c0_16] on (0 to 0) {dump = "op_341"} : !tor.memref<1xf32, [], "rw">[index]
            %122 = arith.mulf %121, %cst {"code-line" = 104 : i32, dump = "op_342"} : f32
            %123 = arith.addf %117, %122 {dump = "op_343"} : f32
            %124 = arith.divf %120, %cst_2 {"code-line" = 106 : i32, dump = "op_344"} : f32
            tor.stream_write %124 to %76 {dump = "op_345"} : f32, <f32>
            %125 = arith.divf %123, %cst_2 {"code-line" = 107 : i32, dump = "op_346"} : f32
            tor.stream_write %125 to %75 {dump = "op_347"} : f32, <f32>
          } else {
            %97 = arith.addi %arg0, %c-2 {dump = "op_349"} : index
            %98 = arith.cmpi sge, %97, %c0 {dump = "op_350"} : index
            %99 = scf.if %98 -> (i1) {
              %100 = arith.cmpi sge, %83, %c2_i32 {dump = "op_351"} : i32
              scf.yield {dump = "op_352"} %100 : i1
            } else {
              scf.yield {dump = "op_353"} %false : i1
            } {dump = "op_354"}
            scf.if %99 {
              tor.stream_write %cst_3 to %76 {dump = "op_355"} : f32, <f32>
              tor.stream_write %cst_3 to %75 {dump = "op_356"} : f32, <f32>
            } {dump = "op_358"}
          } {dump = "op_360"}
          scf.yield {dump = "op_361"} %96, %93, %92, %91 : i32, i32, i32, i32
        } {II = 1 : i32, dump = "op_362", pipeline = 1 : i32, "pipeline-line" = 50 : i32}
        scf.yield {dump = "op_363"} %82#0, %82#1, %82#2, %82#3 : i32, i32, i32, i32
      } {dump = "op_364"}
      tor.return {dump = "op_365"}
    }
    tor.func @gradient_z_calc_2(...) attributes {clock = 6.000000e+00 : f32, dump = "op_396", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c1024 = arith.constant {dump = "op_367"} 1024 : index
      %cst = arith.constant {dump = "op_368"} -8.000000e+00 : f32
      %cst_0 = arith.constant {dump = "op_369"} 0.000000e+00 : f32
      %cst_1 = arith.constant {dump = "op_370"} 8.000000e+00 : f32
      %cst_2 = arith.constant {dump = "op_371"} -1.000000e+00 : f32
      %cst_3 = arith.constant {dump = "op_372"} 1.200000e+01 : f32
      %c0 = arith.constant {dump = "op_373"} 0 : index
      %c436 = arith.constant {dump = "op_374"} 436 : index
      %c1 = arith.constant {dump = "op_375"} 1 : index
      scf.for %arg0 = %c0 to %c436 step %c1 {
        scf.for %arg1 = %c0 to %c1024 step %c1 {
          %77 = tor.stream_read %49 {dump = "op_376"} : <f32> -> f32
          %78 = tor.stream_read %48 {dump = "op_377"} : <f32> -> f32
          %79 = arith.mulf %78, %cst {"code-line" = 134 : i32, dump = "op_378"} : f32
          %80 = arith.addf %77, %79 {"code-line" = 134 : i32, dump = "op_379"} : f32
          %81 = tor.stream_read %44 {dump = "op_380"} : <f32> -> f32
          %82 = arith.mulf %81, %cst_0 {"code-line" = 134 : i32, dump = "op_381"} : f32
          %83 = arith.addf %80, %82 {"code-line" = 134 : i32, dump = "op_382"} : f32
          %84 = tor.stream_read %47 {dump = "op_383"} : <f32> -> f32
          %85 = arith.mulf %84, %cst_1 {"code-line" = 134 : i32, dump = "op_384"} : f32
          %86 = arith.addf %83, %85 {"code-line" = 134 : i32, dump = "op_385"} : f32
          %87 = tor.stream_read %46 {dump = "op_386"} : <f32> -> f32
          %88 = arith.mulf %87, %cst_2 {"code-line" = 134 : i32, dump = "op_387"} : f32
          %89 = arith.addf %86, %88 {"code-line" = 134 : i32, dump = "op_388"} : f32
          %90 = arith.divf %89, %cst_3 {"code-line" = 134 : i32, dump = "op_389"} : f32
          tor.stream_write %90 to %74 {dump = "op_390"} : f32, <f32>
        } {II = 1 : i32, dump = "op_392", pipeline = 1 : i32, "pipeline-line" = 133 : i32}
      } {dump = "op_394"}
      tor.return {dump = "op_395"}
    }
    tor.func @gradient_weight_y_3(...) attributes {clock = 6.000000e+00 : f32, dump = "op_807", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c-3 = arith.constant {dump = "op_397"} -3 : index
      %c-6 = arith.constant {dump = "op_398"} -6 : index
      %c2 = arith.constant {dump = "op_399"} 2 : index
      %c435 = arith.constant {dump = "op_400"} 435 : index
      %c1024 = arith.constant {dump = "op_401"} 1024 : index
      %c1 = arith.constant {dump = "op_402"} 1 : index
      %c439 = arith.constant {dump = "op_403"} 439 : index
      %c0 = arith.constant {dump = "op_404"} 0 : index
      %c7_i32 = arith.constant {"code-line" = 187 : i32, dump = "op_405"} 7 : i32
      %c6_i32 = arith.constant {"code-line" = 184 : i32, dump = "op_406"} 6 : i32
      %cst = arith.constant {dump = "op_407"} 0.000000e+00 : f32
      %c436_i32 = arith.constant {"code-line" = 12 : i32, dump = "op_408"} 436 : i32
      %cst_0 = arith.constant {"code-line" = 150 : i32, dump = "op_409"} 2.903000e-01 : f32
      %cst_1 = arith.constant {"code-line" = 150 : i32, dump = "op_410"} 1.869000e-01 : f32
      %cst_2 = arith.constant {"code-line" = 150 : i32, dump = "op_411"} 1.330000e-01 : f32
      %cst_3 = arith.constant {"code-line" = 150 : i32, dump = "op_412"} 7.550000e-02 : f32
      %c0_i32 = arith.constant {dump = "op_413"} 0 : i32
      %77 = scf.for %arg0 = %c0 to %c439 step %c1 iter_args(%arg1 = %c0_i32) -> (i32) {
        %78 = arith.index_cast %arg0 {dump = "op_414"} : index to i32
        %79 = arith.cmpi slt, %78, %c436_i32 {dump = "op_415"} : i32
        %80 = arith.cmpi sge, %78, %c6_i32 {dump = "op_416"} : i32
        %81 = arith.andi %80, %79 {dump = "op_417"} : i1
        %82 = scf.for %arg2 = %c0 to %c1024 step %c1 iter_args(%arg3 = %arg1) -> (i32) {
          %83 = arith.subi %c435, %arg0 {dump = "op_418"} : index
          %84 = arith.cmpi sge, %83, %c0 {dump = "op_419"} : index
          scf.if %84 {
            %c3 = arith.constant {dump = "op_420"} 3 : index
            %91 = arith.muli %arg2, %c3 {dump = "op_421"} : index
            %92 = arith.addi %c0, %91 {dump = "op_422"} : index
            %93 = tor.load %10[%92] on (0 to 0) {dump = "op_423"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_4 = arith.constant {dump = "op_424"} 3 : index
            %94 = arith.muli %arg2, %c3_4 {dump = "op_425"} : index
            %95 = arith.addi %c0, %94 {dump = "op_426"} : index
            tor.store %93 to %9[%95] on (0 to 0) {dump = "op_427"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_5 = arith.constant {dump = "op_428"} 3 : index
            %96 = arith.muli %arg2, %c3_5 {dump = "op_429"} : index
            %97 = arith.addi %c1, %96 {dump = "op_430"} : index
            %98 = tor.load %10[%97] on (0 to 0) {dump = "op_431"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_6 = arith.constant {dump = "op_432"} 3 : index
            %99 = arith.muli %arg2, %c3_6 {dump = "op_433"} : index
            %100 = arith.addi %c1, %99 {dump = "op_434"} : index
            tor.store %98 to %9[%100] on (0 to 0) {dump = "op_435"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_7 = arith.constant {dump = "op_436"} 3 : index
            %101 = arith.muli %arg2, %c3_7 {dump = "op_437"} : index
            %102 = arith.addi %c2, %101 {dump = "op_438"} : index
            %103 = tor.load %10[%102] on (0 to 0) {dump = "op_439"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_8 = arith.constant {dump = "op_440"} 3 : index
            %104 = arith.muli %arg2, %c3_8 {dump = "op_441"} : index
            %105 = arith.addi %c2, %104 {dump = "op_442"} : index
            tor.store %103 to %9[%105] on (0 to 0) {dump = "op_443"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_9 = arith.constant {dump = "op_444"} 3 : index
            %106 = arith.muli %arg2, %c3_9 {dump = "op_445"} : index
            %107 = arith.addi %c0, %106 {dump = "op_446"} : index
            %108 = tor.load %11[%107] on (0 to 0) {dump = "op_447"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_10 = arith.constant {dump = "op_448"} 3 : index
            %109 = arith.muli %arg2, %c3_10 {dump = "op_449"} : index
            %110 = arith.addi %c0, %109 {dump = "op_450"} : index
            tor.store %108 to %10[%110] on (0 to 0) {dump = "op_451"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_11 = arith.constant {dump = "op_452"} 3 : index
            %111 = arith.muli %arg2, %c3_11 {dump = "op_453"} : index
            %112 = arith.addi %c1, %111 {dump = "op_454"} : index
            %113 = tor.load %11[%112] on (0 to 0) {dump = "op_455"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_12 = arith.constant {dump = "op_456"} 3 : index
            %114 = arith.muli %arg2, %c3_12 {dump = "op_457"} : index
            %115 = arith.addi %c1, %114 {dump = "op_458"} : index
            tor.store %113 to %10[%115] on (0 to 0) {dump = "op_459"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_13 = arith.constant {dump = "op_460"} 3 : index
            %116 = arith.muli %arg2, %c3_13 {dump = "op_461"} : index
            %117 = arith.addi %c2, %116 {dump = "op_462"} : index
            %118 = tor.load %11[%117] on (0 to 0) {dump = "op_463"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_14 = arith.constant {dump = "op_464"} 3 : index
            %119 = arith.muli %arg2, %c3_14 {dump = "op_465"} : index
            %120 = arith.addi %c2, %119 {dump = "op_466"} : index
            tor.store %118 to %10[%120] on (0 to 0) {dump = "op_467"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_15 = arith.constant {dump = "op_468"} 3 : index
            %121 = arith.muli %arg2, %c3_15 {dump = "op_469"} : index
            %122 = arith.addi %c0, %121 {dump = "op_470"} : index
            %123 = tor.load %12[%122] on (0 to 0) {dump = "op_471"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_16 = arith.constant {dump = "op_472"} 3 : index
            %124 = arith.muli %arg2, %c3_16 {dump = "op_473"} : index
            %125 = arith.addi %c0, %124 {dump = "op_474"} : index
            tor.store %123 to %11[%125] on (0 to 0) {dump = "op_475"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_17 = arith.constant {dump = "op_476"} 3 : index
            %126 = arith.muli %arg2, %c3_17 {dump = "op_477"} : index
            %127 = arith.addi %c1, %126 {dump = "op_478"} : index
            %128 = tor.load %12[%127] on (0 to 0) {dump = "op_479"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_18 = arith.constant {dump = "op_480"} 3 : index
            %129 = arith.muli %arg2, %c3_18 {dump = "op_481"} : index
            %130 = arith.addi %c1, %129 {dump = "op_482"} : index
            tor.store %128 to %11[%130] on (0 to 0) {dump = "op_483"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_19 = arith.constant {dump = "op_484"} 3 : index
            %131 = arith.muli %arg2, %c3_19 {dump = "op_485"} : index
            %132 = arith.addi %c2, %131 {dump = "op_486"} : index
            %133 = tor.load %12[%132] on (0 to 0) {dump = "op_487"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_20 = arith.constant {dump = "op_488"} 3 : index
            %134 = arith.muli %arg2, %c3_20 {dump = "op_489"} : index
            %135 = arith.addi %c2, %134 {dump = "op_490"} : index
            tor.store %133 to %11[%135] on (0 to 0) {dump = "op_491"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_21 = arith.constant {dump = "op_492"} 3 : index
            %136 = arith.muli %arg2, %c3_21 {dump = "op_493"} : index
            %137 = arith.addi %c0, %136 {dump = "op_494"} : index
            %138 = tor.load %13[%137] on (0 to 0) {dump = "op_495"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_22 = arith.constant {dump = "op_496"} 3 : index
            %139 = arith.muli %arg2, %c3_22 {dump = "op_497"} : index
            %140 = arith.addi %c0, %139 {dump = "op_498"} : index
            tor.store %138 to %12[%140] on (0 to 0) {dump = "op_499"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_23 = arith.constant {dump = "op_500"} 3 : index
            %141 = arith.muli %arg2, %c3_23 {dump = "op_501"} : index
            %142 = arith.addi %c1, %141 {dump = "op_502"} : index
            %143 = tor.load %13[%142] on (0 to 0) {dump = "op_503"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_24 = arith.constant {dump = "op_504"} 3 : index
            %144 = arith.muli %arg2, %c3_24 {dump = "op_505"} : index
            %145 = arith.addi %c1, %144 {dump = "op_506"} : index
            tor.store %143 to %12[%145] on (0 to 0) {dump = "op_507"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_25 = arith.constant {dump = "op_508"} 3 : index
            %146 = arith.muli %arg2, %c3_25 {dump = "op_509"} : index
            %147 = arith.addi %c2, %146 {dump = "op_510"} : index
            %148 = tor.load %13[%147] on (0 to 0) {dump = "op_511"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_26 = arith.constant {dump = "op_512"} 3 : index
            %149 = arith.muli %arg2, %c3_26 {dump = "op_513"} : index
            %150 = arith.addi %c2, %149 {dump = "op_514"} : index
            tor.store %148 to %12[%150] on (0 to 0) {dump = "op_515"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_27 = arith.constant {dump = "op_516"} 3 : index
            %151 = arith.muli %arg2, %c3_27 {dump = "op_517"} : index
            %152 = arith.addi %c0, %151 {dump = "op_518"} : index
            %153 = tor.load %14[%152] on (0 to 0) {dump = "op_519"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_28 = arith.constant {dump = "op_520"} 3 : index
            %154 = arith.muli %arg2, %c3_28 {dump = "op_521"} : index
            %155 = arith.addi %c0, %154 {dump = "op_522"} : index
            tor.store %153 to %13[%155] on (0 to 0) {dump = "op_523"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_29 = arith.constant {dump = "op_524"} 3 : index
            %156 = arith.muli %arg2, %c3_29 {dump = "op_525"} : index
            %157 = arith.addi %c1, %156 {dump = "op_526"} : index
            %158 = tor.load %14[%157] on (0 to 0) {dump = "op_527"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_30 = arith.constant {dump = "op_528"} 3 : index
            %159 = arith.muli %arg2, %c3_30 {dump = "op_529"} : index
            %160 = arith.addi %c1, %159 {dump = "op_530"} : index
            tor.store %158 to %13[%160] on (0 to 0) {dump = "op_531"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_31 = arith.constant {dump = "op_532"} 3 : index
            %161 = arith.muli %arg2, %c3_31 {dump = "op_533"} : index
            %162 = arith.addi %c2, %161 {dump = "op_534"} : index
            %163 = tor.load %14[%162] on (0 to 0) {dump = "op_535"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_32 = arith.constant {dump = "op_536"} 3 : index
            %164 = arith.muli %arg2, %c3_32 {dump = "op_537"} : index
            %165 = arith.addi %c2, %164 {dump = "op_538"} : index
            tor.store %163 to %13[%165] on (0 to 0) {dump = "op_539"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_33 = arith.constant {dump = "op_540"} 3 : index
            %166 = arith.muli %arg2, %c3_33 {dump = "op_541"} : index
            %167 = arith.addi %c0, %166 {dump = "op_542"} : index
            %168 = tor.load %15[%167] on (0 to 0) {dump = "op_543"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_34 = arith.constant {dump = "op_544"} 3 : index
            %169 = arith.muli %arg2, %c3_34 {dump = "op_545"} : index
            %170 = arith.addi %c0, %169 {dump = "op_546"} : index
            tor.store %168 to %14[%170] on (0 to 0) {dump = "op_547"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_35 = arith.constant {dump = "op_548"} 3 : index
            %171 = arith.muli %arg2, %c3_35 {dump = "op_549"} : index
            %172 = arith.addi %c1, %171 {dump = "op_550"} : index
            %173 = tor.load %15[%172] on (0 to 0) {dump = "op_551"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_36 = arith.constant {dump = "op_552"} 3 : index
            %174 = arith.muli %arg2, %c3_36 {dump = "op_553"} : index
            %175 = arith.addi %c1, %174 {dump = "op_554"} : index
            tor.store %173 to %14[%175] on (0 to 0) {dump = "op_555"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_37 = arith.constant {dump = "op_556"} 3 : index
            %176 = arith.muli %arg2, %c3_37 {dump = "op_557"} : index
            %177 = arith.addi %c2, %176 {dump = "op_558"} : index
            %178 = tor.load %15[%177] on (0 to 0) {dump = "op_559"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_38 = arith.constant {dump = "op_560"} 3 : index
            %179 = arith.muli %arg2, %c3_38 {dump = "op_561"} : index
            %180 = arith.addi %c2, %179 {dump = "op_562"} : index
            tor.store %178 to %14[%180] on (0 to 0) {dump = "op_563"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %181 = tor.stream_read %76 {dump = "op_564"} : <f32> -> f32
            %182 = tor.stream_read %75 {dump = "op_565"} : <f32> -> f32
            %183 = tor.stream_read %74 {dump = "op_566"} : <f32> -> f32
            %c3_39 = arith.constant {dump = "op_567"} 3 : index
            %184 = arith.muli %arg2, %c3_39 {dump = "op_568"} : index
            %185 = arith.addi %c0, %184 {dump = "op_569"} : index
            tor.store %181 to %13[%185] on (0 to 0) {dump = "op_570"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_40 = arith.constant {dump = "op_571"} 3 : index
            %186 = arith.muli %arg2, %c3_40 {dump = "op_572"} : index
            %187 = arith.addi %c1, %186 {dump = "op_573"} : index
            tor.store %182 to %13[%187] on (0 to 0) {dump = "op_574"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_41 = arith.constant {dump = "op_575"} 3 : index
            %188 = arith.muli %arg2, %c3_41 {dump = "op_576"} : index
            %189 = arith.addi %c2, %188 {dump = "op_577"} : index
            tor.store %183 to %13[%189] on (0 to 0) {dump = "op_578"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
          } else {
            %c3 = arith.constant {dump = "op_580"} 3 : index
            %91 = arith.muli %arg2, %c3 {dump = "op_581"} : index
            %92 = arith.addi %c0, %91 {dump = "op_582"} : index
            %93 = tor.load %10[%92] on (0 to 0) {dump = "op_583"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_4 = arith.constant {dump = "op_584"} 3 : index
            %94 = arith.muli %arg2, %c3_4 {dump = "op_585"} : index
            %95 = arith.addi %c0, %94 {dump = "op_586"} : index
            tor.store %93 to %9[%95] on (0 to 0) {dump = "op_587"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_5 = arith.constant {dump = "op_588"} 3 : index
            %96 = arith.muli %arg2, %c3_5 {dump = "op_589"} : index
            %97 = arith.addi %c1, %96 {dump = "op_590"} : index
            %98 = tor.load %10[%97] on (0 to 0) {dump = "op_591"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_6 = arith.constant {dump = "op_592"} 3 : index
            %99 = arith.muli %arg2, %c3_6 {dump = "op_593"} : index
            %100 = arith.addi %c1, %99 {dump = "op_594"} : index
            tor.store %98 to %9[%100] on (0 to 0) {dump = "op_595"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_7 = arith.constant {dump = "op_596"} 3 : index
            %101 = arith.muli %arg2, %c3_7 {dump = "op_597"} : index
            %102 = arith.addi %c2, %101 {dump = "op_598"} : index
            %103 = tor.load %10[%102] on (0 to 0) {dump = "op_599"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_8 = arith.constant {dump = "op_600"} 3 : index
            %104 = arith.muli %arg2, %c3_8 {dump = "op_601"} : index
            %105 = arith.addi %c2, %104 {dump = "op_602"} : index
            tor.store %103 to %9[%105] on (0 to 0) {dump = "op_603"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_9 = arith.constant {dump = "op_604"} 3 : index
            %106 = arith.muli %arg2, %c3_9 {dump = "op_605"} : index
            %107 = arith.addi %c0, %106 {dump = "op_606"} : index
            %108 = tor.load %11[%107] on (0 to 0) {dump = "op_607"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_10 = arith.constant {dump = "op_608"} 3 : index
            %109 = arith.muli %arg2, %c3_10 {dump = "op_609"} : index
            %110 = arith.addi %c0, %109 {dump = "op_610"} : index
            tor.store %108 to %10[%110] on (0 to 0) {dump = "op_611"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_11 = arith.constant {dump = "op_612"} 3 : index
            %111 = arith.muli %arg2, %c3_11 {dump = "op_613"} : index
            %112 = arith.addi %c1, %111 {dump = "op_614"} : index
            %113 = tor.load %11[%112] on (0 to 0) {dump = "op_615"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_12 = arith.constant {dump = "op_616"} 3 : index
            %114 = arith.muli %arg2, %c3_12 {dump = "op_617"} : index
            %115 = arith.addi %c1, %114 {dump = "op_618"} : index
            tor.store %113 to %10[%115] on (0 to 0) {dump = "op_619"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_13 = arith.constant {dump = "op_620"} 3 : index
            %116 = arith.muli %arg2, %c3_13 {dump = "op_621"} : index
            %117 = arith.addi %c2, %116 {dump = "op_622"} : index
            %118 = tor.load %11[%117] on (0 to 0) {dump = "op_623"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_14 = arith.constant {dump = "op_624"} 3 : index
            %119 = arith.muli %arg2, %c3_14 {dump = "op_625"} : index
            %120 = arith.addi %c2, %119 {dump = "op_626"} : index
            tor.store %118 to %10[%120] on (0 to 0) {dump = "op_627"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_15 = arith.constant {dump = "op_628"} 3 : index
            %121 = arith.muli %arg2, %c3_15 {dump = "op_629"} : index
            %122 = arith.addi %c0, %121 {dump = "op_630"} : index
            %123 = tor.load %12[%122] on (0 to 0) {dump = "op_631"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_16 = arith.constant {dump = "op_632"} 3 : index
            %124 = arith.muli %arg2, %c3_16 {dump = "op_633"} : index
            %125 = arith.addi %c0, %124 {dump = "op_634"} : index
            tor.store %123 to %11[%125] on (0 to 0) {dump = "op_635"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_17 = arith.constant {dump = "op_636"} 3 : index
            %126 = arith.muli %arg2, %c3_17 {dump = "op_637"} : index
            %127 = arith.addi %c1, %126 {dump = "op_638"} : index
            %128 = tor.load %12[%127] on (0 to 0) {dump = "op_639"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_18 = arith.constant {dump = "op_640"} 3 : index
            %129 = arith.muli %arg2, %c3_18 {dump = "op_641"} : index
            %130 = arith.addi %c1, %129 {dump = "op_642"} : index
            tor.store %128 to %11[%130] on (0 to 0) {dump = "op_643"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_19 = arith.constant {dump = "op_644"} 3 : index
            %131 = arith.muli %arg2, %c3_19 {dump = "op_645"} : index
            %132 = arith.addi %c2, %131 {dump = "op_646"} : index
            %133 = tor.load %12[%132] on (0 to 0) {dump = "op_647"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_20 = arith.constant {dump = "op_648"} 3 : index
            %134 = arith.muli %arg2, %c3_20 {dump = "op_649"} : index
            %135 = arith.addi %c2, %134 {dump = "op_650"} : index
            tor.store %133 to %11[%135] on (0 to 0) {dump = "op_651"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_21 = arith.constant {dump = "op_652"} 3 : index
            %136 = arith.muli %arg2, %c3_21 {dump = "op_653"} : index
            %137 = arith.addi %c0, %136 {dump = "op_654"} : index
            %138 = tor.load %13[%137] on (0 to 0) {dump = "op_655"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_22 = arith.constant {dump = "op_656"} 3 : index
            %139 = arith.muli %arg2, %c3_22 {dump = "op_657"} : index
            %140 = arith.addi %c0, %139 {dump = "op_658"} : index
            tor.store %138 to %12[%140] on (0 to 0) {dump = "op_659"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_23 = arith.constant {dump = "op_660"} 3 : index
            %141 = arith.muli %arg2, %c3_23 {dump = "op_661"} : index
            %142 = arith.addi %c1, %141 {dump = "op_662"} : index
            %143 = tor.load %13[%142] on (0 to 0) {dump = "op_663"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_24 = arith.constant {dump = "op_664"} 3 : index
            %144 = arith.muli %arg2, %c3_24 {dump = "op_665"} : index
            %145 = arith.addi %c1, %144 {dump = "op_666"} : index
            tor.store %143 to %12[%145] on (0 to 0) {dump = "op_667"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_25 = arith.constant {dump = "op_668"} 3 : index
            %146 = arith.muli %arg2, %c3_25 {dump = "op_669"} : index
            %147 = arith.addi %c2, %146 {dump = "op_670"} : index
            %148 = tor.load %13[%147] on (0 to 0) {dump = "op_671"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_26 = arith.constant {dump = "op_672"} 3 : index
            %149 = arith.muli %arg2, %c3_26 {dump = "op_673"} : index
            %150 = arith.addi %c2, %149 {dump = "op_674"} : index
            tor.store %148 to %12[%150] on (0 to 0) {dump = "op_675"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_27 = arith.constant {dump = "op_676"} 3 : index
            %151 = arith.muli %arg2, %c3_27 {dump = "op_677"} : index
            %152 = arith.addi %c0, %151 {dump = "op_678"} : index
            %153 = tor.load %14[%152] on (0 to 0) {dump = "op_679"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_28 = arith.constant {dump = "op_680"} 3 : index
            %154 = arith.muli %arg2, %c3_28 {dump = "op_681"} : index
            %155 = arith.addi %c0, %154 {dump = "op_682"} : index
            tor.store %153 to %13[%155] on (0 to 0) {dump = "op_683"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_29 = arith.constant {dump = "op_684"} 3 : index
            %156 = arith.muli %arg2, %c3_29 {dump = "op_685"} : index
            %157 = arith.addi %c1, %156 {dump = "op_686"} : index
            %158 = tor.load %14[%157] on (0 to 0) {dump = "op_687"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_30 = arith.constant {dump = "op_688"} 3 : index
            %159 = arith.muli %arg2, %c3_30 {dump = "op_689"} : index
            %160 = arith.addi %c1, %159 {dump = "op_690"} : index
            tor.store %158 to %13[%160] on (0 to 0) {dump = "op_691"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_31 = arith.constant {dump = "op_692"} 3 : index
            %161 = arith.muli %arg2, %c3_31 {dump = "op_693"} : index
            %162 = arith.addi %c2, %161 {dump = "op_694"} : index
            %163 = tor.load %14[%162] on (0 to 0) {dump = "op_695"} : !tor.memref<3072xf32, [], "rw">[index]
            %c3_32 = arith.constant {dump = "op_696"} 3 : index
            %164 = arith.muli %arg2, %c3_32 {dump = "op_697"} : index
            %165 = arith.addi %c2, %164 {dump = "op_698"} : index
            tor.store %163 to %13[%165] on (0 to 0) {dump = "op_699"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_33 = arith.constant {dump = "op_700"} 3 : index
            %166 = arith.muli %arg2, %c3_33 {dump = "op_701"} : index
            %167 = arith.addi %c0, %166 {dump = "op_702"} : index
            %168 = tor.load %15[%167] on (0 to 0) {dump = "op_703"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_34 = arith.constant {dump = "op_704"} 3 : index
            %169 = arith.muli %arg2, %c3_34 {dump = "op_705"} : index
            %170 = arith.addi %c0, %169 {dump = "op_706"} : index
            tor.store %168 to %14[%170] on (0 to 0) {dump = "op_707"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_35 = arith.constant {dump = "op_708"} 3 : index
            %171 = arith.muli %arg2, %c3_35 {dump = "op_709"} : index
            %172 = arith.addi %c1, %171 {dump = "op_710"} : index
            %173 = tor.load %15[%172] on (0 to 0) {dump = "op_711"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_36 = arith.constant {dump = "op_712"} 3 : index
            %174 = arith.muli %arg2, %c3_36 {dump = "op_713"} : index
            %175 = arith.addi %c1, %174 {dump = "op_714"} : index
            tor.store %173 to %14[%175] on (0 to 0) {dump = "op_715"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_37 = arith.constant {dump = "op_716"} 3 : index
            %176 = arith.muli %arg2, %c3_37 {dump = "op_717"} : index
            %177 = arith.addi %c2, %176 {dump = "op_718"} : index
            %178 = tor.load %15[%177] on (0 to 0) {dump = "op_719"} : !tor.memref<3072xf32, [], "r">[index]
            %c3_38 = arith.constant {dump = "op_720"} 3 : index
            %179 = arith.muli %arg2, %c3_38 {dump = "op_721"} : index
            %180 = arith.addi %c2, %179 {dump = "op_722"} : index
            tor.store %178 to %14[%180] on (0 to 0) {dump = "op_723"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %181 = tor.stream_read %76 {dump = "op_724"} : <f32> -> f32
            %182 = tor.stream_read %75 {dump = "op_725"} : <f32> -> f32
            %183 = tor.stream_read %74 {dump = "op_726"} : <f32> -> f32
            %c3_39 = arith.constant {dump = "op_727"} 3 : index
            %184 = arith.muli %arg2, %c3_39 {dump = "op_728"} : index
            %185 = arith.addi %c0, %184 {dump = "op_729"} : index
            tor.store %181 to %13[%185] on (0 to 0) {dump = "op_730"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_40 = arith.constant {dump = "op_731"} 3 : index
            %186 = arith.muli %arg2, %c3_40 {dump = "op_732"} : index
            %187 = arith.addi %c1, %186 {dump = "op_733"} : index
            tor.store %182 to %13[%187] on (0 to 0) {dump = "op_734"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
            %c3_41 = arith.constant {dump = "op_735"} 3 : index
            %188 = arith.muli %arg2, %c3_41 {dump = "op_736"} : index
            %189 = arith.addi %c2, %188 {dump = "op_737"} : index
            tor.store %183 to %13[%189] on (0 to 0) {dump = "op_738"} : (f32, !tor.memref<3072xf32, [], "rw">[index])
          } {dump = "op_740"}
          %85 = arith.select %81, %c7_i32, %arg3 {dump = "op_741"} : i32
          %86 = arith.addi %arg0, %c-6 {dump = "op_742"} : index
          %87 = arith.cmpi sge, %86, %c0 {dump = "op_743"} : index
          %88 = arith.subi %c435, %arg0 {dump = "op_744"} : index
          %89 = arith.cmpi sge, %88, %c0 {dump = "op_745"} : index
          %90 = arith.andi %87, %89 {dump = "op_746"} : i1
          scf.if %90 {
            %c3 = arith.constant {dump = "op_747"} 3 : index
            %91 = arith.muli %arg2, %c3 {dump = "op_748"} : index
            %92 = arith.addi %c0, %91 {dump = "op_749"} : index
            %93 = tor.load %9[%92] on (0 to 0) {dump = "op_750"} : !tor.memref<3072xf32, [], "rw">[index]
            %94 = arith.mulf %93, %cst_3 {"code-line" = 190 : i32, dump = "op_751"} : f32
            %95 = arith.addf %94, %cst {dump = "op_752"} : f32
            %c3_4 = arith.constant {dump = "op_753"} 3 : index
            %96 = arith.muli %arg2, %c3_4 {dump = "op_754"} : index
            %97 = arith.addi %c0, %96 {dump = "op_755"} : index
            %98 = tor.load %10[%97] on (0 to 0) {dump = "op_756"} : !tor.memref<3072xf32, [], "rw">[index]
            %99 = arith.mulf %98, %cst_2 {"code-line" = 190 : i32, dump = "op_757"} : f32
            %100 = arith.addf %95, %99 {dump = "op_758"} : f32
            %c3_5 = arith.constant {dump = "op_759"} 3 : index
            %101 = arith.muli %arg2, %c3_5 {dump = "op_760"} : index
            %102 = arith.addi %c0, %101 {dump = "op_761"} : index
            %103 = tor.load %11[%102] on (0 to 0) {dump = "op_762"} : !tor.memref<3072xf32, [], "rw">[index]
            %104 = arith.mulf %103, %cst_1 {"code-line" = 190 : i32, dump = "op_763"} : f32
            %105 = arith.addf %100, %104 {dump = "op_764"} : f32
            %c3_6 = arith.constant {dump = "op_765"} 3 : index
            %106 = arith.muli %arg2, %c3_6 {dump = "op_766"} : index
            %107 = arith.addi %c0, %106 {dump = "op_767"} : index
            %108 = tor.load %12[%107] on (0 to 0) {dump = "op_768"} : !tor.memref<3072xf32, [], "rw">[index]
            %109 = arith.mulf %108, %cst_0 {"code-line" = 190 : i32, dump = "op_769"} : f32
            %110 = arith.addf %105, %109 {dump = "op_770"} : f32
            %c3_7 = arith.constant {dump = "op_771"} 3 : index
            %111 = arith.muli %arg2, %c3_7 {dump = "op_772"} : index
            %112 = arith.addi %c0, %111 {dump = "op_773"} : index
            %113 = tor.load %13[%112] on (0 to 0) {dump = "op_774"} : !tor.memref<3072xf32, [], "rw">[index]
            %114 = arith.mulf %113, %cst_1 {"code-line" = 190 : i32, dump = "op_775"} : f32
            %115 = arith.addf %110, %114 {dump = "op_776"} : f32
            %c3_8 = arith.constant {dump = "op_777"} 3 : index
            %116 = arith.muli %arg2, %c3_8 {dump = "op_778"} : index
            %117 = arith.addi %c0, %116 {dump = "op_779"} : index
            %118 = tor.load %14[%117] on (0 to 0) {dump = "op_780"} : !tor.memref<3072xf32, [], "rw">[index]
            %119 = arith.mulf %118, %cst_2 {"code-line" = 190 : i32, dump = "op_781"} : f32
            %120 = arith.addf %115, %119 {dump = "op_782"} : f32
            %c3_9 = arith.constant {dump = "op_783"} 3 : index
            %121 = arith.muli %arg2, %c3_9 {dump = "op_784"} : index
            %122 = arith.addi %c0, %121 {dump = "op_785"} : index
            %123 = tor.load %15[%122] on (0 to 0) {dump = "op_786"} : !tor.memref<3072xf32, [], "r">[index]
            %124 = arith.mulf %123, %cst_3 {"code-line" = 190 : i32, dump = "op_787"} : f32
            %125 = arith.addf %120, %124 {dump = "op_788"} : f32
            tor.stream_write %125 to %73 {dump = "op_789"} : f32, <f32>
            tor.stream_write %125 to %72 {dump = "op_790"} : f32, <f32>
            tor.stream_write %125 to %71 {dump = "op_791"} : f32, <f32>
          } else {
            %91 = arith.addi %arg0, %c-3 {dump = "op_793"} : index
            %92 = arith.cmpi sge, %91, %c0 {dump = "op_794"} : index
            scf.if %92 {
              tor.stream_write %cst to %73 {dump = "op_795"} : f32, <f32>
              tor.stream_write %cst to %72 {dump = "op_796"} : f32, <f32>
              tor.stream_write %cst to %71 {dump = "op_797"} : f32, <f32>
            } {dump = "op_799"}
          } {dump = "op_801"}
          scf.yield {dump = "op_802"} %85 : i32
        } {II = 1 : i32, dump = "op_803", pipeline = 1 : i32, "pipeline-line" = 157 : i32}
        scf.yield {dump = "op_804"} %82 : i32
      } {dump = "op_805"}
      tor.return {dump = "op_806"}
    }
    tor.func @gradient_weight_x_4(...) attributes {clock = 6.000000e+00 : f32, dump = "op_1065", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c-3 = arith.constant {dump = "op_808"} -3 : index
      %c-6 = arith.constant {dump = "op_809"} -6 : index
      %c1023 = arith.constant {dump = "op_810"} 1023 : index
      %c6 = arith.constant {dump = "op_811"} 6 : index
      %c5 = arith.constant {dump = "op_812"} 5 : index
      %c4 = arith.constant {dump = "op_813"} 4 : index
      %c3 = arith.constant {dump = "op_814"} 3 : index
      %c2 = arith.constant {dump = "op_815"} 2 : index
      %c1027 = arith.constant {dump = "op_816"} 1027 : index
      %c1 = arith.constant {dump = "op_817"} 1 : index
      %c436 = arith.constant {dump = "op_818"} 436 : index
      %c0 = arith.constant {dump = "op_819"} 0 : index
      %c7_i32 = arith.constant {"code-line" = 247 : i32, dump = "op_820"} 7 : i32
      %c6_i32 = arith.constant {"code-line" = 239 : i32, dump = "op_821"} 6 : i32
      %cst = arith.constant {dump = "op_822"} 2.000000e+00 : f32
      %cst_0 = arith.constant {dump = "op_823"} 1.000000e+00 : f32
      %cst_1 = arith.constant {dump = "op_824"} 0.000000e+00 : f32
      %c1024_i32 = arith.constant {"code-line" = 13 : i32, dump = "op_825"} 1024 : i32
      %cst_2 = arith.constant {"code-line" = 217 : i32, dump = "op_826"} 2.903000e-01 : f32
      %cst_3 = arith.constant {"code-line" = 217 : i32, dump = "op_827"} 1.869000e-01 : f32
      %cst_4 = arith.constant {"code-line" = 217 : i32, dump = "op_828"} 1.330000e-01 : f32
      %cst_5 = arith.constant {"code-line" = 217 : i32, dump = "op_829"} 7.550000e-02 : f32
      %c0_i32 = arith.constant {dump = "op_830"} 0 : i32
      %77 = scf.for %arg0 = %c0 to %c436 step %c1 iter_args(%arg1 = %c0_i32) -> (i32) {
        %78 = scf.for %arg2 = %c0 to %c1027 step %c1 iter_args(%arg3 = %arg1) -> (i32) {
          %79 = arith.index_cast %arg2 {dump = "op_831"} : index to i32
          %c3_6 = arith.constant {dump = "op_832"} 3 : index
          %80 = arith.muli %c1, %c3_6 {dump = "op_833"} : index
          %81 = arith.addi %c0, %80 {dump = "op_834"} : index
          %82 = tor.load %8[%81] on (0 to 0) {dump = "op_835"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_7 = arith.constant {dump = "op_836"} 3 : index
          %83 = arith.muli %c0, %c3_7 {dump = "op_837"} : index
          %84 = arith.addi %c0, %83 {dump = "op_838"} : index
          tor.store %82 to %8[%84] on (0 to 0) {dump = "op_839"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_8 = arith.constant {dump = "op_840"} 3 : index
          %85 = arith.muli %c1, %c3_8 {dump = "op_841"} : index
          %86 = arith.addi %c1, %85 {dump = "op_842"} : index
          %87 = tor.load %8[%86] on (0 to 0) {dump = "op_843"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_9 = arith.constant {dump = "op_844"} 3 : index
          %88 = arith.muli %c0, %c3_9 {dump = "op_845"} : index
          %89 = arith.addi %c1, %88 {dump = "op_846"} : index
          tor.store %87 to %8[%89] on (0 to 0) {dump = "op_847"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_10 = arith.constant {dump = "op_848"} 3 : index
          %90 = arith.muli %c1, %c3_10 {dump = "op_849"} : index
          %91 = arith.addi %c2, %90 {dump = "op_850"} : index
          %92 = tor.load %8[%91] on (0 to 0) {dump = "op_851"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_11 = arith.constant {dump = "op_852"} 3 : index
          %93 = arith.muli %c0, %c3_11 {dump = "op_853"} : index
          %94 = arith.addi %c2, %93 {dump = "op_854"} : index
          tor.store %92 to %8[%94] on (0 to 0) {dump = "op_855"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_12 = arith.constant {dump = "op_856"} 3 : index
          %95 = arith.muli %c2, %c3_12 {dump = "op_857"} : index
          %96 = arith.addi %c0, %95 {dump = "op_858"} : index
          %97 = tor.load %8[%96] on (0 to 0) {dump = "op_859"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_13 = arith.constant {dump = "op_860"} 3 : index
          %98 = arith.muli %c1, %c3_13 {dump = "op_861"} : index
          %99 = arith.addi %c0, %98 {dump = "op_862"} : index
          tor.store %97 to %8[%99] on (0 to 0) {dump = "op_863"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_14 = arith.constant {dump = "op_864"} 3 : index
          %100 = arith.muli %c2, %c3_14 {dump = "op_865"} : index
          %101 = arith.addi %c1, %100 {dump = "op_866"} : index
          %102 = tor.load %8[%101] on (0 to 0) {dump = "op_867"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_15 = arith.constant {dump = "op_868"} 3 : index
          %103 = arith.muli %c1, %c3_15 {dump = "op_869"} : index
          %104 = arith.addi %c1, %103 {dump = "op_870"} : index
          tor.store %102 to %8[%104] on (0 to 0) {dump = "op_871"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_16 = arith.constant {dump = "op_872"} 3 : index
          %105 = arith.muli %c2, %c3_16 {dump = "op_873"} : index
          %106 = arith.addi %c2, %105 {dump = "op_874"} : index
          %107 = tor.load %8[%106] on (0 to 0) {dump = "op_875"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_17 = arith.constant {dump = "op_876"} 3 : index
          %108 = arith.muli %c1, %c3_17 {dump = "op_877"} : index
          %109 = arith.addi %c2, %108 {dump = "op_878"} : index
          tor.store %107 to %8[%109] on (0 to 0) {dump = "op_879"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_18 = arith.constant {dump = "op_880"} 3 : index
          %110 = arith.muli %c3, %c3_18 {dump = "op_881"} : index
          %111 = arith.addi %c0, %110 {dump = "op_882"} : index
          %112 = tor.load %8[%111] on (0 to 0) {dump = "op_883"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_19 = arith.constant {dump = "op_884"} 3 : index
          %113 = arith.muli %c2, %c3_19 {dump = "op_885"} : index
          %114 = arith.addi %c0, %113 {dump = "op_886"} : index
          tor.store %112 to %8[%114] on (0 to 0) {dump = "op_887"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_20 = arith.constant {dump = "op_888"} 3 : index
          %115 = arith.muli %c3, %c3_20 {dump = "op_889"} : index
          %116 = arith.addi %c1, %115 {dump = "op_890"} : index
          %117 = tor.load %8[%116] on (0 to 0) {dump = "op_891"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_21 = arith.constant {dump = "op_892"} 3 : index
          %118 = arith.muli %c2, %c3_21 {dump = "op_893"} : index
          %119 = arith.addi %c1, %118 {dump = "op_894"} : index
          tor.store %117 to %8[%119] on (0 to 0) {dump = "op_895"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_22 = arith.constant {dump = "op_896"} 3 : index
          %120 = arith.muli %c3, %c3_22 {dump = "op_897"} : index
          %121 = arith.addi %c2, %120 {dump = "op_898"} : index
          %122 = tor.load %8[%121] on (0 to 0) {dump = "op_899"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_23 = arith.constant {dump = "op_900"} 3 : index
          %123 = arith.muli %c2, %c3_23 {dump = "op_901"} : index
          %124 = arith.addi %c2, %123 {dump = "op_902"} : index
          tor.store %122 to %8[%124] on (0 to 0) {dump = "op_903"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_24 = arith.constant {dump = "op_904"} 3 : index
          %125 = arith.muli %c4, %c3_24 {dump = "op_905"} : index
          %126 = arith.addi %c0, %125 {dump = "op_906"} : index
          %127 = tor.load %8[%126] on (0 to 0) {dump = "op_907"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_25 = arith.constant {dump = "op_908"} 3 : index
          %128 = arith.muli %c3, %c3_25 {dump = "op_909"} : index
          %129 = arith.addi %c0, %128 {dump = "op_910"} : index
          tor.store %127 to %8[%129] on (0 to 0) {dump = "op_911"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_26 = arith.constant {dump = "op_912"} 3 : index
          %130 = arith.muli %c4, %c3_26 {dump = "op_913"} : index
          %131 = arith.addi %c1, %130 {dump = "op_914"} : index
          %132 = tor.load %8[%131] on (0 to 0) {dump = "op_915"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_27 = arith.constant {dump = "op_916"} 3 : index
          %133 = arith.muli %c3, %c3_27 {dump = "op_917"} : index
          %134 = arith.addi %c1, %133 {dump = "op_918"} : index
          tor.store %132 to %8[%134] on (0 to 0) {dump = "op_919"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_28 = arith.constant {dump = "op_920"} 3 : index
          %135 = arith.muli %c4, %c3_28 {dump = "op_921"} : index
          %136 = arith.addi %c2, %135 {dump = "op_922"} : index
          %137 = tor.load %8[%136] on (0 to 0) {dump = "op_923"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_29 = arith.constant {dump = "op_924"} 3 : index
          %138 = arith.muli %c3, %c3_29 {dump = "op_925"} : index
          %139 = arith.addi %c2, %138 {dump = "op_926"} : index
          tor.store %137 to %8[%139] on (0 to 0) {dump = "op_927"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_30 = arith.constant {dump = "op_928"} 3 : index
          %140 = arith.muli %c5, %c3_30 {dump = "op_929"} : index
          %141 = arith.addi %c0, %140 {dump = "op_930"} : index
          %142 = tor.load %8[%141] on (0 to 0) {dump = "op_931"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_31 = arith.constant {dump = "op_932"} 3 : index
          %143 = arith.muli %c4, %c3_31 {dump = "op_933"} : index
          %144 = arith.addi %c0, %143 {dump = "op_934"} : index
          tor.store %142 to %8[%144] on (0 to 0) {dump = "op_935"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_32 = arith.constant {dump = "op_936"} 3 : index
          %145 = arith.muli %c5, %c3_32 {dump = "op_937"} : index
          %146 = arith.addi %c1, %145 {dump = "op_938"} : index
          %147 = tor.load %8[%146] on (0 to 0) {dump = "op_939"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_33 = arith.constant {dump = "op_940"} 3 : index
          %148 = arith.muli %c4, %c3_33 {dump = "op_941"} : index
          %149 = arith.addi %c1, %148 {dump = "op_942"} : index
          tor.store %147 to %8[%149] on (0 to 0) {dump = "op_943"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_34 = arith.constant {dump = "op_944"} 3 : index
          %150 = arith.muli %c5, %c3_34 {dump = "op_945"} : index
          %151 = arith.addi %c2, %150 {dump = "op_946"} : index
          %152 = tor.load %8[%151] on (0 to 0) {dump = "op_947"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_35 = arith.constant {dump = "op_948"} 3 : index
          %153 = arith.muli %c4, %c3_35 {dump = "op_949"} : index
          %154 = arith.addi %c2, %153 {dump = "op_950"} : index
          tor.store %152 to %8[%154] on (0 to 0) {dump = "op_951"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_36 = arith.constant {dump = "op_952"} 3 : index
          %155 = arith.muli %c6, %c3_36 {dump = "op_953"} : index
          %156 = arith.addi %c0, %155 {dump = "op_954"} : index
          %157 = tor.load %8[%156] on (0 to 0) {dump = "op_955"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_37 = arith.constant {dump = "op_956"} 3 : index
          %158 = arith.muli %c5, %c3_37 {dump = "op_957"} : index
          %159 = arith.addi %c0, %158 {dump = "op_958"} : index
          tor.store %157 to %8[%159] on (0 to 0) {dump = "op_959"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_38 = arith.constant {dump = "op_960"} 3 : index
          %160 = arith.muli %c6, %c3_38 {dump = "op_961"} : index
          %161 = arith.addi %c1, %160 {dump = "op_962"} : index
          %162 = tor.load %8[%161] on (0 to 0) {dump = "op_963"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_39 = arith.constant {dump = "op_964"} 3 : index
          %163 = arith.muli %c5, %c3_39 {dump = "op_965"} : index
          %164 = arith.addi %c1, %163 {dump = "op_966"} : index
          tor.store %162 to %8[%164] on (0 to 0) {dump = "op_967"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_40 = arith.constant {dump = "op_968"} 3 : index
          %165 = arith.muli %c6, %c3_40 {dump = "op_969"} : index
          %166 = arith.addi %c2, %165 {dump = "op_970"} : index
          %167 = tor.load %8[%166] on (0 to 0) {dump = "op_971"} : !tor.memref<21xf32, [], "rw">[index]
          %c3_41 = arith.constant {dump = "op_972"} 3 : index
          %168 = arith.muli %c5, %c3_41 {dump = "op_973"} : index
          %169 = arith.addi %c2, %168 {dump = "op_974"} : index
          tor.store %167 to %8[%169] on (0 to 0) {dump = "op_975"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %170 = arith.cmpi slt, %79, %c1024_i32 {dump = "op_976"} : i32
          %171 = arith.subi %c1023, %arg2 {dump = "op_977"} : index
          %172 = arith.cmpi sge, %171, %c0 {dump = "op_978"} : index
          %173:3 = scf.if %172 -> (f32, f32, f32) {
            %188 = tor.stream_read %73 {dump = "op_979"} : <f32> -> f32
            %189 = tor.stream_read %71 {dump = "op_980"} : <f32> -> f32
            %190 = tor.stream_read %72 {dump = "op_981"} : <f32> -> f32
            scf.yield {dump = "op_982"} %188, %189, %190 : f32, f32, f32
          } else {
            scf.yield {dump = "op_983"} %cst_1, %cst_0, %cst : f32, f32, f32
          } {dump = "op_984"}
          %c3_42 = arith.constant {dump = "op_985"} 3 : index
          %174 = arith.muli %c6, %c3_42 {dump = "op_986"} : index
          %175 = arith.addi %c0, %174 {dump = "op_987"} : index
          tor.store %173#0 to %8[%175] on (0 to 0) {dump = "op_988"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_43 = arith.constant {dump = "op_989"} 3 : index
          %176 = arith.muli %c6, %c3_43 {dump = "op_990"} : index
          %177 = arith.addi %c1, %176 {dump = "op_991"} : index
          tor.store %173#1 to %8[%177] on (0 to 0) {dump = "op_992"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %c3_44 = arith.constant {dump = "op_993"} 3 : index
          %178 = arith.muli %c6, %c3_44 {dump = "op_994"} : index
          %179 = arith.addi %c2, %178 {dump = "op_995"} : index
          tor.store %173#2 to %8[%179] on (0 to 0) {dump = "op_996"} : (f32, !tor.memref<21xf32, [], "rw">[index])
          %180 = arith.cmpi sge, %79, %c6_i32 {dump = "op_997"} : i32
          %181 = arith.andi %180, %170 {dump = "op_998"} : i1
          %182 = arith.select %181, %c7_i32, %arg3 {dump = "op_999"} : i32
          %183 = arith.addi %arg2, %c-6 {dump = "op_1000"} : index
          %184 = arith.cmpi sge, %183, %c0 {dump = "op_1001"} : index
          %185 = arith.subi %c1023, %arg2 {dump = "op_1002"} : index
          %186 = arith.cmpi sge, %185, %c0 {dump = "op_1003"} : index
          %187 = arith.andi %184, %186 {dump = "op_1004"} : i1
          scf.if %187 {
            %c3_45 = arith.constant {dump = "op_1005"} 3 : index
            %188 = arith.muli %c0, %c3_45 {dump = "op_1006"} : index
            %189 = arith.addi %c0, %188 {dump = "op_1007"} : index
            %190 = tor.load %8[%189] on (0 to 0) {dump = "op_1008"} : !tor.memref<21xf32, [], "rw">[index]
            %191 = arith.mulf %190, %cst_5 {"code-line" = 250 : i32, dump = "op_1009"} : f32
            %192 = arith.addf %191, %cst_1 {dump = "op_1010"} : f32
            %c3_46 = arith.constant {dump = "op_1011"} 3 : index
            %193 = arith.muli %c1, %c3_46 {dump = "op_1012"} : index
            %194 = arith.addi %c0, %193 {dump = "op_1013"} : index
            %195 = tor.load %8[%194] on (0 to 0) {dump = "op_1014"} : !tor.memref<21xf32, [], "rw">[index]
            %196 = arith.mulf %195, %cst_4 {"code-line" = 250 : i32, dump = "op_1015"} : f32
            %197 = arith.addf %192, %196 {dump = "op_1016"} : f32
            %c3_47 = arith.constant {dump = "op_1017"} 3 : index
            %198 = arith.muli %c2, %c3_47 {dump = "op_1018"} : index
            %199 = arith.addi %c0, %198 {dump = "op_1019"} : index
            %200 = tor.load %8[%199] on (0 to 0) {dump = "op_1020"} : !tor.memref<21xf32, [], "rw">[index]
            %201 = arith.mulf %200, %cst_3 {"code-line" = 250 : i32, dump = "op_1021"} : f32
            %202 = arith.addf %197, %201 {dump = "op_1022"} : f32
            %c3_48 = arith.constant {dump = "op_1023"} 3 : index
            %203 = arith.muli %c3, %c3_48 {dump = "op_1024"} : index
            %204 = arith.addi %c0, %203 {dump = "op_1025"} : index
            %205 = tor.load %8[%204] on (0 to 0) {dump = "op_1026"} : !tor.memref<21xf32, [], "rw">[index]
            %206 = arith.mulf %205, %cst_2 {"code-line" = 250 : i32, dump = "op_1027"} : f32
            %207 = arith.addf %202, %206 {dump = "op_1028"} : f32
            %c3_49 = arith.constant {dump = "op_1029"} 3 : index
            %208 = arith.muli %c4, %c3_49 {dump = "op_1030"} : index
            %209 = arith.addi %c0, %208 {dump = "op_1031"} : index
            %210 = tor.load %8[%209] on (0 to 0) {dump = "op_1032"} : !tor.memref<21xf32, [], "rw">[index]
            %211 = arith.mulf %210, %cst_3 {"code-line" = 250 : i32, dump = "op_1033"} : f32
            %212 = arith.addf %207, %211 {dump = "op_1034"} : f32
            %c3_50 = arith.constant {dump = "op_1035"} 3 : index
            %213 = arith.muli %c5, %c3_50 {dump = "op_1036"} : index
            %214 = arith.addi %c0, %213 {dump = "op_1037"} : index
            %215 = tor.load %8[%214] on (0 to 0) {dump = "op_1038"} : !tor.memref<21xf32, [], "rw">[index]
            %216 = arith.mulf %215, %cst_4 {"code-line" = 250 : i32, dump = "op_1039"} : f32
            %217 = arith.addf %212, %216 {dump = "op_1040"} : f32
            %c3_51 = arith.constant {dump = "op_1041"} 3 : index
            %218 = arith.muli %c6, %c3_51 {dump = "op_1042"} : index
            %219 = arith.addi %c0, %218 {dump = "op_1043"} : index
            %220 = tor.load %8[%219] on (0 to 0) {dump = "op_1044"} : !tor.memref<21xf32, [], "rw">[index]
            %221 = arith.mulf %220, %cst_5 {"code-line" = 250 : i32, dump = "op_1045"} : f32
            %222 = arith.addf %217, %221 {dump = "op_1046"} : f32
            tor.stream_write %222 to %70 {dump = "op_1047"} : f32, <f32>
            tor.stream_write %222 to %69 {dump = "op_1048"} : f32, <f32>
            tor.stream_write %222 to %68 {dump = "op_1049"} : f32, <f32>
          } else {
            %188 = arith.addi %arg2, %c-3 {dump = "op_1051"} : index
            %189 = arith.cmpi sge, %188, %c0 {dump = "op_1052"} : index
            scf.if %189 {
              tor.stream_write %cst_1 to %70 {dump = "op_1053"} : f32, <f32>
              tor.stream_write %cst_1 to %69 {dump = "op_1054"} : f32, <f32>
              tor.stream_write %cst_1 to %68 {dump = "op_1055"} : f32, <f32>
            } {dump = "op_1057"}
          } {dump = "op_1059"}
          scf.yield {dump = "op_1060"} %182 : i32
        } {II = 1 : i32, dump = "op_1061", pipeline = 1 : i32, "pipeline-line" = 224 : i32}
        scf.yield {dump = "op_1062"} %78 : i32
      } {dump = "op_1063"}
      tor.return {dump = "op_1064"}
    }
    tor.func @outer_product_5(...) attributes {clock = 6.000000e+00 : f32, dump = "op_1090", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c1024 = arith.constant {dump = "op_1066"} 1024 : index
      %c0 = arith.constant {dump = "op_1067"} 0 : index
      %c436 = arith.constant {dump = "op_1068"} 436 : index
      %c1 = arith.constant {dump = "op_1069"} 1 : index
      scf.for %arg0 = %c0 to %c436 step %c1 {
        scf.for %arg1 = %c0 to %c1024 step %c1 {
          %77 = tor.stream_read %70 {dump = "op_1070"} : <f32> -> f32
          %78 = tor.stream_read %69 {dump = "op_1071"} : <f32> -> f32
          %79 = tor.stream_read %68 {dump = "op_1072"} : <f32> -> f32
          %80 = arith.mulf %77, %77 {"code-line" = 294 : i32, dump = "op_1073"} : f32
          %81 = arith.mulf %78, %78 {"code-line" = 295 : i32, dump = "op_1074"} : f32
          %82 = arith.mulf %79, %79 {"code-line" = 296 : i32, dump = "op_1075"} : f32
          %83 = arith.mulf %77, %78 {"code-line" = 297 : i32, dump = "op_1076"} : f32
          %84 = arith.mulf %77, %79 {"code-line" = 298 : i32, dump = "op_1077"} : f32
          %85 = arith.mulf %78, %79 {"code-line" = 299 : i32, dump = "op_1078"} : f32
          tor.stream_write %80 to %67 {dump = "op_1079"} : f32, <f32>
          tor.stream_write %81 to %66 {dump = "op_1080"} : f32, <f32>
          tor.stream_write %82 to %65 {dump = "op_1081"} : f32, <f32>
          tor.stream_write %83 to %64 {dump = "op_1082"} : f32, <f32>
          tor.stream_write %84 to %63 {dump = "op_1083"} : f32, <f32>
          tor.stream_write %85 to %62 {dump = "op_1084"} : f32, <f32>
        } {II = 1 : i32, dump = "op_1086", pipeline = 1 : i32, "pipeline-line" = 285 : i32}
      } {dump = "op_1088"}
      tor.return {dump = "op_1089"}
    }
    tor.func @tensor_weight_y_6(...) attributes {clock = 6.000000e+00 : f32, dump = "op_1427", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c6 = arith.constant {dump = "op_1091"} 6 : index
      %c435 = arith.constant {dump = "op_1092"} 435 : index
      %c-1 = arith.constant {dump = "op_1093"} -1 : index
      %c5 = arith.constant {dump = "op_1094"} 5 : index
      %c4 = arith.constant {dump = "op_1095"} 4 : index
      %c3 = arith.constant {dump = "op_1096"} 3 : index
      %c2 = arith.constant {dump = "op_1097"} 2 : index
      %c1024 = arith.constant {dump = "op_1098"} 1024 : index
      %c1 = arith.constant {dump = "op_1099"} 1 : index
      %c437 = arith.constant {dump = "op_1100"} 437 : index
      %c0 = arith.constant {dump = "op_1101"} 0 : index
      %c-2 = arith.constant {dump = "op_1102"} -2 : index
      %c3_i32 = arith.constant {"code-line" = 364 : i32, dump = "op_1103"} 3 : i32
      %cst = arith.constant {dump = "op_1104"} 0.000000e+00 : f32
      %c6_i32 = arith.constant {"code-line" = 349 : i32, dump = "op_1105"} 6 : i32
      %c436_i32 = arith.constant {"code-line" = 12 : i32, dump = "op_1106"} 436 : i32
      %cst_0 = arith.constant {"code-line" = 327 : i32, dump = "op_1107"} 3.513000e-01 : f32
      %cst_1 = arith.constant {"code-line" = 327 : i32, dump = "op_1108"} 3.243000e-01 : f32
      %c0_i32 = arith.constant {dump = "op_1109"} 0 : i32
      %77:3 = scf.for %arg0 = %c0 to %c437 step %c1 iter_args(%arg1 = %c0_i32, %arg2 = %c0_i32, %arg3 = %c0_i32) -> (i32, i32, i32) {
        %78 = arith.index_cast %arg0 {dump = "op_1110"} : index to i32
        %79 = arith.cmpi slt, %78, %c436_i32 {dump = "op_1111"} : i32
        %80 = arith.addi %arg0, %c-2 {dump = "op_1112"} : index
        %81 = arith.cmpi sge, %80, %c0 {dump = "op_1113"} : index
        %82 = arith.andi %81, %79 {dump = "op_1114"} : i1
        %83:3 = scf.for %arg4 = %c0 to %c1024 step %c1 iter_args(%arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) -> (i32, i32, i32) {
          %c6_2 = arith.constant {dump = "op_1115"} 6 : index
          %84 = arith.muli %arg4, %c6_2 {dump = "op_1116"} : index
          %85 = arith.addi %c0, %84 {dump = "op_1117"} : index
          %86 = tor.load %6[%85] on (0 to 0) {dump = "op_1118"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_3 = arith.constant {dump = "op_1119"} 6 : index
          %87 = arith.muli %arg4, %c6_3 {dump = "op_1120"} : index
          %88 = arith.addi %c0, %87 {dump = "op_1121"} : index
          tor.store %86 to %5[%88] on (0 to 0) {dump = "op_1122"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_4 = arith.constant {dump = "op_1123"} 6 : index
          %89 = arith.muli %arg4, %c6_4 {dump = "op_1124"} : index
          %90 = arith.addi %c1, %89 {dump = "op_1125"} : index
          %91 = tor.load %6[%90] on (0 to 0) {dump = "op_1126"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_5 = arith.constant {dump = "op_1127"} 6 : index
          %92 = arith.muli %arg4, %c6_5 {dump = "op_1128"} : index
          %93 = arith.addi %c1, %92 {dump = "op_1129"} : index
          tor.store %91 to %5[%93] on (0 to 0) {dump = "op_1130"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_6 = arith.constant {dump = "op_1131"} 6 : index
          %94 = arith.muli %arg4, %c6_6 {dump = "op_1132"} : index
          %95 = arith.addi %c2, %94 {dump = "op_1133"} : index
          %96 = tor.load %6[%95] on (0 to 0) {dump = "op_1134"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_7 = arith.constant {dump = "op_1135"} 6 : index
          %97 = arith.muli %arg4, %c6_7 {dump = "op_1136"} : index
          %98 = arith.addi %c2, %97 {dump = "op_1137"} : index
          tor.store %96 to %5[%98] on (0 to 0) {dump = "op_1138"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_8 = arith.constant {dump = "op_1139"} 6 : index
          %99 = arith.muli %arg4, %c6_8 {dump = "op_1140"} : index
          %100 = arith.addi %c3, %99 {dump = "op_1141"} : index
          %101 = tor.load %6[%100] on (0 to 0) {dump = "op_1142"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_9 = arith.constant {dump = "op_1143"} 6 : index
          %102 = arith.muli %arg4, %c6_9 {dump = "op_1144"} : index
          %103 = arith.addi %c3, %102 {dump = "op_1145"} : index
          tor.store %101 to %5[%103] on (0 to 0) {dump = "op_1146"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_10 = arith.constant {dump = "op_1147"} 6 : index
          %104 = arith.muli %arg4, %c6_10 {dump = "op_1148"} : index
          %105 = arith.addi %c4, %104 {dump = "op_1149"} : index
          %106 = tor.load %6[%105] on (0 to 0) {dump = "op_1150"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_11 = arith.constant {dump = "op_1151"} 6 : index
          %107 = arith.muli %arg4, %c6_11 {dump = "op_1152"} : index
          %108 = arith.addi %c4, %107 {dump = "op_1153"} : index
          tor.store %106 to %5[%108] on (0 to 0) {dump = "op_1154"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_12 = arith.constant {dump = "op_1155"} 6 : index
          %109 = arith.muli %arg4, %c6_12 {dump = "op_1156"} : index
          %110 = arith.addi %c5, %109 {dump = "op_1157"} : index
          %111 = tor.load %6[%110] on (0 to 0) {dump = "op_1158"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_13 = arith.constant {dump = "op_1159"} 6 : index
          %112 = arith.muli %arg4, %c6_13 {dump = "op_1160"} : index
          %113 = arith.addi %c5, %112 {dump = "op_1161"} : index
          tor.store %111 to %5[%113] on (0 to 0) {dump = "op_1162"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_14 = arith.constant {dump = "op_1163"} 6 : index
          %114 = arith.muli %arg4, %c6_14 {dump = "op_1164"} : index
          %115 = arith.addi %c0, %114 {dump = "op_1165"} : index
          %116 = tor.load %7[%115] on (0 to 0) {dump = "op_1166"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_15 = arith.constant {dump = "op_1167"} 6 : index
          %117 = arith.muli %arg4, %c6_15 {dump = "op_1168"} : index
          %118 = arith.addi %c0, %117 {dump = "op_1169"} : index
          tor.store %116 to %6[%118] on (0 to 0) {dump = "op_1170"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_16 = arith.constant {dump = "op_1171"} 6 : index
          %119 = arith.muli %arg4, %c6_16 {dump = "op_1172"} : index
          %120 = arith.addi %c1, %119 {dump = "op_1173"} : index
          %121 = tor.load %7[%120] on (0 to 0) {dump = "op_1174"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_17 = arith.constant {dump = "op_1175"} 6 : index
          %122 = arith.muli %arg4, %c6_17 {dump = "op_1176"} : index
          %123 = arith.addi %c1, %122 {dump = "op_1177"} : index
          tor.store %121 to %6[%123] on (0 to 0) {dump = "op_1178"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_18 = arith.constant {dump = "op_1179"} 6 : index
          %124 = arith.muli %arg4, %c6_18 {dump = "op_1180"} : index
          %125 = arith.addi %c2, %124 {dump = "op_1181"} : index
          %126 = tor.load %7[%125] on (0 to 0) {dump = "op_1182"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_19 = arith.constant {dump = "op_1183"} 6 : index
          %127 = arith.muli %arg4, %c6_19 {dump = "op_1184"} : index
          %128 = arith.addi %c2, %127 {dump = "op_1185"} : index
          tor.store %126 to %6[%128] on (0 to 0) {dump = "op_1186"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_20 = arith.constant {dump = "op_1187"} 6 : index
          %129 = arith.muli %arg4, %c6_20 {dump = "op_1188"} : index
          %130 = arith.addi %c3, %129 {dump = "op_1189"} : index
          %131 = tor.load %7[%130] on (0 to 0) {dump = "op_1190"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_21 = arith.constant {dump = "op_1191"} 6 : index
          %132 = arith.muli %arg4, %c6_21 {dump = "op_1192"} : index
          %133 = arith.addi %c3, %132 {dump = "op_1193"} : index
          tor.store %131 to %6[%133] on (0 to 0) {dump = "op_1194"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_22 = arith.constant {dump = "op_1195"} 6 : index
          %134 = arith.muli %arg4, %c6_22 {dump = "op_1196"} : index
          %135 = arith.addi %c4, %134 {dump = "op_1197"} : index
          %136 = tor.load %7[%135] on (0 to 0) {dump = "op_1198"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_23 = arith.constant {dump = "op_1199"} 6 : index
          %137 = arith.muli %arg4, %c6_23 {dump = "op_1200"} : index
          %138 = arith.addi %c4, %137 {dump = "op_1201"} : index
          tor.store %136 to %6[%138] on (0 to 0) {dump = "op_1202"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %c6_24 = arith.constant {dump = "op_1203"} 6 : index
          %139 = arith.muli %arg4, %c6_24 {dump = "op_1204"} : index
          %140 = arith.addi %c5, %139 {dump = "op_1205"} : index
          %141 = tor.load %7[%140] on (0 to 0) {dump = "op_1206"} : !tor.memref<6144xf32, [], "rw">[index]
          %c6_25 = arith.constant {dump = "op_1207"} 6 : index
          %142 = arith.muli %arg4, %c6_25 {dump = "op_1208"} : index
          %143 = arith.addi %c5, %142 {dump = "op_1209"} : index
          tor.store %141 to %6[%143] on (0 to 0) {dump = "op_1210"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %144 = arith.select %79, %arg7, %c6_i32 {dump = "op_1211"} : i32
          %145 = arith.subi %c435, %arg0 {dump = "op_1212"} : index
          %146 = arith.cmpi sge, %145, %c0 {dump = "op_1213"} : index
          scf.if %146 {
            %174 = tor.stream_read %67 {dump = "op_1214"} : <f32> -> f32
            tor.store %174 to %4[%c0] on (0 to 0) {dump = "op_1215"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %175 = tor.stream_read %66 {dump = "op_1216"} : <f32> -> f32
            tor.store %175 to %4[%c1] on (0 to 0) {dump = "op_1217"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %176 = tor.stream_read %65 {dump = "op_1218"} : <f32> -> f32
            tor.store %176 to %4[%c2] on (0 to 0) {dump = "op_1219"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %177 = tor.stream_read %64 {dump = "op_1220"} : <f32> -> f32
            tor.store %177 to %4[%c3] on (0 to 0) {dump = "op_1221"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %178 = tor.stream_read %63 {dump = "op_1222"} : <f32> -> f32
            tor.store %178 to %4[%c4] on (0 to 0) {dump = "op_1223"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %179 = tor.stream_read %62 {dump = "op_1224"} : <f32> -> f32
            tor.store %179 to %4[%c5] on (0 to 0) {dump = "op_1225"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } else {
            tor.store %cst to %4[%c0] on (0 to 0) {dump = "op_1227"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %4[%c1] on (0 to 0) {dump = "op_1228"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %4[%c2] on (0 to 0) {dump = "op_1229"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %4[%c3] on (0 to 0) {dump = "op_1230"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %4[%c4] on (0 to 0) {dump = "op_1231"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %4[%c5] on (0 to 0) {dump = "op_1232"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } {dump = "op_1234"}
          %147 = tor.load %4[%c0] on (0 to 0) {dump = "op_1235"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_26 = arith.constant {dump = "op_1236"} 6 : index
          %148 = arith.muli %c6, %c6_26 {dump = "op_1237"} : index
          %149 = arith.addi %c0, %148 {dump = "op_1238"} : index
          tor.store %147 to %7[%149] on (0 to 0) {dump = "op_1239"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %150 = tor.load %4[%c1] on (0 to 0) {dump = "op_1240"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_27 = arith.constant {dump = "op_1241"} 6 : index
          %151 = arith.muli %c6, %c6_27 {dump = "op_1242"} : index
          %152 = arith.addi %c1, %151 {dump = "op_1243"} : index
          tor.store %150 to %7[%152] on (0 to 0) {dump = "op_1244"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %153 = tor.load %4[%c2] on (0 to 0) {dump = "op_1245"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_28 = arith.constant {dump = "op_1246"} 6 : index
          %154 = arith.muli %c6, %c6_28 {dump = "op_1247"} : index
          %155 = arith.addi %c2, %154 {dump = "op_1248"} : index
          tor.store %153 to %7[%155] on (0 to 0) {dump = "op_1249"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %156 = tor.load %4[%c3] on (0 to 0) {dump = "op_1250"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_29 = arith.constant {dump = "op_1251"} 6 : index
          %157 = arith.muli %c6, %c6_29 {dump = "op_1252"} : index
          %158 = arith.addi %c3, %157 {dump = "op_1253"} : index
          tor.store %156 to %7[%158] on (0 to 0) {dump = "op_1254"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %159 = tor.load %4[%c4] on (0 to 0) {dump = "op_1255"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_30 = arith.constant {dump = "op_1256"} 6 : index
          %160 = arith.muli %c6, %c6_30 {dump = "op_1257"} : index
          %161 = arith.addi %c4, %160 {dump = "op_1258"} : index
          tor.store %159 to %7[%161] on (0 to 0) {dump = "op_1259"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          %162 = tor.load %4[%c5] on (0 to 0) {dump = "op_1260"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_31 = arith.constant {dump = "op_1261"} 6 : index
          %163 = arith.muli %c6, %c6_31 {dump = "op_1262"} : index
          %164 = arith.addi %c5, %163 {dump = "op_1263"} : index
          tor.store %162 to %7[%164] on (0 to 0) {dump = "op_1264"} : (f32, !tor.memref<6144xf32, [], "rw">[index])
          tor.store %cst to %3[%c0] on (0 to 0) {dump = "op_1265"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %3[%c1] on (0 to 0) {dump = "op_1266"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %3[%c2] on (0 to 0) {dump = "op_1267"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %3[%c3] on (0 to 0) {dump = "op_1268"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %3[%c4] on (0 to 0) {dump = "op_1269"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %3[%c5] on (0 to 0) {dump = "op_1270"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          %165 = arith.select %82, %c3_i32, %arg6 {dump = "op_1271"} : i32
          %166 = arith.addi %arg0, %c-2 {dump = "op_1272"} : index
          %167 = arith.cmpi sge, %166, %c0 {dump = "op_1273"} : index
          %168 = arith.subi %c435, %arg0 {dump = "op_1274"} : index
          %169 = arith.cmpi sge, %168, %c0 {dump = "op_1275"} : index
          %170 = arith.andi %167, %169 {dump = "op_1276"} : i1
          %171 = arith.select %170, %c6_i32, %arg5 {dump = "op_1277"} : i32
          scf.if %170 {
            %c6_32 = arith.constant {dump = "op_1278"} 6 : index
            %174 = arith.muli %arg4, %c6_32 {dump = "op_1279"} : index
            %175 = arith.addi %c0, %174 {dump = "op_1280"} : index
            %176 = tor.load %5[%175] on (0 to 0) {dump = "op_1281"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_33 = arith.constant {dump = "op_1282"} 6 : index
            %177 = arith.muli %arg4, %c6_33 {dump = "op_1283"} : index
            %178 = arith.addi %c1, %177 {dump = "op_1284"} : index
            %179 = tor.load %5[%178] on (0 to 0) {dump = "op_1285"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_34 = arith.constant {dump = "op_1286"} 6 : index
            %180 = arith.muli %arg4, %c6_34 {dump = "op_1287"} : index
            %181 = arith.addi %c2, %180 {dump = "op_1288"} : index
            %182 = tor.load %5[%181] on (0 to 0) {dump = "op_1289"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_35 = arith.constant {dump = "op_1290"} 6 : index
            %183 = arith.muli %arg4, %c6_35 {dump = "op_1291"} : index
            %184 = arith.addi %c3, %183 {dump = "op_1292"} : index
            %185 = tor.load %5[%184] on (0 to 0) {dump = "op_1293"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_36 = arith.constant {dump = "op_1294"} 6 : index
            %186 = arith.muli %arg4, %c6_36 {dump = "op_1295"} : index
            %187 = arith.addi %c4, %186 {dump = "op_1296"} : index
            %188 = tor.load %5[%187] on (0 to 0) {dump = "op_1297"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_37 = arith.constant {dump = "op_1298"} 6 : index
            %189 = arith.muli %arg4, %c6_37 {dump = "op_1299"} : index
            %190 = arith.addi %c5, %189 {dump = "op_1300"} : index
            %191 = tor.load %5[%190] on (0 to 0) {dump = "op_1301"} : !tor.memref<6144xf32, [], "rw">[index]
            %192 = arith.mulf %176, %cst_1 {"code-line" = 378 : i32, dump = "op_1302"} : f32
            %193 = tor.load %3[%c0] on (0 to 0) {dump = "op_1303"} : !tor.memref<6xf32, [], "rw">[index]
            %194 = arith.addf %193, %192 {dump = "op_1304"} : f32
            %195 = arith.mulf %179, %cst_1 {"code-line" = 378 : i32, dump = "op_1305"} : f32
            %196 = tor.load %3[%c1] on (0 to 0) {dump = "op_1306"} : !tor.memref<6xf32, [], "rw">[index]
            %197 = arith.addf %196, %195 {dump = "op_1307"} : f32
            %198 = arith.mulf %182, %cst_1 {"code-line" = 378 : i32, dump = "op_1308"} : f32
            %199 = tor.load %3[%c2] on (0 to 0) {dump = "op_1309"} : !tor.memref<6xf32, [], "rw">[index]
            %200 = arith.addf %199, %198 {dump = "op_1310"} : f32
            %201 = arith.mulf %185, %cst_1 {"code-line" = 378 : i32, dump = "op_1311"} : f32
            %202 = tor.load %3[%c3] on (0 to 0) {dump = "op_1312"} : !tor.memref<6xf32, [], "rw">[index]
            %203 = arith.addf %202, %201 {dump = "op_1313"} : f32
            %204 = arith.mulf %188, %cst_1 {"code-line" = 378 : i32, dump = "op_1314"} : f32
            %205 = tor.load %3[%c4] on (0 to 0) {dump = "op_1315"} : !tor.memref<6xf32, [], "rw">[index]
            %206 = arith.addf %205, %204 {dump = "op_1316"} : f32
            %207 = arith.mulf %191, %cst_1 {"code-line" = 378 : i32, dump = "op_1317"} : f32
            %208 = tor.load %3[%c5] on (0 to 0) {dump = "op_1318"} : !tor.memref<6xf32, [], "rw">[index]
            %209 = arith.addf %208, %207 {dump = "op_1319"} : f32
            %c6_38 = arith.constant {dump = "op_1320"} 6 : index
            %210 = arith.muli %arg4, %c6_38 {dump = "op_1321"} : index
            %211 = arith.addi %c0, %210 {dump = "op_1322"} : index
            %212 = tor.load %6[%211] on (0 to 0) {dump = "op_1323"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_39 = arith.constant {dump = "op_1324"} 6 : index
            %213 = arith.muli %arg4, %c6_39 {dump = "op_1325"} : index
            %214 = arith.addi %c1, %213 {dump = "op_1326"} : index
            %215 = tor.load %6[%214] on (0 to 0) {dump = "op_1327"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_40 = arith.constant {dump = "op_1328"} 6 : index
            %216 = arith.muli %arg4, %c6_40 {dump = "op_1329"} : index
            %217 = arith.addi %c2, %216 {dump = "op_1330"} : index
            %218 = tor.load %6[%217] on (0 to 0) {dump = "op_1331"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_41 = arith.constant {dump = "op_1332"} 6 : index
            %219 = arith.muli %arg4, %c6_41 {dump = "op_1333"} : index
            %220 = arith.addi %c3, %219 {dump = "op_1334"} : index
            %221 = tor.load %6[%220] on (0 to 0) {dump = "op_1335"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_42 = arith.constant {dump = "op_1336"} 6 : index
            %222 = arith.muli %arg4, %c6_42 {dump = "op_1337"} : index
            %223 = arith.addi %c4, %222 {dump = "op_1338"} : index
            %224 = tor.load %6[%223] on (0 to 0) {dump = "op_1339"} : !tor.memref<6144xf32, [], "rw">[index]
            %c6_43 = arith.constant {dump = "op_1340"} 6 : index
            %225 = arith.muli %arg4, %c6_43 {dump = "op_1341"} : index
            %226 = arith.addi %c5, %225 {dump = "op_1342"} : index
            %227 = tor.load %6[%226] on (0 to 0) {dump = "op_1343"} : !tor.memref<6144xf32, [], "rw">[index]
            %228 = arith.mulf %212, %cst_0 {"code-line" = 378 : i32, dump = "op_1344"} : f32
            %229 = arith.addf %194, %228 {dump = "op_1345"} : f32
            %230 = arith.mulf %215, %cst_0 {"code-line" = 378 : i32, dump = "op_1346"} : f32
            %231 = arith.addf %197, %230 {dump = "op_1347"} : f32
            %232 = arith.mulf %218, %cst_0 {"code-line" = 378 : i32, dump = "op_1348"} : f32
            %233 = arith.addf %200, %232 {dump = "op_1349"} : f32
            %234 = arith.mulf %221, %cst_0 {"code-line" = 378 : i32, dump = "op_1350"} : f32
            %235 = arith.addf %203, %234 {dump = "op_1351"} : f32
            %236 = arith.mulf %224, %cst_0 {"code-line" = 378 : i32, dump = "op_1352"} : f32
            %237 = arith.addf %206, %236 {dump = "op_1353"} : f32
            %238 = arith.mulf %227, %cst_0 {"code-line" = 378 : i32, dump = "op_1354"} : f32
            %239 = arith.addf %209, %238 {dump = "op_1355"} : f32
            %c6_44 = arith.constant {dump = "op_1356"} 6 : index
            %240 = arith.muli %arg4, %c6_44 {dump = "op_1357"} : index
            %241 = arith.addi %c0, %240 {dump = "op_1358"} : index
            %242 = tor.load %7[%241] on (0 to 0) {dump = "op_1359"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %242 to %4[%c0] on (0 to 0) {dump = "op_1360"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_45 = arith.constant {dump = "op_1361"} 6 : index
            %243 = arith.muli %arg4, %c6_45 {dump = "op_1362"} : index
            %244 = arith.addi %c1, %243 {dump = "op_1363"} : index
            %245 = tor.load %7[%244] on (0 to 0) {dump = "op_1364"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %245 to %4[%c1] on (0 to 0) {dump = "op_1365"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_46 = arith.constant {dump = "op_1366"} 6 : index
            %246 = arith.muli %arg4, %c6_46 {dump = "op_1367"} : index
            %247 = arith.addi %c2, %246 {dump = "op_1368"} : index
            %248 = tor.load %7[%247] on (0 to 0) {dump = "op_1369"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %248 to %4[%c2] on (0 to 0) {dump = "op_1370"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_47 = arith.constant {dump = "op_1371"} 6 : index
            %249 = arith.muli %arg4, %c6_47 {dump = "op_1372"} : index
            %250 = arith.addi %c3, %249 {dump = "op_1373"} : index
            %251 = tor.load %7[%250] on (0 to 0) {dump = "op_1374"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %251 to %4[%c3] on (0 to 0) {dump = "op_1375"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_48 = arith.constant {dump = "op_1376"} 6 : index
            %252 = arith.muli %arg4, %c6_48 {dump = "op_1377"} : index
            %253 = arith.addi %c4, %252 {dump = "op_1378"} : index
            %254 = tor.load %7[%253] on (0 to 0) {dump = "op_1379"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %254 to %4[%c4] on (0 to 0) {dump = "op_1380"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_49 = arith.constant {dump = "op_1381"} 6 : index
            %255 = arith.muli %arg4, %c6_49 {dump = "op_1382"} : index
            %256 = arith.addi %c5, %255 {dump = "op_1383"} : index
            %257 = tor.load %7[%256] on (0 to 0) {dump = "op_1384"} : !tor.memref<6144xf32, [], "rw">[index]
            tor.store %257 to %4[%c5] on (0 to 0) {dump = "op_1385"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %258 = arith.mulf %242, %cst_1 {"code-line" = 378 : i32, dump = "op_1386"} : f32
            %259 = arith.addf %229, %258 {dump = "op_1387"} : f32
            tor.store %259 to %3[%c0] on (0 to 0) {dump = "op_1388"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %260 = arith.mulf %245, %cst_1 {"code-line" = 378 : i32, dump = "op_1389"} : f32
            %261 = arith.addf %231, %260 {dump = "op_1390"} : f32
            tor.store %261 to %3[%c1] on (0 to 0) {dump = "op_1391"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %262 = arith.mulf %248, %cst_1 {"code-line" = 378 : i32, dump = "op_1392"} : f32
            %263 = arith.addf %233, %262 {dump = "op_1393"} : f32
            tor.store %263 to %3[%c2] on (0 to 0) {dump = "op_1394"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %264 = arith.mulf %251, %cst_1 {"code-line" = 378 : i32, dump = "op_1395"} : f32
            %265 = arith.addf %235, %264 {dump = "op_1396"} : f32
            tor.store %265 to %3[%c3] on (0 to 0) {dump = "op_1397"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %266 = arith.mulf %254, %cst_1 {"code-line" = 378 : i32, dump = "op_1398"} : f32
            %267 = arith.addf %237, %266 {dump = "op_1399"} : f32
            tor.store %267 to %3[%c4] on (0 to 0) {dump = "op_1400"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %268 = arith.mulf %257, %cst_1 {"code-line" = 378 : i32, dump = "op_1401"} : f32
            %269 = arith.addf %239, %268 {dump = "op_1402"} : f32
            tor.store %269 to %3[%c5] on (0 to 0) {dump = "op_1403"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } {dump = "op_1405"}
          %172 = arith.addi %arg0, %c-1 {dump = "op_1406"} : index
          %173 = arith.cmpi sge, %172, %c0 {dump = "op_1407"} : index
          scf.if %173 {
            %174 = tor.load %3[%c0] on (0 to 0) {dump = "op_1408"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %174 to %61 {dump = "op_1409"} : f32, <f32>
            %175 = tor.load %3[%c1] on (0 to 0) {dump = "op_1410"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %175 to %60 {dump = "op_1411"} : f32, <f32>
            %176 = tor.load %3[%c2] on (0 to 0) {dump = "op_1412"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %176 to %59 {dump = "op_1413"} : f32, <f32>
            %177 = tor.load %3[%c3] on (0 to 0) {dump = "op_1414"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %177 to %58 {dump = "op_1415"} : f32, <f32>
            %178 = tor.load %3[%c4] on (0 to 0) {dump = "op_1416"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %178 to %57 {dump = "op_1417"} : f32, <f32>
            %179 = tor.load %3[%c5] on (0 to 0) {dump = "op_1418"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %179 to %56 {dump = "op_1419"} : f32, <f32>
          } {dump = "op_1421"}
          scf.yield {dump = "op_1422"} %171, %165, %144 : i32, i32, i32
        } {II = 1 : i32, dump = "op_1423", pipeline = 1 : i32, "pipeline-line" = 334 : i32}
        scf.yield {dump = "op_1424"} %83#0, %83#1, %83#2 : i32, i32, i32
      } {dump = "op_1425"}
      tor.return {dump = "op_1426"}
    }
    tor.func @tensor_weight_x_7(...) attributes {clock = 6.000000e+00 : f32, dump = "op_1763", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c1023 = arith.constant {dump = "op_1428"} 1023 : index
      %c-1 = arith.constant {dump = "op_1429"} -1 : index
      %c5 = arith.constant {dump = "op_1430"} 5 : index
      %c4 = arith.constant {dump = "op_1431"} 4 : index
      %c3 = arith.constant {dump = "op_1432"} 3 : index
      %c2 = arith.constant {dump = "op_1433"} 2 : index
      %c1025 = arith.constant {dump = "op_1434"} 1025 : index
      %c1 = arith.constant {dump = "op_1435"} 1 : index
      %c436 = arith.constant {dump = "op_1436"} 436 : index
      %c0 = arith.constant {dump = "op_1437"} 0 : index
      %c-2 = arith.constant {dump = "op_1438"} -2 : index
      %c3_i32 = arith.constant {"code-line" = 444 : i32, dump = "op_1439"} 3 : i32
      %cst = arith.constant {dump = "op_1440"} 0.000000e+00 : f32
      %c6_i32 = arith.constant {"code-line" = 431 : i32, dump = "op_1441"} 6 : i32
      %c1024_i32 = arith.constant {"code-line" = 13 : i32, dump = "op_1442"} 1024 : i32
      %cst_0 = arith.constant {"code-line" = 409 : i32, dump = "op_1443"} 3.513000e-01 : f32
      %cst_1 = arith.constant {"code-line" = 409 : i32, dump = "op_1444"} 3.243000e-01 : f32
      %c0_i32 = arith.constant {dump = "op_1445"} 0 : i32
      %77:3 = scf.for %arg0 = %c0 to %c436 step %c1 iter_args(%arg1 = %c0_i32, %arg2 = %c0_i32, %arg3 = %c0_i32) -> (i32, i32, i32) {
        %78:3 = scf.for %arg4 = %c0 to %c1025 step %c1 iter_args(%arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) -> (i32, i32, i32) {
          %79 = arith.index_cast %arg4 {dump = "op_1446"} : index to i32
          %c6 = arith.constant {dump = "op_1447"} 6 : index
          %80 = arith.muli %c1, %c6 {dump = "op_1448"} : index
          %81 = arith.addi %c0, %80 {dump = "op_1449"} : index
          %82 = tor.load %2[%81] on (0 to 0) {dump = "op_1450"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_2 = arith.constant {dump = "op_1451"} 6 : index
          %83 = arith.muli %c0, %c6_2 {dump = "op_1452"} : index
          %84 = arith.addi %c0, %83 {dump = "op_1453"} : index
          tor.store %82 to %2[%84] on (0 to 0) {dump = "op_1454"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_3 = arith.constant {dump = "op_1455"} 6 : index
          %85 = arith.muli %c1, %c6_3 {dump = "op_1456"} : index
          %86 = arith.addi %c1, %85 {dump = "op_1457"} : index
          %87 = tor.load %2[%86] on (0 to 0) {dump = "op_1458"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_4 = arith.constant {dump = "op_1459"} 6 : index
          %88 = arith.muli %c0, %c6_4 {dump = "op_1460"} : index
          %89 = arith.addi %c1, %88 {dump = "op_1461"} : index
          tor.store %87 to %2[%89] on (0 to 0) {dump = "op_1462"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_5 = arith.constant {dump = "op_1463"} 6 : index
          %90 = arith.muli %c1, %c6_5 {dump = "op_1464"} : index
          %91 = arith.addi %c2, %90 {dump = "op_1465"} : index
          %92 = tor.load %2[%91] on (0 to 0) {dump = "op_1466"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_6 = arith.constant {dump = "op_1467"} 6 : index
          %93 = arith.muli %c0, %c6_6 {dump = "op_1468"} : index
          %94 = arith.addi %c2, %93 {dump = "op_1469"} : index
          tor.store %92 to %2[%94] on (0 to 0) {dump = "op_1470"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_7 = arith.constant {dump = "op_1471"} 6 : index
          %95 = arith.muli %c1, %c6_7 {dump = "op_1472"} : index
          %96 = arith.addi %c3, %95 {dump = "op_1473"} : index
          %97 = tor.load %2[%96] on (0 to 0) {dump = "op_1474"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_8 = arith.constant {dump = "op_1475"} 6 : index
          %98 = arith.muli %c0, %c6_8 {dump = "op_1476"} : index
          %99 = arith.addi %c3, %98 {dump = "op_1477"} : index
          tor.store %97 to %2[%99] on (0 to 0) {dump = "op_1478"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_9 = arith.constant {dump = "op_1479"} 6 : index
          %100 = arith.muli %c1, %c6_9 {dump = "op_1480"} : index
          %101 = arith.addi %c4, %100 {dump = "op_1481"} : index
          %102 = tor.load %2[%101] on (0 to 0) {dump = "op_1482"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_10 = arith.constant {dump = "op_1483"} 6 : index
          %103 = arith.muli %c0, %c6_10 {dump = "op_1484"} : index
          %104 = arith.addi %c4, %103 {dump = "op_1485"} : index
          tor.store %102 to %2[%104] on (0 to 0) {dump = "op_1486"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_11 = arith.constant {dump = "op_1487"} 6 : index
          %105 = arith.muli %c1, %c6_11 {dump = "op_1488"} : index
          %106 = arith.addi %c5, %105 {dump = "op_1489"} : index
          %107 = tor.load %2[%106] on (0 to 0) {dump = "op_1490"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_12 = arith.constant {dump = "op_1491"} 6 : index
          %108 = arith.muli %c0, %c6_12 {dump = "op_1492"} : index
          %109 = arith.addi %c5, %108 {dump = "op_1493"} : index
          tor.store %107 to %2[%109] on (0 to 0) {dump = "op_1494"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_13 = arith.constant {dump = "op_1495"} 6 : index
          %110 = arith.muli %c2, %c6_13 {dump = "op_1496"} : index
          %111 = arith.addi %c0, %110 {dump = "op_1497"} : index
          %112 = tor.load %2[%111] on (0 to 0) {dump = "op_1498"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_14 = arith.constant {dump = "op_1499"} 6 : index
          %113 = arith.muli %c1, %c6_14 {dump = "op_1500"} : index
          %114 = arith.addi %c0, %113 {dump = "op_1501"} : index
          tor.store %112 to %2[%114] on (0 to 0) {dump = "op_1502"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_15 = arith.constant {dump = "op_1503"} 6 : index
          %115 = arith.muli %c2, %c6_15 {dump = "op_1504"} : index
          %116 = arith.addi %c1, %115 {dump = "op_1505"} : index
          %117 = tor.load %2[%116] on (0 to 0) {dump = "op_1506"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_16 = arith.constant {dump = "op_1507"} 6 : index
          %118 = arith.muli %c1, %c6_16 {dump = "op_1508"} : index
          %119 = arith.addi %c1, %118 {dump = "op_1509"} : index
          tor.store %117 to %2[%119] on (0 to 0) {dump = "op_1510"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_17 = arith.constant {dump = "op_1511"} 6 : index
          %120 = arith.muli %c2, %c6_17 {dump = "op_1512"} : index
          %121 = arith.addi %c2, %120 {dump = "op_1513"} : index
          %122 = tor.load %2[%121] on (0 to 0) {dump = "op_1514"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_18 = arith.constant {dump = "op_1515"} 6 : index
          %123 = arith.muli %c1, %c6_18 {dump = "op_1516"} : index
          %124 = arith.addi %c2, %123 {dump = "op_1517"} : index
          tor.store %122 to %2[%124] on (0 to 0) {dump = "op_1518"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_19 = arith.constant {dump = "op_1519"} 6 : index
          %125 = arith.muli %c2, %c6_19 {dump = "op_1520"} : index
          %126 = arith.addi %c3, %125 {dump = "op_1521"} : index
          %127 = tor.load %2[%126] on (0 to 0) {dump = "op_1522"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_20 = arith.constant {dump = "op_1523"} 6 : index
          %128 = arith.muli %c1, %c6_20 {dump = "op_1524"} : index
          %129 = arith.addi %c3, %128 {dump = "op_1525"} : index
          tor.store %127 to %2[%129] on (0 to 0) {dump = "op_1526"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_21 = arith.constant {dump = "op_1527"} 6 : index
          %130 = arith.muli %c2, %c6_21 {dump = "op_1528"} : index
          %131 = arith.addi %c4, %130 {dump = "op_1529"} : index
          %132 = tor.load %2[%131] on (0 to 0) {dump = "op_1530"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_22 = arith.constant {dump = "op_1531"} 6 : index
          %133 = arith.muli %c1, %c6_22 {dump = "op_1532"} : index
          %134 = arith.addi %c4, %133 {dump = "op_1533"} : index
          tor.store %132 to %2[%134] on (0 to 0) {dump = "op_1534"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %c6_23 = arith.constant {dump = "op_1535"} 6 : index
          %135 = arith.muli %c2, %c6_23 {dump = "op_1536"} : index
          %136 = arith.addi %c5, %135 {dump = "op_1537"} : index
          %137 = tor.load %2[%136] on (0 to 0) {dump = "op_1538"} : !tor.memref<18xf32, [], "rw">[index]
          %c6_24 = arith.constant {dump = "op_1539"} 6 : index
          %138 = arith.muli %c1, %c6_24 {dump = "op_1540"} : index
          %139 = arith.addi %c5, %138 {dump = "op_1541"} : index
          tor.store %137 to %2[%139] on (0 to 0) {dump = "op_1542"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %140 = arith.cmpi slt, %79, %c1024_i32 {dump = "op_1543"} : i32
          %141 = arith.select %140, %arg7, %c6_i32 {dump = "op_1544"} : i32
          %142 = arith.subi %c1023, %arg4 {dump = "op_1545"} : index
          %143 = arith.cmpi sge, %142, %c0 {dump = "op_1546"} : index
          scf.if %143 {
            %174 = tor.stream_read %61 {dump = "op_1547"} : <f32> -> f32
            tor.store %174 to %1[%c0] on (0 to 0) {dump = "op_1548"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %175 = tor.stream_read %60 {dump = "op_1549"} : <f32> -> f32
            tor.store %175 to %1[%c1] on (0 to 0) {dump = "op_1550"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %176 = tor.stream_read %59 {dump = "op_1551"} : <f32> -> f32
            tor.store %176 to %1[%c2] on (0 to 0) {dump = "op_1552"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %177 = tor.stream_read %58 {dump = "op_1553"} : <f32> -> f32
            tor.store %177 to %1[%c3] on (0 to 0) {dump = "op_1554"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %178 = tor.stream_read %57 {dump = "op_1555"} : <f32> -> f32
            tor.store %178 to %1[%c4] on (0 to 0) {dump = "op_1556"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %179 = tor.stream_read %56 {dump = "op_1557"} : <f32> -> f32
            tor.store %179 to %1[%c5] on (0 to 0) {dump = "op_1558"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } else {
            tor.store %cst to %1[%c0] on (0 to 0) {dump = "op_1560"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %1[%c1] on (0 to 0) {dump = "op_1561"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %1[%c2] on (0 to 0) {dump = "op_1562"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %1[%c3] on (0 to 0) {dump = "op_1563"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %1[%c4] on (0 to 0) {dump = "op_1564"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            tor.store %cst to %1[%c5] on (0 to 0) {dump = "op_1565"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } {dump = "op_1567"}
          %144 = tor.load %1[%c0] on (0 to 0) {dump = "op_1568"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_25 = arith.constant {dump = "op_1569"} 6 : index
          %145 = arith.muli %c2, %c6_25 {dump = "op_1570"} : index
          %146 = arith.addi %c0, %145 {dump = "op_1571"} : index
          tor.store %144 to %2[%146] on (0 to 0) {dump = "op_1572"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %147 = tor.load %1[%c1] on (0 to 0) {dump = "op_1573"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_26 = arith.constant {dump = "op_1574"} 6 : index
          %148 = arith.muli %c2, %c6_26 {dump = "op_1575"} : index
          %149 = arith.addi %c1, %148 {dump = "op_1576"} : index
          tor.store %147 to %2[%149] on (0 to 0) {dump = "op_1577"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %150 = tor.load %1[%c2] on (0 to 0) {dump = "op_1578"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_27 = arith.constant {dump = "op_1579"} 6 : index
          %151 = arith.muli %c2, %c6_27 {dump = "op_1580"} : index
          %152 = arith.addi %c2, %151 {dump = "op_1581"} : index
          tor.store %150 to %2[%152] on (0 to 0) {dump = "op_1582"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %153 = tor.load %1[%c3] on (0 to 0) {dump = "op_1583"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_28 = arith.constant {dump = "op_1584"} 6 : index
          %154 = arith.muli %c2, %c6_28 {dump = "op_1585"} : index
          %155 = arith.addi %c3, %154 {dump = "op_1586"} : index
          tor.store %153 to %2[%155] on (0 to 0) {dump = "op_1587"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %156 = tor.load %1[%c4] on (0 to 0) {dump = "op_1588"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_29 = arith.constant {dump = "op_1589"} 6 : index
          %157 = arith.muli %c2, %c6_29 {dump = "op_1590"} : index
          %158 = arith.addi %c4, %157 {dump = "op_1591"} : index
          tor.store %156 to %2[%158] on (0 to 0) {dump = "op_1592"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          %159 = tor.load %1[%c5] on (0 to 0) {dump = "op_1593"} : !tor.memref<6xf32, [], "rw">[index]
          %c6_30 = arith.constant {dump = "op_1594"} 6 : index
          %160 = arith.muli %c2, %c6_30 {dump = "op_1595"} : index
          %161 = arith.addi %c5, %160 {dump = "op_1596"} : index
          tor.store %159 to %2[%161] on (0 to 0) {dump = "op_1597"} : (f32, !tor.memref<18xf32, [], "rw">[index])
          tor.store %cst to %0[%c0] on (0 to 0) {dump = "op_1598"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %0[%c1] on (0 to 0) {dump = "op_1599"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %0[%c2] on (0 to 0) {dump = "op_1600"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %0[%c3] on (0 to 0) {dump = "op_1601"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %0[%c4] on (0 to 0) {dump = "op_1602"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          tor.store %cst to %0[%c5] on (0 to 0) {dump = "op_1603"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          %162 = arith.addi %arg4, %c-2 {dump = "op_1604"} : index
          %163 = arith.cmpi sge, %162, %c0 {dump = "op_1605"} : index
          %164 = arith.andi %163, %140 {dump = "op_1606"} : i1
          %165 = arith.select %164, %c3_i32, %arg6 {dump = "op_1607"} : i32
          %166 = arith.addi %arg4, %c-2 {dump = "op_1608"} : index
          %167 = arith.cmpi sge, %166, %c0 {dump = "op_1609"} : index
          %168 = arith.subi %c1023, %arg4 {dump = "op_1610"} : index
          %169 = arith.cmpi sge, %168, %c0 {dump = "op_1611"} : index
          %170 = arith.andi %167, %169 {dump = "op_1612"} : i1
          %171 = arith.select %170, %c6_i32, %arg5 {dump = "op_1613"} : i32
          scf.if %170 {
            %c6_31 = arith.constant {dump = "op_1614"} 6 : index
            %174 = arith.muli %c0, %c6_31 {dump = "op_1615"} : index
            %175 = arith.addi %c0, %174 {dump = "op_1616"} : index
            %176 = tor.load %2[%175] on (0 to 0) {dump = "op_1617"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_32 = arith.constant {dump = "op_1618"} 6 : index
            %177 = arith.muli %c0, %c6_32 {dump = "op_1619"} : index
            %178 = arith.addi %c1, %177 {dump = "op_1620"} : index
            %179 = tor.load %2[%178] on (0 to 0) {dump = "op_1621"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_33 = arith.constant {dump = "op_1622"} 6 : index
            %180 = arith.muli %c0, %c6_33 {dump = "op_1623"} : index
            %181 = arith.addi %c2, %180 {dump = "op_1624"} : index
            %182 = tor.load %2[%181] on (0 to 0) {dump = "op_1625"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_34 = arith.constant {dump = "op_1626"} 6 : index
            %183 = arith.muli %c0, %c6_34 {dump = "op_1627"} : index
            %184 = arith.addi %c3, %183 {dump = "op_1628"} : index
            %185 = tor.load %2[%184] on (0 to 0) {dump = "op_1629"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_35 = arith.constant {dump = "op_1630"} 6 : index
            %186 = arith.muli %c0, %c6_35 {dump = "op_1631"} : index
            %187 = arith.addi %c4, %186 {dump = "op_1632"} : index
            %188 = tor.load %2[%187] on (0 to 0) {dump = "op_1633"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_36 = arith.constant {dump = "op_1634"} 6 : index
            %189 = arith.muli %c0, %c6_36 {dump = "op_1635"} : index
            %190 = arith.addi %c5, %189 {dump = "op_1636"} : index
            %191 = tor.load %2[%190] on (0 to 0) {dump = "op_1637"} : !tor.memref<18xf32, [], "rw">[index]
            %192 = arith.mulf %176, %cst_1 {"code-line" = 457 : i32, dump = "op_1638"} : f32
            %193 = tor.load %0[%c0] on (0 to 0) {dump = "op_1639"} : !tor.memref<6xf32, [], "rw">[index]
            %194 = arith.addf %193, %192 {dump = "op_1640"} : f32
            %195 = arith.mulf %179, %cst_1 {"code-line" = 457 : i32, dump = "op_1641"} : f32
            %196 = tor.load %0[%c1] on (0 to 0) {dump = "op_1642"} : !tor.memref<6xf32, [], "rw">[index]
            %197 = arith.addf %196, %195 {dump = "op_1643"} : f32
            %198 = arith.mulf %182, %cst_1 {"code-line" = 457 : i32, dump = "op_1644"} : f32
            %199 = tor.load %0[%c2] on (0 to 0) {dump = "op_1645"} : !tor.memref<6xf32, [], "rw">[index]
            %200 = arith.addf %199, %198 {dump = "op_1646"} : f32
            %201 = arith.mulf %185, %cst_1 {"code-line" = 457 : i32, dump = "op_1647"} : f32
            %202 = tor.load %0[%c3] on (0 to 0) {dump = "op_1648"} : !tor.memref<6xf32, [], "rw">[index]
            %203 = arith.addf %202, %201 {dump = "op_1649"} : f32
            %204 = arith.mulf %188, %cst_1 {"code-line" = 457 : i32, dump = "op_1650"} : f32
            %205 = tor.load %0[%c4] on (0 to 0) {dump = "op_1651"} : !tor.memref<6xf32, [], "rw">[index]
            %206 = arith.addf %205, %204 {dump = "op_1652"} : f32
            %207 = arith.mulf %191, %cst_1 {"code-line" = 457 : i32, dump = "op_1653"} : f32
            %208 = tor.load %0[%c5] on (0 to 0) {dump = "op_1654"} : !tor.memref<6xf32, [], "rw">[index]
            %209 = arith.addf %208, %207 {dump = "op_1655"} : f32
            %c6_37 = arith.constant {dump = "op_1656"} 6 : index
            %210 = arith.muli %c1, %c6_37 {dump = "op_1657"} : index
            %211 = arith.addi %c0, %210 {dump = "op_1658"} : index
            %212 = tor.load %2[%211] on (0 to 0) {dump = "op_1659"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_38 = arith.constant {dump = "op_1660"} 6 : index
            %213 = arith.muli %c1, %c6_38 {dump = "op_1661"} : index
            %214 = arith.addi %c1, %213 {dump = "op_1662"} : index
            %215 = tor.load %2[%214] on (0 to 0) {dump = "op_1663"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_39 = arith.constant {dump = "op_1664"} 6 : index
            %216 = arith.muli %c1, %c6_39 {dump = "op_1665"} : index
            %217 = arith.addi %c2, %216 {dump = "op_1666"} : index
            %218 = tor.load %2[%217] on (0 to 0) {dump = "op_1667"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_40 = arith.constant {dump = "op_1668"} 6 : index
            %219 = arith.muli %c1, %c6_40 {dump = "op_1669"} : index
            %220 = arith.addi %c3, %219 {dump = "op_1670"} : index
            %221 = tor.load %2[%220] on (0 to 0) {dump = "op_1671"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_41 = arith.constant {dump = "op_1672"} 6 : index
            %222 = arith.muli %c1, %c6_41 {dump = "op_1673"} : index
            %223 = arith.addi %c4, %222 {dump = "op_1674"} : index
            %224 = tor.load %2[%223] on (0 to 0) {dump = "op_1675"} : !tor.memref<18xf32, [], "rw">[index]
            %c6_42 = arith.constant {dump = "op_1676"} 6 : index
            %225 = arith.muli %c1, %c6_42 {dump = "op_1677"} : index
            %226 = arith.addi %c5, %225 {dump = "op_1678"} : index
            %227 = tor.load %2[%226] on (0 to 0) {dump = "op_1679"} : !tor.memref<18xf32, [], "rw">[index]
            %228 = arith.mulf %212, %cst_0 {"code-line" = 457 : i32, dump = "op_1680"} : f32
            %229 = arith.addf %194, %228 {dump = "op_1681"} : f32
            %230 = arith.mulf %215, %cst_0 {"code-line" = 457 : i32, dump = "op_1682"} : f32
            %231 = arith.addf %197, %230 {dump = "op_1683"} : f32
            %232 = arith.mulf %218, %cst_0 {"code-line" = 457 : i32, dump = "op_1684"} : f32
            %233 = arith.addf %200, %232 {dump = "op_1685"} : f32
            %234 = arith.mulf %221, %cst_0 {"code-line" = 457 : i32, dump = "op_1686"} : f32
            %235 = arith.addf %203, %234 {dump = "op_1687"} : f32
            %236 = arith.mulf %224, %cst_0 {"code-line" = 457 : i32, dump = "op_1688"} : f32
            %237 = arith.addf %206, %236 {dump = "op_1689"} : f32
            %238 = arith.mulf %227, %cst_0 {"code-line" = 457 : i32, dump = "op_1690"} : f32
            %239 = arith.addf %209, %238 {dump = "op_1691"} : f32
            %c6_43 = arith.constant {dump = "op_1692"} 6 : index
            %240 = arith.muli %c2, %c6_43 {dump = "op_1693"} : index
            %241 = arith.addi %c0, %240 {dump = "op_1694"} : index
            %242 = tor.load %2[%241] on (0 to 0) {dump = "op_1695"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %242 to %1[%c0] on (0 to 0) {dump = "op_1696"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_44 = arith.constant {dump = "op_1697"} 6 : index
            %243 = arith.muli %c2, %c6_44 {dump = "op_1698"} : index
            %244 = arith.addi %c1, %243 {dump = "op_1699"} : index
            %245 = tor.load %2[%244] on (0 to 0) {dump = "op_1700"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %245 to %1[%c1] on (0 to 0) {dump = "op_1701"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_45 = arith.constant {dump = "op_1702"} 6 : index
            %246 = arith.muli %c2, %c6_45 {dump = "op_1703"} : index
            %247 = arith.addi %c2, %246 {dump = "op_1704"} : index
            %248 = tor.load %2[%247] on (0 to 0) {dump = "op_1705"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %248 to %1[%c2] on (0 to 0) {dump = "op_1706"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_46 = arith.constant {dump = "op_1707"} 6 : index
            %249 = arith.muli %c2, %c6_46 {dump = "op_1708"} : index
            %250 = arith.addi %c3, %249 {dump = "op_1709"} : index
            %251 = tor.load %2[%250] on (0 to 0) {dump = "op_1710"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %251 to %1[%c3] on (0 to 0) {dump = "op_1711"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_47 = arith.constant {dump = "op_1712"} 6 : index
            %252 = arith.muli %c2, %c6_47 {dump = "op_1713"} : index
            %253 = arith.addi %c4, %252 {dump = "op_1714"} : index
            %254 = tor.load %2[%253] on (0 to 0) {dump = "op_1715"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %254 to %1[%c4] on (0 to 0) {dump = "op_1716"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %c6_48 = arith.constant {dump = "op_1717"} 6 : index
            %255 = arith.muli %c2, %c6_48 {dump = "op_1718"} : index
            %256 = arith.addi %c5, %255 {dump = "op_1719"} : index
            %257 = tor.load %2[%256] on (0 to 0) {dump = "op_1720"} : !tor.memref<18xf32, [], "rw">[index]
            tor.store %257 to %1[%c5] on (0 to 0) {dump = "op_1721"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %258 = arith.mulf %242, %cst_1 {"code-line" = 457 : i32, dump = "op_1722"} : f32
            %259 = arith.addf %229, %258 {dump = "op_1723"} : f32
            tor.store %259 to %0[%c0] on (0 to 0) {dump = "op_1724"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %260 = arith.mulf %245, %cst_1 {"code-line" = 457 : i32, dump = "op_1725"} : f32
            %261 = arith.addf %231, %260 {dump = "op_1726"} : f32
            tor.store %261 to %0[%c1] on (0 to 0) {dump = "op_1727"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %262 = arith.mulf %248, %cst_1 {"code-line" = 457 : i32, dump = "op_1728"} : f32
            %263 = arith.addf %233, %262 {dump = "op_1729"} : f32
            tor.store %263 to %0[%c2] on (0 to 0) {dump = "op_1730"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %264 = arith.mulf %251, %cst_1 {"code-line" = 457 : i32, dump = "op_1731"} : f32
            %265 = arith.addf %235, %264 {dump = "op_1732"} : f32
            tor.store %265 to %0[%c3] on (0 to 0) {dump = "op_1733"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %266 = arith.mulf %254, %cst_1 {"code-line" = 457 : i32, dump = "op_1734"} : f32
            %267 = arith.addf %237, %266 {dump = "op_1735"} : f32
            tor.store %267 to %0[%c4] on (0 to 0) {dump = "op_1736"} : (f32, !tor.memref<6xf32, [], "rw">[index])
            %268 = arith.mulf %257, %cst_1 {"code-line" = 457 : i32, dump = "op_1737"} : f32
            %269 = arith.addf %239, %268 {dump = "op_1738"} : f32
            tor.store %269 to %0[%c5] on (0 to 0) {dump = "op_1739"} : (f32, !tor.memref<6xf32, [], "rw">[index])
          } {dump = "op_1741"}
          %172 = arith.addi %arg4, %c-1 {dump = "op_1742"} : index
          %173 = arith.cmpi sge, %172, %c0 {dump = "op_1743"} : index
          scf.if %173 {
            %174 = tor.load %0[%c0] on (0 to 0) {dump = "op_1744"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %174 to %55 {dump = "op_1745"} : f32, <f32>
            %175 = tor.load %0[%c1] on (0 to 0) {dump = "op_1746"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %175 to %54 {dump = "op_1747"} : f32, <f32>
            %176 = tor.load %0[%c2] on (0 to 0) {dump = "op_1748"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %176 to %53 {dump = "op_1749"} : f32, <f32>
            %177 = tor.load %0[%c3] on (0 to 0) {dump = "op_1750"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %177 to %52 {dump = "op_1751"} : f32, <f32>
            %178 = tor.load %0[%c4] on (0 to 0) {dump = "op_1752"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %178 to %51 {dump = "op_1753"} : f32, <f32>
            %179 = tor.load %0[%c5] on (0 to 0) {dump = "op_1754"} : !tor.memref<6xf32, [], "rw">[index]
            tor.stream_write %179 to %50 {dump = "op_1755"} : f32, <f32>
          } {dump = "op_1757"}
          scf.yield {dump = "op_1758"} %171, %165, %141 : i32, i32, i32
        } {II = 1 : i32, dump = "op_1759", pipeline = 1 : i32, "pipeline-line" = 416 : i32}
        scf.yield {dump = "op_1760"} %78#0, %78#1, %78#2 : i32, i32, i32
      } {dump = "op_1761"}
      tor.return {dump = "op_1762"}
    }
    tor.func @flow_calc_8(...) attributes {clock = 6.000000e+00 : f32, dump = "op_1841", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c1024 = arith.constant {dump = "op_1764"} 1024 : index
      %c-2 = arith.constant {dump = "op_1765"} -2 : index
      %cst = arith.constant {dump = "op_1766"} 0.000000e+00 : f32
      %cst_0 = arith.constant {dump = "op_1767"} 0.000000e+00 : f64
      %c1022_i32 = arith.constant {dump = "op_1768"} 1022 : i32
      %false = arith.constant {dump = "op_1769"} false
      %c434_i32 = arith.constant {dump = "op_1770"} 434 : i32
      %c2_i32 = arith.constant {"code-line" = 498 : i32, dump = "op_1771"} 2 : i32
      %c0 = arith.constant {dump = "op_1772"} 0 : index
      %c436 = arith.constant {dump = "op_1773"} 436 : index
      %c1 = arith.constant {dump = "op_1774"} 1 : index
      scf.for %arg0 = %c0 to %c436 step %c1 {
        %77 = arith.index_cast %arg0 {dump = "op_1775"} : index to i32
        %78 = arith.addi %arg0, %c-2 {dump = "op_1776"} : index
        %79 = arith.cmpi sge, %78, %c0 {dump = "op_1777"} : index
        %80 = scf.if %79 -> (i1) {
          %81 = arith.cmpi slt, %77, %c434_i32 {dump = "op_1778"} : i32
          scf.yield {dump = "op_1779"} %81 : i1
        } else {
          scf.yield {dump = "op_1780"} %false : i1
        } {dump = "op_1781"}
        scf.for %arg1 = %c0 to %c1024 step %c1 {
          %81 = arith.index_cast %arg1 {dump = "op_1782"} : index to i32
          %82 = tor.stream_read %55 {dump = "op_1783"} : <f32> -> f32
          %83 = tor.stream_read %54 {dump = "op_1784"} : <f32> -> f32
          %84 = tor.stream_read %53 {dump = "op_1785"} : <f32> -> f32
          %85 = tor.stream_read %52 {dump = "op_1786"} : <f32> -> f32
          %86 = tor.stream_read %51 {dump = "op_1787"} : <f32> -> f32
          %87 = tor.stream_read %50 {dump = "op_1788"} : <f32> -> f32
          %88 = scf.if %80 -> (i1) {
            %99 = arith.cmpi sge, %81, %c2_i32 {dump = "op_1789"} : i32
            scf.yield {dump = "op_1790"} %99 : i1
          } else {
            scf.yield {dump = "op_1791"} %false : i1
          } {dump = "op_1792"}
          %89 = scf.if %88 -> (i1) {
            %99 = arith.cmpi slt, %81, %c1022_i32 {dump = "op_1793"} : i32
            scf.yield {dump = "op_1794"} %99 : i1
          } else {
            scf.yield {dump = "op_1795"} %false : i1
          } {dump = "op_1796"}
          %90:2 = scf.if %89 -> (f32, f32) {
            %99 = arith.extf %82 {"code-line" = 500 : i32, dump = "op_1797"} : f32 to f64
            %100 = arith.extf %83 {"code-line" = 501 : i32, dump = "op_1798"} : f32 to f64
            %101 = arith.extf %85 {"code-line" = 503 : i32, dump = "op_1799"} : f32 to f64
            %102 = arith.extf %86 {"code-line" = 504 : i32, dump = "op_1800"} : f32 to f64
            %103 = arith.extf %87 {"code-line" = 505 : i32, dump = "op_1801"} : f32 to f64
            %104 = arith.mulf %99, %100 {"code-line" = 507 : i32, dump = "op_1802"} : f64
            %105 = arith.mulf %101, %101 {"code-line" = 507 : i32, dump = "op_1803"} : f64
            %106 = arith.subf %104, %105 {"code-line" = 507 : i32, dump = "op_1804"} : f64
            %107 = arith.mulf %103, %101 {"code-line" = 508 : i32, dump = "op_1805"} : f64
            %108 = arith.mulf %102, %100 {"code-line" = 508 : i32, dump = "op_1806"} : f64
            %109 = arith.subf %107, %108 {"code-line" = 508 : i32, dump = "op_1807"} : f64
            %110 = arith.mulf %102, %101 {"code-line" = 509 : i32, dump = "op_1808"} : f64
            %111 = arith.mulf %103, %99 {"code-line" = 509 : i32, dump = "op_1809"} : f64
            %112 = arith.subf %110, %111 {"code-line" = 509 : i32, dump = "op_1810"} : f64
            %113 = arith.cmpf une, %106, %cst_0 {dump = "op_1811"} : f64
            %114:2 = scf.if %113 -> (f32, f32) {
              %115 = arith.divf %109, %106 {"code-line" = 513 : i32, dump = "op_1812"} : f64
              %116 = arith.truncf %115 {"code-line" = 513 : i32, dump = "op_1813"} : f64 to f32
              %117 = arith.divf %112, %106 {"code-line" = 514 : i32, dump = "op_1814"} : f64
              %118 = arith.truncf %117 {"code-line" = 514 : i32, dump = "op_1815"} : f64 to f32
              scf.yield {dump = "op_1816"} %116, %118 : f32, f32
            } else {
              scf.yield {dump = "op_1817"} %cst, %cst : f32, f32
            } {dump = "op_1818"}
            scf.yield {dump = "op_1819"} %114#0, %114#1 : f32, f32
          } else {
            scf.yield {dump = "op_1820"} %cst, %cst : f32, f32
          } {dump = "op_1821"}
          %c10 = arith.constant {dump = "op_1822"} 10 : index
          %91 = arith.shli %arg0, %c10 {dump = "op_1823"} : index
          %92 = arith.addi %arg1, %91 {dump = "op_1824"} : index
          %c1_1 = arith.constant {dump = "op_1825"} 1 : index
          %93 = arith.shli %92, %c1_1 {dump = "op_1826"} : index
          %94 = arith.addi %c0, %93 {dump = "op_1827"} : index
          tor.store %90#0 to %43[%94] on (0 to 0) {dump = "op_1828"} : (f32, !tor.memref<892928xf32, [], "w">[index])
          %c10_2 = arith.constant {dump = "op_1829"} 10 : index
          %95 = arith.shli %arg0, %c10_2 {dump = "op_1830"} : index
          %96 = arith.addi %arg1, %95 {dump = "op_1831"} : index
          %c1_3 = arith.constant {dump = "op_1832"} 1 : index
          %97 = arith.shli %96, %c1_3 {dump = "op_1833"} : index
          %98 = arith.addi %c1, %97 {dump = "op_1834"} : index
          tor.store %90#1 to %43[%98] on (0 to 0) {dump = "op_1835"} : (f32, !tor.memref<892928xf32, [], "w">[index])
        } {II = 1 : i32, dump = "op_1837", pipeline = 1 : i32, "pipeline-line" = 490 : i32}
      } {dump = "op_1839"}
      tor.return {dump = "op_1840"}
    }
    tor.func @main(...) attributes {clock = 6.000000e+00 : f32, dataflow = 1 : i32, dump = "op_1902", resource = "/home/ruifan/wuxi/hector/demo/resource.json"} {
      %c1024 = arith.constant {dump = "op_1842"} 1024 : index
      %c1 = arith.constant {dump = "op_1843"} 1 : index
      %c436 = arith.constant {dump = "op_1844"} 436 : index
      %c0 = arith.constant {dump = "op_1845"} 0 : index
      %c32_i64 = arith.constant {dump = "op_1846"} 32 : i64
      %c1095216660480_i64 = arith.constant {"code-line" = 601 : i32, dump = "op_1847"} 1095216660480 : i64
      %c24_i64 = arith.constant {dump = "op_1848"} 24 : i64
      %c4278190080_i64 = arith.constant {"code-line" = 600 : i32, dump = "op_1849"} 4278190080 : i64
      %c16_i64 = arith.constant {dump = "op_1850"} 16 : i64
      %c16711680_i64 = arith.constant {"code-line" = 598 : i32, dump = "op_1851"} 16711680 : i64
      %c8_i64 = arith.constant {dump = "op_1852"} 8 : i64
      %c65280_i64 = arith.constant {"code-line" = 597 : i32, dump = "op_1853"} 65280 : i64
      %cst = arith.constant {dump = "op_1854"} 2.560000e+02 : f32
      %c255_i64 = arith.constant {"code-line" = 596 : i32, dump = "op_1855"} 255 : i64
      scf.for %arg0 = %c0 to %c436 step %c1 {
        scf.for %arg1 = %c0 to %c1024 step %c1 {
          %c10 = arith.constant {dump = "op_1856"} 10 : index
          %77 = arith.shli %arg0, %c10 {dump = "op_1857"} : index
          %78 = arith.addi %arg1, %77 {dump = "op_1858"} : index
          %79 = tor.load %42[%78] on (0 to 0) {dump = "op_1859"} : !tor.memref<446464xi64, [], "r">[index]
          %80 = arith.andi %79, %c255_i64 {"code-line" = 596 : i32, dump = "op_1860"} : i64
          %81 = arith.sitofp %80 {"code-line" = 596 : i32, dump = "op_1861"} : i64 to f32
          %82 = arith.divf %81, %cst {"code-line" = 596 : i32, dump = "op_1862"} : f32
          tor.stream_write %82 to %49 {dump = "op_1863"} : f32, <f32>
          %83 = arith.andi %79, %c65280_i64 {"code-line" = 597 : i32, dump = "op_1864"} : i64
          %84 = arith.shrsi %83, %c8_i64 {"code-line" = 597 : i32, dump = "op_1865"} : i64
          %85 = arith.sitofp %84 {"code-line" = 597 : i32, dump = "op_1866"} : i64 to f32
          %86 = arith.divf %85, %cst {"code-line" = 597 : i32, dump = "op_1867"} : f32
          tor.stream_write %86 to %48 {dump = "op_1868"} : f32, <f32>
          %87 = arith.andi %79, %c16711680_i64 {"code-line" = 598 : i32, dump = "op_1869"} : i64
          %88 = arith.shrsi %87, %c16_i64 {"code-line" = 598 : i32, dump = "op_1870"} : i64
          %89 = arith.sitofp %88 {"code-line" = 598 : i32, dump = "op_1871"} : i64 to f32
          %90 = arith.divf %89, %cst {"code-line" = 598 : i32, dump = "op_1872"} : f32
          tor.stream_write %90 to %45 {dump = "op_1873"} : f32, <f32>
          %91 = arith.andi %79, %c16711680_i64 {"code-line" = 599 : i32, dump = "op_1874"} : i64
          %92 = arith.shrsi %91, %c16_i64 {"code-line" = 599 : i32, dump = "op_1875"} : i64
          %93 = arith.sitofp %92 {"code-line" = 599 : i32, dump = "op_1876"} : i64 to f32
          %94 = arith.divf %93, %cst {"code-line" = 599 : i32, dump = "op_1877"} : f32
          tor.stream_write %94 to %44 {dump = "op_1878"} : f32, <f32>
          %95 = arith.andi %79, %c4278190080_i64 {"code-line" = 600 : i32, dump = "op_1879"} : i64
          %96 = arith.shrsi %95, %c24_i64 {"code-line" = 600 : i32, dump = "op_1880"} : i64
          %97 = arith.sitofp %96 {"code-line" = 600 : i32, dump = "op_1881"} : i64 to f32
          %98 = arith.divf %97, %cst {"code-line" = 600 : i32, dump = "op_1882"} : f32
          tor.stream_write %98 to %47 {dump = "op_1883"} : f32, <f32>
          %99 = arith.andi %79, %c1095216660480_i64 {"code-line" = 601 : i32, dump = "op_1884"} : i64
          %100 = arith.shrsi %99, %c32_i64 {"code-line" = 601 : i32, dump = "op_1885"} : i64
          %101 = arith.sitofp %100 {"code-line" = 601 : i32, dump = "op_1886"} : i64 to f32
          %102 = arith.divf %101, %cst {"code-line" = 601 : i32, dump = "op_1887"} : f32
          tor.stream_write %102 to %46 {dump = "op_1888"} : f32, <f32>
        } {II = 1 : i32, dump = "op_1890", pipeline = 1 : i32, "pipeline-line" = 591 : i32}
      } {dump = "op_1892"}
      tor.call @gradient_xy_calc_1() on (0 to 0) {dump = "op_1893"} : () -> ()
      tor.call @gradient_z_calc_2() on (0 to 0) {dump = "op_1894"} : () -> ()
      tor.call @gradient_weight_y_3() on (0 to 0) {dump = "op_1895"} : () -> ()
      tor.call @gradient_weight_x_4() on (0 to 0) {dump = "op_1896"} : () -> ()
      tor.call @outer_product_5() on (0 to 0) {dump = "op_1897"} : () -> ()
      tor.call @tensor_weight_y_6() on (0 to 0) {dump = "op_1898"} : () -> ()
      tor.call @tensor_weight_x_7() on (0 to 0) {dump = "op_1899"} : () -> ()
      tor.call @flow_calc_8() on (0 to 0) {dump = "op_1900"} : () -> ()
      tor.return {dump = "op_1901"}
    }
  } {dump = "op_1903", "flatten-array" = 1 : i32}
}

