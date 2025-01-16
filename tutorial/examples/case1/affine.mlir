module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @kernel_2mm(%arg0: memref<64x1xi32>, %arg1: memref<1x32xi32>, %arg2: memref<32x16xi32>, %arg3: memref<64x16xi32>, %arg4: memref<64x32xi32>) attributes {"code-line" = 8 : i32, llvm.linkage = #llvm.linkage<external>, partition_cyclic_array_4 = [1 : i32], partition_dim_array_4 = [1 : i32], partition_factor_array_4 = [4 : i32], var_name_4 = "tmp"} {
    %c0_i32 = arith.constant {"code-line" = 16 : i32} 0 : i32
    %c7_i32 = arith.constant {"code-line" = 11 : i32} 7 : i32
    %c6_i32 = arith.constant {"code-line" = 11 : i32} 6 : i32
    affine.for %arg5 = 0 to 64 {
      affine.for %arg6 = 0 to 32 {
        affine.store %c0_i32, %arg4[%arg5, %arg6] {"code-line" = 16 : i32} : memref<64x32xi32>
        %0 = affine.load %arg0[%arg5, 0] {"code-line" = 19 : i32} : memref<64x1xi32>
        %1 = arith.muli %0, %c6_i32 {"code-line" = 19 : i32} : i32
        %2 = affine.load %arg1[0, %arg6] {"code-line" = 19 : i32} : memref<1x32xi32>
        %3 = arith.muli %1, %2 {"code-line" = 19 : i32} : i32
        affine.store %3, %arg4[%arg5, %arg6] {"code-line" = 19 : i32} : memref<64x32xi32>
      } {"code-line" = 14 : i32, unroll = 4 : i32, "unroll-line" = 15 : i32}
    } {"code-line" = 13 : i32}
    affine.for %arg5 = 0 to 64 {
      affine.for %arg6 = 0 to 16 {
        %0 = affine.load %arg3[%arg5, %arg6] {"code-line" = 24 : i32} : memref<64x16xi32>
        %1 = arith.muli %0, %c7_i32 {"code-line" = 24 : i32} : i32
        affine.store %1, %arg3[%arg5, %arg6] {"code-line" = 24 : i32} : memref<64x16xi32>
        affine.for %arg7 = 0 to 32 {
          %2 = affine.load %arg4[%arg5, %arg7] {"code-line" = 27 : i32} : memref<64x32xi32>
          %3 = affine.load %arg2[%arg7, %arg6] {"code-line" = 27 : i32} : memref<32x16xi32>
          %4 = arith.muli %2, %3 {"code-line" = 27 : i32} : i32
          %5 = affine.load %arg3[%arg5, %arg6] {"code-line" = 27 : i32} : memref<64x16xi32>
          %6 = arith.addi %5, %4 {"code-line" = 27 : i32} : i32
          affine.store %6, %arg3[%arg5, %arg6] {"code-line" = 27 : i32} : memref<64x16xi32>
        } {"code-line" = 25 : i32, unroll = 4 : i32, "unroll-line" = 26 : i32}
      } {"code-line" = 23 : i32}
    } {"code-line" = 22 : i32}
    return
  }
}
