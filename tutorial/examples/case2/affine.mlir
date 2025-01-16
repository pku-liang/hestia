#map = affine_map<(d0) -> (d0 + 1)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @kernel_syr2k(%arg0: memref<16x16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16x16xi32>) attributes {"code-line" = 4 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c34_i32 = arith.constant {"code-line" = 7 : i32} 34 : i32
    %c12_i32 = arith.constant {"code-line" = 6 : i32} 12 : i32
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to #map(%arg3) {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<16x16xi32>
        %1 = arith.muli %0, %c34_i32 : i32
        affine.store %1, %arg0[%arg3, %arg4] : memref<16x16xi32>
      }
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to #map(%arg3) {
          %0 = affine.load %arg1[%arg5, %arg4] : memref<16x16xi32>
          %1 = arith.muli %0, %c12_i32 {"code-line" = 23 : i32} : i32
          %2 = affine.load %arg2[%arg3, %arg4] : memref<16x16xi32>
          %3 = arith.muli %1, %2 {"code-line" = 23 : i32} : i32
          %4 = affine.load %arg2[%arg5, %arg4] : memref<16x16xi32>
          %5 = arith.muli %4, %c12_i32 {"code-line" = 23 : i32} : i32
          %6 = affine.load %arg1[%arg3, %arg4] : memref<16x16xi32>
          %7 = arith.muli %5, %6 {"code-line" = 23 : i32} : i32
          %8 = arith.addi %3, %7 {"code-line" = 23 : i32} : i32
          %9 = affine.load %arg0[%arg3, %arg5] : memref<16x16xi32>
          %10 = arith.addi %9, %8 : i32
          affine.store %10, %arg0[%arg3, %arg5] : memref<16x16xi32>
        }
      }
    }
    return
  }
}
