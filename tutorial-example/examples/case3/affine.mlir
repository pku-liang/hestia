#set = affine_set<(d0) : (d0 - 4 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 435 >= 0)>
#set2 = affine_set<(d0) : (-d0 + 1023 >= 0)>
#set3 = affine_set<(d0) : (d0 - 2 >= 0)>
#set4 = affine_set<(d0) : (d0 - 6 >= 0, -d0 + 435 >= 0)>
#set5 = affine_set<(d0) : (d0 - 3 >= 0)>
#set6 = affine_set<(d0) : (d0 - 6 >= 0, -d0 + 1023 >= 0)>
#set7 = affine_set<(d0) : (d0 - 2 >= 0, -d0 + 435 >= 0)>
#set8 = affine_set<(d0) : (d0 - 1 >= 0)>
#set9 = affine_set<(d0) : (d0 - 2 >= 0, -d0 + 1023 >= 0)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @optical_flow(%arg0: memref<436x1024xi64>, %arg1: memref<436x1024x2xf32>) attributes {"code-line" = 535 : i32, dataflow = 1 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c32_i64 = arith.constant 32 : i64
    %c1095216660480_i64 = arith.constant {"code-line" = 601 : i32} 1095216660480 : i64
    %c24_i64 = arith.constant 24 : i64
    %c4278190080_i64 = arith.constant {"code-line" = 600 : i32} 4278190080 : i64
    %c16_i64 = arith.constant 16 : i64
    %c16711680_i64 = arith.constant {"code-line" = 598 : i32} 16711680 : i64
    %c8_i64 = arith.constant 8 : i64
    %c65280_i64 = arith.constant {"code-line" = 597 : i32} 65280 : i64
    %cst = arith.constant 2.560000e+02 : f32
    %c255_i64 = arith.constant {"code-line" = 596 : i32} 255 : i64
    %alloca = memref.alloca() {"code-line" = 581 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame3_b"} : memref<1x!llvm.struct<(i8)>>
    %cast = memref.cast %alloca {"code-line" = 581 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_0 = memref.alloca() {"code-line" = 580 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame3_a"} : memref<1x!llvm.struct<(i8)>>
    %cast_1 = memref.cast %alloca_0 {"code-line" = 580 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_2 = memref.alloca() {"code-line" = 577 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame5_a"} : memref<1x!llvm.struct<(i8)>>
    %cast_3 = memref.cast %alloca_2 {"code-line" = 577 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_4 = memref.alloca() {"code-line" = 576 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame4_a"} : memref<1x!llvm.struct<(i8)>>
    %cast_5 = memref.cast %alloca_4 {"code-line" = 576 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_6 = memref.alloca() {"code-line" = 575 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame2_a"} : memref<1x!llvm.struct<(i8)>>
    %cast_7 = memref.cast %alloca_6 {"code-line" = 575 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_8 = memref.alloca() {"code-line" = 574 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "frame1_a"} : memref<1x!llvm.struct<(i8)>>
    %cast_9 = memref.cast %alloca_8 {"code-line" = 574 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_10 = memref.alloca() {"code-line" = 571 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_5"} : memref<1x!llvm.struct<(i8)>>
    %cast_11 = memref.cast %alloca_10 {"code-line" = 571 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_12 = memref.alloca() {"code-line" = 570 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_4"} : memref<1x!llvm.struct<(i8)>>
    %cast_13 = memref.cast %alloca_12 {"code-line" = 570 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_14 = memref.alloca() {"code-line" = 569 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_3"} : memref<1x!llvm.struct<(i8)>>
    %cast_15 = memref.cast %alloca_14 {"code-line" = 569 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_16 = memref.alloca() {"code-line" = 568 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_2"} : memref<1x!llvm.struct<(i8)>>
    %cast_17 = memref.cast %alloca_16 {"code-line" = 568 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_18 = memref.alloca() {"code-line" = 567 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_1"} : memref<1x!llvm.struct<(i8)>>
    %cast_19 = memref.cast %alloca_18 {"code-line" = 567 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_20 = memref.alloca() {"code-line" = 566 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_0"} : memref<1x!llvm.struct<(i8)>>
    %cast_21 = memref.cast %alloca_20 {"code-line" = 566 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_22 = memref.alloca() {"code-line" = 564 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_5"} : memref<1x!llvm.struct<(i8)>>
    %cast_23 = memref.cast %alloca_22 {"code-line" = 564 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_24 = memref.alloca() {"code-line" = 563 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_4"} : memref<1x!llvm.struct<(i8)>>
    %cast_25 = memref.cast %alloca_24 {"code-line" = 563 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_26 = memref.alloca() {"code-line" = 562 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_3"} : memref<1x!llvm.struct<(i8)>>
    %cast_27 = memref.cast %alloca_26 {"code-line" = 562 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_28 = memref.alloca() {"code-line" = 561 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_2"} : memref<1x!llvm.struct<(i8)>>
    %cast_29 = memref.cast %alloca_28 {"code-line" = 561 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_30 = memref.alloca() {"code-line" = 560 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_1"} : memref<1x!llvm.struct<(i8)>>
    %cast_31 = memref.cast %alloca_30 {"code-line" = 560 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_32 = memref.alloca() {"code-line" = 559 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "tensor_y_0"} : memref<1x!llvm.struct<(i8)>>
    %cast_33 = memref.cast %alloca_32 {"code-line" = 559 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_34 = memref.alloca() {"code-line" = 557 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_5"} : memref<1x!llvm.struct<(i8)>>
    %cast_35 = memref.cast %alloca_34 {"code-line" = 557 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_36 = memref.alloca() {"code-line" = 556 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_4"} : memref<1x!llvm.struct<(i8)>>
    %cast_37 = memref.cast %alloca_36 {"code-line" = 556 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_38 = memref.alloca() {"code-line" = 555 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_3"} : memref<1x!llvm.struct<(i8)>>
    %cast_39 = memref.cast %alloca_38 {"code-line" = 555 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_40 = memref.alloca() {"code-line" = 554 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_2"} : memref<1x!llvm.struct<(i8)>>
    %cast_41 = memref.cast %alloca_40 {"code-line" = 554 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_42 = memref.alloca() {"code-line" = 553 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_1"} : memref<1x!llvm.struct<(i8)>>
    %cast_43 = memref.cast %alloca_42 {"code-line" = 553 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_44 = memref.alloca() {"code-line" = 552 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "out_product_0"} : memref<1x!llvm.struct<(i8)>>
    %cast_45 = memref.cast %alloca_44 {"code-line" = 552 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_46 = memref.alloca() {"code-line" = 550 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "filtered_gradient_z"} : memref<1x!llvm.struct<(i8)>>
    %cast_47 = memref.cast %alloca_46 {"code-line" = 550 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_48 = memref.alloca() {"code-line" = 549 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "filtered_gradient_y"} : memref<1x!llvm.struct<(i8)>>
    %cast_49 = memref.cast %alloca_48 {"code-line" = 549 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_50 = memref.alloca() {"code-line" = 548 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "filtered_gradient_x"} : memref<1x!llvm.struct<(i8)>>
    %cast_51 = memref.cast %alloca_50 {"code-line" = 548 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_52 = memref.alloca() {"code-line" = 546 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "y_filtered_z"} : memref<1x!llvm.struct<(i8)>>
    %cast_53 = memref.cast %alloca_52 {"code-line" = 546 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_54 = memref.alloca() {"code-line" = 545 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "y_filtered_y"} : memref<1x!llvm.struct<(i8)>>
    %cast_55 = memref.cast %alloca_54 {"code-line" = 545 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_56 = memref.alloca() {"code-line" = 544 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "y_filtered_x"} : memref<1x!llvm.struct<(i8)>>
    %cast_57 = memref.cast %alloca_56 {"code-line" = 544 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_58 = memref.alloca() {"code-line" = 542 : i32, dataflow = "struct hls::stream<float, 4096>", var_name = "gradient_z"} : memref<1x!llvm.struct<(i8)>>
    %cast_59 = memref.cast %alloca_58 {"code-line" = 542 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_60 = memref.alloca() {"code-line" = 541 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "gradient_y"} : memref<1x!llvm.struct<(i8)>>
    %cast_61 = memref.cast %alloca_60 {"code-line" = 541 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    %alloca_62 = memref.alloca() {"code-line" = 540 : i32, dataflow = "struct hls::stream<float, 1024>", var_name = "gradient_x"} : memref<1x!llvm.struct<(i8)>>
    %cast_63 = memref.cast %alloca_62 {"code-line" = 540 : i32} : memref<1x!llvm.struct<(i8)>> to memref<?x!llvm.struct<(i8)>>
    affine.for %arg2 = 0 to 436 {
      affine.for %arg3 = 0 to 1024 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<436x1024xi64>
        %1 = arith.andi %0, %c255_i64 {"code-line" = 596 : i32} : i64
        %2 = arith.sitofp %1 {"code-line" = 596 : i32} : i64 to f32
        %3 = arith.divf %2, %cst {"code-line" = 596 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast_9, %3) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        %4 = arith.andi %0, %c65280_i64 {"code-line" = 597 : i32} : i64
        %5 = arith.shrsi %4, %c8_i64 {"code-line" = 597 : i32} : i64
        %6 = arith.sitofp %5 {"code-line" = 597 : i32} : i64 to f32
        %7 = arith.divf %6, %cst {"code-line" = 597 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast_7, %7) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        %8 = arith.andi %0, %c16711680_i64 {"code-line" = 598 : i32} : i64
        %9 = arith.shrsi %8, %c16_i64 {"code-line" = 598 : i32} : i64
        %10 = arith.sitofp %9 {"code-line" = 598 : i32} : i64 to f32
        %11 = arith.divf %10, %cst {"code-line" = 598 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast_1, %11) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        %12 = arith.andi %0, %c16711680_i64 {"code-line" = 599 : i32} : i64
        %13 = arith.shrsi %12, %c16_i64 {"code-line" = 599 : i32} : i64
        %14 = arith.sitofp %13 {"code-line" = 599 : i32} : i64 to f32
        %15 = arith.divf %14, %cst {"code-line" = 599 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast, %15) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        %16 = arith.andi %0, %c4278190080_i64 {"code-line" = 600 : i32} : i64
        %17 = arith.shrsi %16, %c24_i64 {"code-line" = 600 : i32} : i64
        %18 = arith.sitofp %17 {"code-line" = 600 : i32} : i64 to f32
        %19 = arith.divf %18, %cst {"code-line" = 600 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast_5, %19) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        %20 = arith.andi %0, %c1095216660480_i64 {"code-line" = 601 : i32} : i64
        %21 = arith.shrsi %20, %c32_i64 {"code-line" = 601 : i32} : i64
        %22 = arith.sitofp %21 {"code-line" = 601 : i32} : i64 to f32
        %23 = arith.divf %22, %cst {"code-line" = 601 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%cast_3, %23) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 591 : i32}
    }
    call @_Z16gradient_xy_calcRN3hls6streamIfLi1024EEES2_S2_(%cast_1, %cast_63, %cast_61) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z15gradient_z_calcRN3hls6streamIfLi1024EEES2_S2_S2_S2_RNS0_IfLi4096EEE(%cast_9, %cast_7, %cast, %cast_5, %cast_3, %cast_59) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z17gradient_weight_yRN3hls6streamIfLi1024EEES2_RNS0_IfLi4096EEES2_S2_S2_(%cast_63, %cast_61, %cast_59, %cast_57, %cast_55, %cast_53) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z17gradient_weight_xRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_(%cast_57, %cast_55, %cast_53, %cast_51, %cast_49, %cast_47) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z13outer_productRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_(%cast_51, %cast_49, %cast_47, %cast_45, %cast_43, %cast_41, %cast_39, %cast_37, %cast_35) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z15tensor_weight_yRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_S2_S2_S2_(%cast_45, %cast_43, %cast_41, %cast_39, %cast_37, %cast_35, %cast_33, %cast_31, %cast_29, %cast_27, %cast_25, %cast_23) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z15tensor_weight_xRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_S2_S2_S2_(%cast_33, %cast_31, %cast_29, %cast_27, %cast_25, %cast_23, %cast_21, %cast_19, %cast_17, %cast_15, %cast_13, %cast_11) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>) -> ()
    call @_Z9flow_calcRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_PA1024_A2_f(%cast_21, %cast_19, %cast_17, %cast_15, %cast_13, %cast_11, %arg1) : (memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<?x!llvm.struct<(i8)>>, memref<436x1024x2xf32>) -> ()
    return
  }
  func.func private @_ZN3hls6streamIfLi1024EE5writeEf(memref<?x!llvm.struct<(i8)>>, f32) attributes {llvm.linkage = #llvm.linkage<external>}
  func.func @_Z16gradient_xy_calcRN3hls6streamIfLi1024EEES2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 28 : i32, llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 1.200000e+01 : f32
    %c2_i32 = arith.constant {"code-line" = 89 : i32} 2 : i32
    %c5_i32 = arith.constant {"code-line" = 80 : i32} 5 : i32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %false = arith.constant false
    %c1024_i32 = arith.constant {"code-line" = 13 : i32} 1024 : i32
    %c436_i32 = arith.constant {"code-line" = 12 : i32} 436 : i32
    %c4_i32 = arith.constant {"code-line" = 52 : i32} 4 : i32
    %c-1_i32 = arith.constant {"code-line" = 42 : i32} -1 : i32
    %c8_i32 = arith.constant {"code-line" = 42 : i32} 8 : i32
    %c0_i32 = arith.constant {"code-line" = 42 : i32} 0 : i32
    %c-8_i32 = arith.constant {"code-line" = 42 : i32} -8 : i32
    %c1_i32 = arith.constant {"code-line" = 42 : i32} 1 : i32
    %0 = llvm.mlir.undef : i32
    %alloca = memref.alloca() {"code-line" = 42 : i32, var_name = "GRAD_WEIGHTS"} : memref<5xi32>
    %alloca_1 = memref.alloca() {"code-line" = 38 : i32, partition_cyclic_array = [0 : i32, 0 : i32], partition_dim_array = [0 : i32, 1 : i32], partition_factor_array = [5 : i32, 5 : i32], var_name = "window"} : memref<5x5xf32>
    %alloca_2 = memref.alloca() {"code-line" = 34 : i32, partition_cyclic_array = [0 : i32], partition_dim_array = [0 : i32], partition_factor_array = [5 : i32], var_name = "smallbuf"} : memref<5xf32>
    %alloca_3 = memref.alloca() {"code-line" = 30 : i32, partition_cyclic_array = [0 : i32], partition_dim_array = [0 : i32], partition_factor_array = [5 : i32], var_name = "buf"} : memref<5x1024xf32>
    affine.store %c1_i32, %alloca[0] : memref<5xi32>
    affine.store %c-8_i32, %alloca[1] : memref<5xi32>
    affine.store %c0_i32, %alloca[2] : memref<5xi32>
    affine.store %c8_i32, %alloca[3] : memref<5xi32>
    affine.store %c-1_i32, %alloca[4] : memref<5xi32>
    %1:4 = affine.for %arg3 = 0 to 438 iter_args(%arg4 = %0, %arg5 = %0, %arg6 = %0, %arg7 = %0) -> (i32, i32, i32, i32) {
      %2 = arith.index_cast %arg3 : index to i32
      %3 = affine.if #set(%arg3) -> i1 {
        %5 = arith.cmpi slt, %2, %c436_i32 : i32
        affine.yield %5 : i1
      } else {
        affine.yield %false : i1
      }
      %4:4 = affine.for %arg8 = 0 to 1026 iter_args(%arg9 = %arg4, %arg10 = %arg5, %arg11 = %arg6, %arg12 = %arg7) -> (i32, i32, i32, i32) {
        %5 = arith.index_cast %arg8 : index to i32
        affine.for %arg13 = 0 to 4 {
          %13 = affine.load %alloca_3[%arg13 + 1, %arg8] : memref<5x1024xf32>
          affine.store %13, %alloca_2[%arg13] : memref<5xf32>
        } {unroll = 0 : i32, "unroll-line" = 53 : i32}
        %6 = affine.if #set1(%arg3) -> i1 {
          %13 = arith.cmpi slt, %5, %c1024_i32 : i32
          affine.yield %13 : i1
        } else {
          affine.yield %false : i1
        }
        scf.if %6 {
          %13 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 57 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %13, %alloca_2[4] : memref<5xf32>
        } else {
          affine.if #set2(%arg8) {
            affine.store %cst_0, %alloca_2[4] : memref<5xf32>
          }
        }
        %7 = arith.select %6, %c4_i32, %arg12 : i32
        %8 = scf.if %6 -> (i32) {
          affine.for %arg13 = 0 to 4 {
            %14 = affine.load %alloca_2[%arg13] : memref<5xf32>
            affine.store %14, %alloca_3[%arg13, %arg8] : memref<5x1024xf32>
          } {unroll = 0 : i32, "unroll-line" = 64 : i32}
          %13 = affine.load %alloca_2[4] : memref<5xf32>
          affine.store %13, %alloca_3[4, %arg8] : memref<5x1024xf32>
          scf.yield %arg11 : i32
        } else {
          %13 = arith.cmpi slt, %5, %c1024_i32 : i32
          %14 = arith.select %13, %c4_i32, %arg11 : i32
          affine.if #set2(%arg8) {
            affine.for %arg13 = 0 to 4 {
              %16 = affine.load %alloca_2[%arg13] : memref<5xf32>
              affine.store %16, %alloca_3[%arg13, %arg8] : memref<5x1024xf32>
            } {unroll = 0 : i32, "unroll-line" = 71 : i32}
            %15 = affine.load %alloca_2[4] : memref<5xf32>
            affine.store %15, %alloca_3[4, %arg8] : memref<5x1024xf32>
          }
          scf.yield %14 : i32
        }
        %9 = arith.select %6, %c5_i32, %arg10 : i32
        scf.if %6 {
          affine.for %arg13 = 0 to 5 {
            affine.for %arg14 = 0 to 4 {
              %13 = affine.load %alloca_1[%arg13, %arg14 + 1] : memref<5x5xf32>
              affine.store %13, %alloca_1[%arg13, %arg14] : memref<5x5xf32>
            } {unroll = 0 : i32, "unroll-line" = 14 : i32}
          } {unroll = 0 : i32, "unroll-line" = 12 : i32}
          affine.for %arg13 = 0 to 5 {
            %13 = affine.load %alloca_2[%arg13] : memref<5xf32>
            affine.store %13, %alloca_1[%arg13, 4] : memref<5x5xf32>
          } {unroll = 0 : i32, "unroll-line" = 81 : i32}
        } else {
          affine.for %arg13 = 0 to 5 {
            affine.for %arg14 = 0 to 4 {
              %13 = affine.load %alloca_1[%arg13, %arg14 + 1] : memref<5x5xf32>
              affine.store %13, %alloca_1[%arg13, %arg14] : memref<5x5xf32>
            } {unroll = 0 : i32, "unroll-line" = 14 : i32}
          } {unroll = 0 : i32, "unroll-line" = 12 : i32}
          affine.store %cst_0, %alloca_1[0, 4] : memref<5x5xf32>
          affine.store %cst_0, %alloca_1[1, 4] : memref<5x5xf32>
          affine.store %cst_0, %alloca_1[2, 4] : memref<5x5xf32>
          affine.store %cst_0, %alloca_1[3, 4] : memref<5x5xf32>
          affine.store %cst_0, %alloca_1[4, 4] : memref<5x5xf32>
        }
        %10 = scf.if %3 -> (i1) {
          %13 = arith.cmpi sge, %5, %c4_i32 : i32
          scf.yield %13 : i1
        } else {
          scf.yield %false : i1
        }
        %11 = scf.if %10 -> (i1) {
          %13 = arith.cmpi slt, %5, %c1024_i32 : i32
          scf.yield %13 : i1
        } else {
          scf.yield %false : i1
        }
        %12 = arith.select %11, %c5_i32, %arg9 : i32
        scf.if %11 {
          %13:2 = affine.for %arg13 = 0 to 5 iter_args(%arg14 = %cst_0, %arg15 = %cst_0) -> (f32, f32) {
            %16 = affine.load %alloca_1[2, %arg13] : memref<5x5xf32>
            %17 = affine.load %alloca[%arg13] : memref<5xi32>
            %18 = arith.sitofp %17 {"code-line" = 103 : i32} : i32 to f32
            %19 = arith.mulf %16, %18 {"code-line" = 103 : i32} : f32
            %20 = arith.addf %arg15, %19 : f32
            %21 = affine.load %alloca_1[%arg13, 2] : memref<5x5xf32>
            %22 = arith.sitofp %17 {"code-line" = 104 : i32} : i32 to f32
            %23 = arith.mulf %21, %22 {"code-line" = 104 : i32} : f32
            %24 = arith.addf %arg14, %23 : f32
            affine.yield %24, %20 : f32, f32
          } {unroll = 0 : i32, "unroll-line" = 102 : i32}
          %14 = arith.divf %13#1, %cst {"code-line" = 106 : i32} : f32
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg1, %14) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %15 = arith.divf %13#0, %cst {"code-line" = 107 : i32} : f32
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg2, %15) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        } else {
          %13 = affine.if #set3(%arg3) -> i1 {
            %14 = arith.cmpi sge, %5, %c2_i32 : i32
            affine.yield %14 : i1
          } else {
            affine.yield %false : i1
          }
          scf.if %13 {
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg1, %cst_0) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg2, %cst_0) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          }
        }
        affine.yield %12, %9, %8, %7 : i32, i32, i32, i32
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 50 : i32}
      affine.yield %4#0, %4#1, %4#2, %4#3 : i32, i32, i32, i32
    }
    return
  }
  func.func @_Z15gradient_z_calcRN3hls6streamIfLi1024EEES2_S2_S2_S2_RNS0_IfLi4096EEE(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 125 : i32, llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant -8.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 8.000000e+00 : f32
    %cst_2 = arith.constant -1.000000e+00 : f32
    %cst_3 = arith.constant 1.200000e+01 : f32
    affine.for %arg6 = 0 to 436 {
      affine.for %arg7 = 0 to 1024 {
        %0 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 134 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %1 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 134 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %2 = arith.mulf %1, %cst {"code-line" = 134 : i32} : f32
        %3 = arith.addf %0, %2 {"code-line" = 134 : i32} : f32
        %4 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 134 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %5 = arith.mulf %4, %cst_0 {"code-line" = 134 : i32} : f32
        %6 = arith.addf %3, %5 {"code-line" = 134 : i32} : f32
        %7 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg3) {"code-line" = 134 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %8 = arith.mulf %7, %cst_1 {"code-line" = 134 : i32} : f32
        %9 = arith.addf %6, %8 {"code-line" = 134 : i32} : f32
        %10 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg4) {"code-line" = 134 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %11 = arith.mulf %10, %cst_2 {"code-line" = 134 : i32} : f32
        %12 = arith.addf %9, %11 {"code-line" = 134 : i32} : f32
        %13 = arith.divf %12, %cst_3 {"code-line" = 134 : i32} : f32
        func.call @_ZN3hls6streamIfLi4096EE5writeEf(%arg5, %13) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 133 : i32}
    }
    return
  }
  func.func @_Z17gradient_weight_yRN3hls6streamIfLi1024EEES2_RNS0_IfLi4096EEES2_S2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 146 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c7_i32 = arith.constant {"code-line" = 187 : i32} 7 : i32
    %c6_i32 = arith.constant {"code-line" = 184 : i32} 6 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c436_i32 = arith.constant {"code-line" = 12 : i32} 436 : i32
    %cst_0 = arith.constant {"code-line" = 150 : i32} 2.903000e-01 : f32
    %cst_1 = arith.constant {"code-line" = 150 : i32} 1.869000e-01 : f32
    %cst_2 = arith.constant {"code-line" = 150 : i32} 1.330000e-01 : f32
    %cst_3 = arith.constant {"code-line" = 150 : i32} 7.550000e-02 : f32
    %0 = llvm.mlir.undef : i32
    %alloca = memref.alloca() {"code-line" = 150 : i32, var_name = "GRAD_FILTER"} : memref<7xf32>
    %alloca_4 = memref.alloca() {"code-line" = 147 : i32, partition_cyclic_array = [0 : i32], partition_dim_array = [0 : i32], partition_factor_array = [7 : i32], var_name = "buf"} : memref<7x1024x3xf32>
    affine.store %cst_3, %alloca[0] : memref<7xf32>
    affine.store %cst_2, %alloca[1] : memref<7xf32>
    affine.store %cst_1, %alloca[2] : memref<7xf32>
    affine.store %cst_0, %alloca[3] : memref<7xf32>
    affine.store %cst_1, %alloca[4] : memref<7xf32>
    affine.store %cst_2, %alloca[5] : memref<7xf32>
    affine.store %cst_3, %alloca[6] : memref<7xf32>
    %1 = affine.for %arg6 = 0 to 439 iter_args(%arg7 = %0) -> (i32) {
      %2 = arith.index_cast %arg6 : index to i32
      %3 = arith.cmpi slt, %2, %c436_i32 : i32
      %4 = arith.cmpi sge, %2, %c6_i32 : i32
      %5 = arith.andi %4, %3 : i1
      %6 = affine.for %arg8 = 0 to 1024 iter_args(%arg9 = %arg7) -> (i32) {
        affine.if #set1(%arg6) {
          affine.for %arg10 = 0 to 6 {
            affine.for %arg11 = 0 to 3 {
              %11 = affine.load %alloca_4[%arg10 + 1, %arg8, %arg11] : memref<7x1024x3xf32>
              affine.store %11, %alloca_4[%arg10, %arg8, %arg11] : memref<7x1024x3xf32>
            } {unroll = 0 : i32, "unroll-line" = 33 : i32}
          } {unroll = 0 : i32, "unroll-line" = 31 : i32}
          %8 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 164 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %9 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 165 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %10 = func.call @_ZN3hls6streamIfLi4096EE4readEv(%arg2) {"code-line" = 166 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %8, %alloca_4[4, %arg8, 0] : memref<7x1024x3xf32>
          affine.store %9, %alloca_4[4, %arg8, 1] : memref<7x1024x3xf32>
          affine.store %10, %alloca_4[4, %arg8, 2] : memref<7x1024x3xf32>
        } else {
          affine.for %arg10 = 0 to 6 {
            affine.for %arg11 = 0 to 3 {
              %11 = affine.load %alloca_4[%arg10 + 1, %arg8, %arg11] : memref<7x1024x3xf32>
              affine.store %11, %alloca_4[%arg10, %arg8, %arg11] : memref<7x1024x3xf32>
            } {unroll = 0 : i32, "unroll-line" = 33 : i32}
          } {unroll = 0 : i32, "unroll-line" = 31 : i32}
          %8 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 173 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %9 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 174 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %10 = func.call @_ZN3hls6streamIfLi4096EE4readEv(%arg2) {"code-line" = 175 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %8, %alloca_4[4, %arg8, 0] : memref<7x1024x3xf32>
          affine.store %9, %alloca_4[4, %arg8, 1] : memref<7x1024x3xf32>
          affine.store %10, %alloca_4[4, %arg8, 2] : memref<7x1024x3xf32>
        }
        %7 = arith.select %5, %c7_i32, %arg9 : i32
        affine.if #set4(%arg6) {
          %8 = affine.for %arg10 = 0 to 7 iter_args(%arg11 = %cst) -> (f32) {
            %9 = affine.load %alloca_4[%arg10, %arg8, 0] : memref<7x1024x3xf32>
            %10 = affine.load %alloca[%arg10] : memref<7xf32>
            %11 = arith.mulf %9, %10 {"code-line" = 190 : i32} : f32
            %12 = arith.addf %arg11, %11 : f32
            affine.yield %12 : f32
          } {unroll = 0 : i32, "unroll-line" = 189 : i32}
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg3, %8) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg4, %8) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg5, %8) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        } else {
          affine.if #set5(%arg6) {
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg3, %cst) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg4, %cst) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg5, %cst) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          }
        }
        affine.yield %7 : i32
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 157 : i32}
      affine.yield %6 : i32
    }
    return
  }
  func.func @_Z17gradient_weight_xRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 215 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c7_i32 = arith.constant {"code-line" = 247 : i32} 7 : i32
    %c6_i32 = arith.constant {"code-line" = 239 : i32} 6 : i32
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c1024_i32 = arith.constant {"code-line" = 13 : i32} 1024 : i32
    %cst_2 = arith.constant {"code-line" = 217 : i32} 2.903000e-01 : f32
    %cst_3 = arith.constant {"code-line" = 217 : i32} 1.869000e-01 : f32
    %cst_4 = arith.constant {"code-line" = 217 : i32} 1.330000e-01 : f32
    %cst_5 = arith.constant {"code-line" = 217 : i32} 7.550000e-02 : f32
    %0 = llvm.mlir.undef : i32
    %alloca = memref.alloca() {"code-line" = 217 : i32, var_name = "GRAD_FILTER"} : memref<7xf32>
    %alloca_6 = memref.alloca() {"code-line" = 216 : i32, var_name = "buf"} : memref<1x7x3xf32>
    affine.store %cst_5, %alloca[0] : memref<7xf32>
    affine.store %cst_4, %alloca[1] : memref<7xf32>
    affine.store %cst_3, %alloca[2] : memref<7xf32>
    affine.store %cst_2, %alloca[3] : memref<7xf32>
    affine.store %cst_3, %alloca[4] : memref<7xf32>
    affine.store %cst_4, %alloca[5] : memref<7xf32>
    affine.store %cst_5, %alloca[6] : memref<7xf32>
    %1 = affine.for %arg6 = 0 to 436 iter_args(%arg7 = %0) -> (i32) {
      %2 = affine.for %arg8 = 0 to 1027 iter_args(%arg9 = %arg7) -> (i32) {
        %3 = arith.index_cast %arg8 : index to i32
        affine.for %arg10 = 0 to 6 {
          affine.for %arg11 = 0 to 3 {
            %9 = affine.load %alloca_6[0, %arg10 + 1, %arg11] : memref<1x7x3xf32>
            affine.store %9, %alloca_6[0, %arg10, %arg11] : memref<1x7x3xf32>
          } {unroll = 0 : i32, "unroll-line" = 53 : i32}
        } {unroll = 0 : i32, "unroll-line" = 51 : i32}
        %4 = arith.cmpi slt, %3, %c1024_i32 : i32
        %5:3 = affine.if #set2(%arg8) -> (f32, f32, f32) {
          %9 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 229 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %10 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 230 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          %11 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 231 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.yield %9, %10, %11 : f32, f32, f32
        } else {
          affine.yield %cst_1, %cst_0, %cst : f32, f32, f32
        }
        affine.store %5#0, %alloca_6[0, 6, 0] : memref<1x7x3xf32>
        affine.store %5#1, %alloca_6[0, 6, 1] : memref<1x7x3xf32>
        affine.store %5#2, %alloca_6[0, 6, 2] : memref<1x7x3xf32>
        %6 = arith.cmpi sge, %3, %c6_i32 : i32
        %7 = arith.andi %6, %4 : i1
        %8 = arith.select %7, %c7_i32, %arg9 : i32
        affine.if #set6(%arg8) {
          %9 = affine.for %arg10 = 0 to 7 iter_args(%arg11 = %cst_1) -> (f32) {
            %10 = affine.load %alloca_6[0, %arg10, 0] : memref<1x7x3xf32>
            %11 = affine.load %alloca[%arg10] : memref<7xf32>
            %12 = arith.mulf %10, %11 {"code-line" = 250 : i32} : f32
            %13 = arith.addf %arg11, %12 : f32
            affine.yield %13 : f32
          } {unroll = 0 : i32, "unroll-line" = 249 : i32}
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg3, %9) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg4, %9) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg5, %9) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        } else {
          affine.if #set5(%arg8) {
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg3, %cst_1) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg4, %cst_1) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
            func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg5, %cst_1) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          }
        }
        affine.yield %8 : i32
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 224 : i32}
      affine.yield %2 : i32
    }
    return
  }
  func.func @_Z13outer_productRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>, %arg6: memref<?x!llvm.struct<(i8)>>, %arg7: memref<?x!llvm.struct<(i8)>>, %arg8: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 278 : i32, llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg9 = 0 to 436 {
      affine.for %arg10 = 0 to 1024 {
        %0 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 287 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %1 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 288 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %2 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 289 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %3 = arith.mulf %0, %0 {"code-line" = 294 : i32} : f32
        %4 = arith.mulf %1, %1 {"code-line" = 295 : i32} : f32
        %5 = arith.mulf %2, %2 {"code-line" = 296 : i32} : f32
        %6 = arith.mulf %0, %1 {"code-line" = 297 : i32} : f32
        %7 = arith.mulf %0, %2 {"code-line" = 298 : i32} : f32
        %8 = arith.mulf %1, %2 {"code-line" = 299 : i32} : f32
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg3, %3) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg4, %4) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg5, %5) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg6, %6) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg7, %7) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg8, %8) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 285 : i32}
    }
    return
  }
  func.func @_Z15tensor_weight_yRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_S2_S2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>, %arg6: memref<?x!llvm.struct<(i8)>>, %arg7: memref<?x!llvm.struct<(i8)>>, %arg8: memref<?x!llvm.struct<(i8)>>, %arg9: memref<?x!llvm.struct<(i8)>>, %arg10: memref<?x!llvm.struct<(i8)>>, %arg11: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 323 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c-2 = arith.constant -2 : index
    %c0 = arith.constant 0 : index
    %c3_i32 = arith.constant {"code-line" = 364 : i32} 3 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c6_i32 = arith.constant {"code-line" = 349 : i32} 6 : i32
    %c436_i32 = arith.constant {"code-line" = 12 : i32} 436 : i32
    %cst_0 = arith.constant {"code-line" = 327 : i32} 3.513000e-01 : f32
    %cst_1 = arith.constant {"code-line" = 327 : i32} 3.243000e-01 : f32
    %0 = llvm.mlir.undef : i32
    %alloca = memref.alloca() {"code-line" = 355 : i32, var_name = "acc"} : memref<6xf32>
    %alloca_2 = memref.alloca() {"code-line" = 335 : i32, var_name = "tmp"} : memref<6xf32>
    %alloca_3 = memref.alloca() {"code-line" = 327 : i32, var_name = "TENSOR_FILTER"} : memref<3xf32>
    %alloca_4 = memref.alloca() {"code-line" = 324 : i32, partition_cyclic_array = [0 : i32], partition_dim_array = [0 : i32], partition_factor_array = [3 : i32], var_name = "buf"} : memref<3x1024x6xf32>
    affine.store %cst_1, %alloca_3[0] : memref<3xf32>
    affine.store %cst_0, %alloca_3[1] : memref<3xf32>
    affine.store %cst_1, %alloca_3[2] : memref<3xf32>
    %1:3 = affine.for %arg12 = 0 to 437 iter_args(%arg13 = %0, %arg14 = %0, %arg15 = %0) -> (i32, i32, i32) {
      %2 = arith.index_cast %arg12 : index to i32
      %3 = arith.cmpi slt, %2, %c436_i32 : i32
      %4 = arith.addi %arg12, %c-2 : index
      %5 = arith.cmpi sge, %4, %c0 : index
      %6 = arith.andi %5, %3 : i1
      %7:3 = affine.for %arg16 = 0 to 1024 iter_args(%arg17 = %arg13, %arg18 = %arg14, %arg19 = %arg15) -> (i32, i32, i32) {
        affine.for %arg20 = 0 to 2 {
          affine.for %arg21 = 0 to 6 {
            %17 = affine.load %alloca_4[%arg20 + 1, %arg16, %arg21] : memref<3x1024x6xf32>
            affine.store %17, %alloca_4[%arg20, %arg16, %arg21] : memref<3x1024x6xf32>
          } {unroll = 0 : i32, "unroll-line" = 73 : i32}
        } {unroll = 0 : i32, "unroll-line" = 71 : i32}
        %8 = arith.select %3, %arg19, %c6_i32 : i32
        affine.if #set1(%arg12) {
          %17 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 339 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %17, %alloca_2[0] : memref<6xf32>
          %18 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 340 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %18, %alloca_2[1] : memref<6xf32>
          %19 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 341 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %19, %alloca_2[2] : memref<6xf32>
          %20 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg3) {"code-line" = 342 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %20, %alloca_2[3] : memref<6xf32>
          %21 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg4) {"code-line" = 343 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %21, %alloca_2[4] : memref<6xf32>
          %22 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg5) {"code-line" = 344 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %22, %alloca_2[5] : memref<6xf32>
        } else {
          affine.for %arg20 = 0 to 6 {
            affine.store %cst, %alloca_2[%arg20] : memref<6xf32>
          } {unroll = 0 : i32, "unroll-line" = 350 : i32}
        }
        %9 = affine.load %alloca_2[0] : memref<6xf32>
        affine.store %9, %alloca_4[2, 6, 0] : memref<3x1024x6xf32>
        %10 = affine.load %alloca_2[1] : memref<6xf32>
        affine.store %10, %alloca_4[2, 6, 1] : memref<3x1024x6xf32>
        %11 = affine.load %alloca_2[2] : memref<6xf32>
        affine.store %11, %alloca_4[2, 6, 2] : memref<3x1024x6xf32>
        %12 = affine.load %alloca_2[3] : memref<6xf32>
        affine.store %12, %alloca_4[2, 6, 3] : memref<3x1024x6xf32>
        %13 = affine.load %alloca_2[4] : memref<6xf32>
        affine.store %13, %alloca_4[2, 6, 4] : memref<3x1024x6xf32>
        %14 = affine.load %alloca_2[5] : memref<6xf32>
        affine.store %14, %alloca_4[2, 6, 5] : memref<3x1024x6xf32>
        affine.for %arg20 = 0 to 6 {
          affine.store %cst, %alloca[%arg20] : memref<6xf32>
        } {unroll = 0 : i32, "unroll-line" = 358 : i32}
        %15 = arith.select %6, %c3_i32, %arg18 : i32
        %16 = affine.if #set7(%arg12) -> i32 {
          %17 = affine.for %arg20 = 0 to 3 iter_args(%arg21 = %arg17) -> (i32) {
            %18 = affine.load %alloca_4[%arg20, %arg16, 0] : memref<3x1024x6xf32>
            affine.store %18, %alloca_2[0] : memref<6xf32>
            %19 = affine.load %alloca_4[%arg20, %arg16, 1] : memref<3x1024x6xf32>
            affine.store %19, %alloca_2[1] : memref<6xf32>
            %20 = affine.load %alloca_4[%arg20, %arg16, 2] : memref<3x1024x6xf32>
            affine.store %20, %alloca_2[2] : memref<6xf32>
            %21 = affine.load %alloca_4[%arg20, %arg16, 3] : memref<3x1024x6xf32>
            affine.store %21, %alloca_2[3] : memref<6xf32>
            %22 = affine.load %alloca_4[%arg20, %arg16, 4] : memref<3x1024x6xf32>
            affine.store %22, %alloca_2[4] : memref<6xf32>
            %23 = affine.load %alloca_4[%arg20, %arg16, 5] : memref<3x1024x6xf32>
            affine.store %23, %alloca_2[5] : memref<6xf32>
            %24 = affine.load %alloca_3[%arg20] : memref<3xf32>
            affine.for %arg22 = 0 to 6 {
              %25 = affine.load %alloca_2[%arg22] : memref<6xf32>
              %26 = arith.mulf %25, %24 {"code-line" = 378 : i32} : f32
              %27 = affine.load %alloca[%arg22] : memref<6xf32>
              %28 = arith.addf %27, %26 : f32
              affine.store %28, %alloca[%arg22] : memref<6xf32>
            } {unroll = 0 : i32, "unroll-line" = 377 : i32}
            affine.yield %c6_i32 : i32
          } {unroll = 0 : i32, "unroll-line" = 366 : i32}
          affine.yield %17 : i32
        } else {
          affine.yield %arg17 : i32
        }
        affine.if #set8(%arg12) {
          %17 = affine.load %alloca[0] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg6, %17) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %18 = affine.load %alloca[1] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg7, %18) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %19 = affine.load %alloca[2] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg8, %19) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %20 = affine.load %alloca[3] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg9, %20) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %21 = affine.load %alloca[4] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg10, %21) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %22 = affine.load %alloca[5] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg11, %22) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        }
        affine.yield %16, %15, %8 : i32, i32, i32
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 334 : i32}
      affine.yield %7#0, %7#1, %7#2 : i32, i32, i32
    }
    return
  }
  func.func @_Z15tensor_weight_xRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_S2_S2_S2_S2_S2_S2_(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>, %arg6: memref<?x!llvm.struct<(i8)>>, %arg7: memref<?x!llvm.struct<(i8)>>, %arg8: memref<?x!llvm.struct<(i8)>>, %arg9: memref<?x!llvm.struct<(i8)>>, %arg10: memref<?x!llvm.struct<(i8)>>, %arg11: memref<?x!llvm.struct<(i8)>>) attributes {"code-line" = 407 : i32, llvm.linkage = #llvm.linkage<external>} {
    %c-2 = arith.constant -2 : index
    %c0 = arith.constant 0 : index
    %c3_i32 = arith.constant {"code-line" = 444 : i32} 3 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %c6_i32 = arith.constant {"code-line" = 431 : i32} 6 : i32
    %c1024_i32 = arith.constant {"code-line" = 13 : i32} 1024 : i32
    %cst_0 = arith.constant {"code-line" = 409 : i32} 3.513000e-01 : f32
    %cst_1 = arith.constant {"code-line" = 409 : i32} 3.243000e-01 : f32
    %0 = llvm.mlir.undef : i32
    %alloca = memref.alloca() {"code-line" = 436 : i32, var_name = "acc"} : memref<6xf32>
    %alloca_2 = memref.alloca() {"code-line" = 418 : i32, var_name = "tmp"} : memref<6xf32>
    %alloca_3 = memref.alloca() {"code-line" = 409 : i32, var_name = "TENSOR_FILTER"} : memref<3xf32>
    %alloca_4 = memref.alloca() {"code-line" = 408 : i32, var_name = "buf"} : memref<1x3x6xf32>
    affine.store %cst_1, %alloca_3[0] : memref<3xf32>
    affine.store %cst_0, %alloca_3[1] : memref<3xf32>
    affine.store %cst_1, %alloca_3[2] : memref<3xf32>
    %1:3 = affine.for %arg12 = 0 to 436 iter_args(%arg13 = %0, %arg14 = %0, %arg15 = %0) -> (i32, i32, i32) {
      %2:3 = affine.for %arg16 = 0 to 1025 iter_args(%arg17 = %arg13, %arg18 = %arg14, %arg19 = %arg15) -> (i32, i32, i32) {
        %3 = arith.index_cast %arg16 : index to i32
        affine.for %arg20 = 0 to 2 {
          affine.for %arg21 = 0 to 6 {
            %17 = affine.load %alloca_4[0, %arg20 + 1, %arg21] : memref<1x3x6xf32>
            affine.store %17, %alloca_4[0, %arg20, %arg21] : memref<1x3x6xf32>
          } {unroll = 0 : i32, "unroll-line" = 96 : i32}
        } {unroll = 0 : i32, "unroll-line" = 94 : i32}
        %4 = arith.cmpi slt, %3, %c1024_i32 : i32
        %5 = arith.select %4, %arg19, %c6_i32 : i32
        affine.if #set2(%arg16) {
          %17 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 421 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %17, %alloca_2[0] : memref<6xf32>
          %18 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 422 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %18, %alloca_2[1] : memref<6xf32>
          %19 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 423 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %19, %alloca_2[2] : memref<6xf32>
          %20 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg3) {"code-line" = 424 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %20, %alloca_2[3] : memref<6xf32>
          %21 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg4) {"code-line" = 425 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %21, %alloca_2[4] : memref<6xf32>
          %22 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg5) {"code-line" = 426 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
          affine.store %22, %alloca_2[5] : memref<6xf32>
        } else {
          affine.for %arg20 = 0 to 6 {
            affine.store %cst, %alloca_2[%arg20] : memref<6xf32>
          } {unroll = 0 : i32, "unroll-line" = 432 : i32}
        }
        %6 = affine.load %alloca_2[0] : memref<6xf32>
        affine.store %6, %alloca_4[0, 2, 0] : memref<1x3x6xf32>
        %7 = affine.load %alloca_2[1] : memref<6xf32>
        affine.store %7, %alloca_4[0, 2, 1] : memref<1x3x6xf32>
        %8 = affine.load %alloca_2[2] : memref<6xf32>
        affine.store %8, %alloca_4[0, 2, 2] : memref<1x3x6xf32>
        %9 = affine.load %alloca_2[3] : memref<6xf32>
        affine.store %9, %alloca_4[0, 2, 3] : memref<1x3x6xf32>
        %10 = affine.load %alloca_2[4] : memref<6xf32>
        affine.store %10, %alloca_4[0, 2, 4] : memref<1x3x6xf32>
        %11 = affine.load %alloca_2[5] : memref<6xf32>
        affine.store %11, %alloca_4[0, 2, 5] : memref<1x3x6xf32>
        affine.for %arg20 = 0 to 6 {
          affine.store %cst, %alloca[%arg20] : memref<6xf32>
        } {unroll = 0 : i32, "unroll-line" = 439 : i32}
        %12 = arith.addi %arg16, %c-2 : index
        %13 = arith.cmpi sge, %12, %c0 : index
        %14 = arith.andi %13, %4 : i1
        %15 = arith.select %14, %c3_i32, %arg18 : i32
        %16 = affine.if #set9(%arg16) -> i32 {
          %17 = affine.for %arg20 = 0 to 3 iter_args(%arg21 = %arg17) -> (i32) {
            %18 = affine.load %alloca_4[0, %arg20, 0] : memref<1x3x6xf32>
            affine.store %18, %alloca_2[0] : memref<6xf32>
            %19 = affine.load %alloca_4[0, %arg20, 1] : memref<1x3x6xf32>
            affine.store %19, %alloca_2[1] : memref<6xf32>
            %20 = affine.load %alloca_4[0, %arg20, 2] : memref<1x3x6xf32>
            affine.store %20, %alloca_2[2] : memref<6xf32>
            %21 = affine.load %alloca_4[0, %arg20, 3] : memref<1x3x6xf32>
            affine.store %21, %alloca_2[3] : memref<6xf32>
            %22 = affine.load %alloca_4[0, %arg20, 4] : memref<1x3x6xf32>
            affine.store %22, %alloca_2[4] : memref<6xf32>
            %23 = affine.load %alloca_4[0, %arg20, 5] : memref<1x3x6xf32>
            affine.store %23, %alloca_2[5] : memref<6xf32>
            %24 = affine.load %alloca_3[%arg20] : memref<3xf32>
            affine.for %arg22 = 0 to 6 {
              %25 = affine.load %alloca_2[%arg22] : memref<6xf32>
              %26 = arith.mulf %25, %24 {"code-line" = 457 : i32} : f32
              %27 = affine.load %alloca[%arg22] : memref<6xf32>
              %28 = arith.addf %27, %26 : f32
              affine.store %28, %alloca[%arg22] : memref<6xf32>
            } {unroll = 0 : i32, "unroll-line" = 456 : i32}
            affine.yield %c6_i32 : i32
          } {unroll = 0 : i32, "unroll-line" = 446 : i32}
          affine.yield %17 : i32
        } else {
          affine.yield %arg17 : i32
        }
        affine.if #set8(%arg16) {
          %17 = affine.load %alloca[0] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg6, %17) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %18 = affine.load %alloca[1] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg7, %18) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %19 = affine.load %alloca[2] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg8, %19) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %20 = affine.load %alloca[3] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg9, %20) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %21 = affine.load %alloca[4] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg10, %21) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
          %22 = affine.load %alloca[5] : memref<6xf32>
          func.call @_ZN3hls6streamIfLi1024EE5writeEf(%arg11, %22) : (memref<?x!llvm.struct<(i8)>>, f32) -> ()
        }
        affine.yield %16, %15, %5 : i32, i32, i32
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 416 : i32}
      affine.yield %2#0, %2#1, %2#2 : i32, i32, i32
    }
    return
  }
  func.func @_Z9flow_calcRN3hls6streamIfLi1024EEES2_S2_S2_S2_S2_PA1024_A2_f(%arg0: memref<?x!llvm.struct<(i8)>>, %arg1: memref<?x!llvm.struct<(i8)>>, %arg2: memref<?x!llvm.struct<(i8)>>, %arg3: memref<?x!llvm.struct<(i8)>>, %arg4: memref<?x!llvm.struct<(i8)>>, %arg5: memref<?x!llvm.struct<(i8)>>, %arg6: memref<436x1024x2xf32>) attributes {"code-line" = 482 : i32, llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f64
    %c1022_i32 = arith.constant 1022 : i32
    %false = arith.constant false
    %c434_i32 = arith.constant 434 : i32
    %c2_i32 = arith.constant {"code-line" = 498 : i32} 2 : i32
    affine.for %arg7 = 0 to 436 {
      %0 = arith.index_cast %arg7 : index to i32
      %1 = affine.if #set3(%arg7) -> i1 {
        %2 = arith.cmpi slt, %0, %c434_i32 : i32
        affine.yield %2 : i1
      } else {
        affine.yield %false : i1
      }
      affine.for %arg8 = 0 to 1024 {
        %2 = arith.index_cast %arg8 : index to i32
        %3 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg0) {"code-line" = 492 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %4 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg1) {"code-line" = 493 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %5 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg2) {"code-line" = 494 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %6 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg3) {"code-line" = 495 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %7 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg4) {"code-line" = 496 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %8 = func.call @_ZN3hls6streamIfLi1024EE4readEv(%arg5) {"code-line" = 497 : i32} : (memref<?x!llvm.struct<(i8)>>) -> f32
        %9 = scf.if %1 -> (i1) {
          %12 = arith.cmpi sge, %2, %c2_i32 : i32
          scf.yield %12 : i1
        } else {
          scf.yield %false : i1
        }
        %10 = scf.if %9 -> (i1) {
          %12 = arith.cmpi slt, %2, %c1022_i32 : i32
          scf.yield %12 : i1
        } else {
          scf.yield %false : i1
        }
        %11:2 = scf.if %10 -> (f32, f32) {
          %12 = arith.extf %3 {"code-line" = 500 : i32} : f32 to f64
          %13 = arith.extf %4 {"code-line" = 501 : i32} : f32 to f64
          %14 = arith.extf %6 {"code-line" = 503 : i32} : f32 to f64
          %15 = arith.extf %7 {"code-line" = 504 : i32} : f32 to f64
          %16 = arith.extf %8 {"code-line" = 505 : i32} : f32 to f64
          %17 = arith.mulf %12, %13 {"code-line" = 507 : i32} : f64
          %18 = arith.mulf %14, %14 {"code-line" = 507 : i32} : f64
          %19 = arith.subf %17, %18 {"code-line" = 507 : i32} : f64
          %20 = arith.mulf %16, %14 {"code-line" = 508 : i32} : f64
          %21 = arith.mulf %15, %13 {"code-line" = 508 : i32} : f64
          %22 = arith.subf %20, %21 {"code-line" = 508 : i32} : f64
          %23 = arith.mulf %15, %14 {"code-line" = 509 : i32} : f64
          %24 = arith.mulf %16, %12 {"code-line" = 509 : i32} : f64
          %25 = arith.subf %23, %24 {"code-line" = 509 : i32} : f64
          %26 = arith.cmpf une, %19, %cst_0 : f64
          %27:2 = scf.if %26 -> (f32, f32) {
            %28 = arith.divf %22, %19 {"code-line" = 513 : i32} : f64
            %29 = arith.truncf %28 {"code-line" = 513 : i32} : f64 to f32
            %30 = arith.divf %25, %19 {"code-line" = 514 : i32} : f64
            %31 = arith.truncf %30 {"code-line" = 514 : i32} : f64 to f32
            scf.yield %29, %31 : f32, f32
          } else {
            scf.yield %cst, %cst : f32, f32
          }
          scf.yield %27#0, %27#1 : f32, f32
        } else {
          scf.yield %cst, %cst : f32, f32
        }
        affine.store %11#0, %arg6[%arg7, %arg8, 0] : memref<436x1024x2xf32>
        affine.store %11#1, %arg6[%arg7, %arg8, 1] : memref<436x1024x2xf32>
      } {II = 1 : i32, pipeline = 1 : i32, "pipeline-line" = 490 : i32}
    }
    return
  }
  func.func private @_ZN3hls6streamIfLi1024EE4readEv(memref<?x!llvm.struct<(i8)>>) -> f32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func @_Z21shift_pixels_left_5_5PA5_f(%arg0: memref<5x5xf32>) attributes {"code-line" = 7 : i32, llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg1 = 0 to 5 {
      affine.for %arg2 = 0 to 4 {
        %0 = affine.load %arg0[%arg1, %arg2 + 1] : memref<5x5xf32>
        affine.store %0, %arg0[%arg1, %arg2] : memref<5x5xf32>
      } {unroll = 0 : i32, "unroll-line" = 14 : i32}
    } {unroll = 0 : i32, "unroll-line" = 12 : i32}
    return
  }
  func.func @_Z16insert_pixel_5_5PA5_ffii(%arg0: memref<5x5xf32>, %arg1: f32, %arg2: i32, %arg3: i32) attributes {"code-line" = 20 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = arith.index_cast %arg3 : i32 to index
    affine.store %arg1, %arg0[symbol(%0), symbol(%1)] : memref<5x5xf32>
    return
  }
  func.func private @_ZN3hls6streamIfLi4096EE5writeEf(memref<?x!llvm.struct<(i8)>>, f32) attributes {llvm.linkage = #llvm.linkage<external>}
  func.func @_Z29shift_pixels_up_7_MAX_WIDTH_3PA1024_A3_fi(%arg0: memref<7x1024x3xf32>, %arg1: i32) attributes {"code-line" = 26 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg1 : i32 to index
    affine.for %arg2 = 0 to 6 {
      affine.for %arg3 = 0 to 3 {
        %1 = affine.load %arg0[%arg2 + 1, symbol(%0), %arg3] : memref<7x1024x3xf32>
        affine.store %1, %arg0[%arg2, symbol(%0), %arg3] : memref<7x1024x3xf32>
      } {unroll = 0 : i32, "unroll-line" = 33 : i32}
    } {unroll = 0 : i32, "unroll-line" = 31 : i32}
    return
  }
  func.func private @_ZN3hls6streamIfLi4096EE4readEv(memref<?x!llvm.struct<(i8)>>) -> f32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func @_Z31insert_bottom_row_7_MAX_WIDTH_3PA1024_A3_fPfi(%arg0: memref<7x1024x3xf32>, %arg1: memref<3xf32>, %arg2: i32) attributes {"code-line" = 39 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = affine.load %arg1[0] : memref<3xf32>
    affine.store %1, %arg0[4, symbol(%0), 0] : memref<7x1024x3xf32>
    %2 = affine.load %arg1[1] : memref<3xf32>
    affine.store %2, %arg0[4, symbol(%0), 1] : memref<7x1024x3xf32>
    %3 = affine.load %arg1[2] : memref<3xf32>
    affine.store %3, %arg0[4, symbol(%0), 2] : memref<7x1024x3xf32>
    return
  }
  func.func @_Z23shift_pixels_left_1_7_3PA7_A3_f(%arg0: memref<1x7x3xf32>) attributes {"code-line" = 46 : i32, llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg1 = 0 to 6 {
      affine.for %arg2 = 0 to 3 {
        %0 = affine.load %arg0[0, %arg1 + 1, %arg2] : memref<1x7x3xf32>
        affine.store %0, %arg0[0, %arg1, %arg2] : memref<1x7x3xf32>
      } {unroll = 0 : i32, "unroll-line" = 53 : i32}
    } {unroll = 0 : i32, "unroll-line" = 51 : i32}
    return
  }
  func.func @_Z18insert_pixel_1_7_3PA7_A3_fPfii(%arg0: memref<1x7x3xf32>, %arg1: memref<3xf32>, %arg2: i32, %arg3: i32) attributes {"code-line" = 59 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = arith.index_cast %arg3 : i32 to index
    %2 = affine.load %arg1[0] : memref<3xf32>
    affine.store %2, %arg0[symbol(%0), symbol(%1), 0] : memref<1x7x3xf32>
    %3 = affine.load %arg1[1] : memref<3xf32>
    affine.store %3, %arg0[symbol(%0), symbol(%1), 1] : memref<1x7x3xf32>
    %4 = affine.load %arg1[2] : memref<3xf32>
    affine.store %4, %arg0[symbol(%0), symbol(%1), 2] : memref<1x7x3xf32>
    return
  }
  func.func @_Z29shift_pixels_up_3_MAX_WIDTH_6PA1024_A6_fi(%arg0: memref<3x1024x6xf32>, %arg1: i32) attributes {"code-line" = 66 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg1 : i32 to index
    affine.for %arg2 = 0 to 2 {
      affine.for %arg3 = 0 to 6 {
        %1 = affine.load %arg0[%arg2 + 1, symbol(%0), %arg3] : memref<3x1024x6xf32>
        affine.store %1, %arg0[%arg2, symbol(%0), %arg3] : memref<3x1024x6xf32>
      } {unroll = 0 : i32, "unroll-line" = 73 : i32}
    } {unroll = 0 : i32, "unroll-line" = 71 : i32}
    return
  }
  func.func @_Z31insert_bottom_row_3_MAX_WIDTH_6PA1024_A6_fPfi(%arg0: memref<3x1024x6xf32>, %arg1: memref<6xf32>, %arg2: i32) attributes {"code-line" = 79 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = affine.load %arg1[0] : memref<6xf32>
    affine.store %1, %arg0[2, symbol(%0), 0] : memref<3x1024x6xf32>
    %2 = affine.load %arg1[1] : memref<6xf32>
    affine.store %2, %arg0[2, symbol(%0), 1] : memref<3x1024x6xf32>
    %3 = affine.load %arg1[2] : memref<6xf32>
    affine.store %3, %arg0[2, symbol(%0), 2] : memref<3x1024x6xf32>
    %4 = affine.load %arg1[3] : memref<6xf32>
    affine.store %4, %arg0[2, symbol(%0), 3] : memref<3x1024x6xf32>
    %5 = affine.load %arg1[4] : memref<6xf32>
    affine.store %5, %arg0[2, symbol(%0), 4] : memref<3x1024x6xf32>
    %6 = affine.load %arg1[5] : memref<6xf32>
    affine.store %6, %arg0[2, symbol(%0), 5] : memref<3x1024x6xf32>
    return
  }
  func.func @_Z23shift_pixels_left_1_3_6PA3_A6_f(%arg0: memref<1x3x6xf32>) attributes {"code-line" = 89 : i32, llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 6 {
        %0 = affine.load %arg0[0, %arg1 + 1, %arg2] : memref<1x3x6xf32>
        affine.store %0, %arg0[0, %arg1, %arg2] : memref<1x3x6xf32>
      } {unroll = 0 : i32, "unroll-line" = 96 : i32}
    } {unroll = 0 : i32, "unroll-line" = 94 : i32}
    return
  }
  func.func @_Z18insert_pixel_1_3_6PA3_A6_fPfii(%arg0: memref<1x3x6xf32>, %arg1: memref<6xf32>, %arg2: i32, %arg3: i32) attributes {"code-line" = 102 : i32, llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = arith.index_cast %arg3 : i32 to index
    %2 = affine.load %arg1[0] : memref<6xf32>
    affine.store %2, %arg0[symbol(%0), symbol(%1), 0] : memref<1x3x6xf32>
    %3 = affine.load %arg1[1] : memref<6xf32>
    affine.store %3, %arg0[symbol(%0), symbol(%1), 1] : memref<1x3x6xf32>
    %4 = affine.load %arg1[2] : memref<6xf32>
    affine.store %4, %arg0[symbol(%0), symbol(%1), 2] : memref<1x3x6xf32>
    %5 = affine.load %arg1[3] : memref<6xf32>
    affine.store %5, %arg0[symbol(%0), symbol(%1), 3] : memref<1x3x6xf32>
    %6 = affine.load %arg1[4] : memref<6xf32>
    affine.store %6, %arg0[symbol(%0), symbol(%1), 4] : memref<1x3x6xf32>
    %7 = affine.load %arg1[5] : memref<6xf32>
    affine.store %7, %arg0[symbol(%0), symbol(%1), 5] : memref<1x3x6xf32>
    return
  }
}
