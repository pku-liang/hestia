#ifndef UTILS_H
#define UTILS_H
#include "optical_flow_c.h"

typedef unsigned int HLS_SIZE_T;

void shift_pixels_left_5_5(input_t val[5][5]) {
#pragma HLS inline

    HLS_SIZE_T i, j;
    for (i = 0; i < 5; i++) {
#pragma HLS unroll
        for (j = 0; j < 5 - 1; j++) {
#pragma HLS unroll
            val[i][j] = val[i][j + 1];
        }
    }
}

void insert_pixel_5_5(input_t val[5][5], pixel_t value, int row, int col) {
#pragma HLS inline
    val[row][col] = value;
}


void shift_pixels_up_7_MAX_WIDTH_3(pixel_t val[7][MAX_WIDTH][3], int col) {
#pragma HLS inline

    HLS_SIZE_T i, j, k;
    for (i = 0; i < 7 - 1; i++) {
#pragma HLS unroll
        for (k = 0; k < 3; k++) {
#pragma HLS unroll
            val[i][col][k] = val[i + 1][col][k];
        }
    }
}

void insert_bottom_row_7_MAX_WIDTH_3(pixel_t val[7][MAX_WIDTH][3], pixel_t tmp[3], int col) {
#pragma HLS inline
    val[5 - 1][col][0] = tmp[0];
    val[5 - 1][col][1] = tmp[1];
    val[5 - 1][col][2] = tmp[2];
}

void shift_pixels_left_1_7_3(pixel_t val[1][7][3]) {
#pragma HLS inline

    HLS_SIZE_T j,k;
        for (j = 0; j < 7 - 1; j++) {
#pragma HLS unroll
            for (k = 0; k < 3; k++) {
#pragma HLS unroll
            val[0][j][k] = val[0][j + 1][k];
        }
    }
}

void insert_pixel_1_7_3(pixel_t val[1][7][3], pixel_t value[3], int row, int col) {
#pragma HLS inline
    val[row][col][0] = value[0];
    val[row][col][1] = value[1];
    val[row][col][2] = value[2];
}

void shift_pixels_up_3_MAX_WIDTH_6(pixel_t val[3][MAX_WIDTH][6], int col) {
#pragma HLS inline

    HLS_SIZE_T i, j, k;
    for (i = 0; i < 3 - 1; i++) {
#pragma HLS unroll
        for (k = 0; k < 6; k++) {
#pragma HLS unroll
            val[i][col][k] = val[i + 1][col][k];
        }
    }
}

void insert_bottom_row_3_MAX_WIDTH_6(pixel_t val[3][MAX_WIDTH][6], pixel_t tmp[6], int col) {
#pragma HLS inline
    val[3 - 1][col][0] = tmp[0];
    val[3 - 1][col][1] = tmp[1];
    val[3 - 1][col][2] = tmp[2];
    val[3 - 1][col][3] = tmp[3];
    val[3 - 1][col][4] = tmp[4];
    val[3 - 1][col][5] = tmp[5];
}

void shift_pixels_left_1_3_6(pixel_t val[1][3][6]) {
#pragma HLS inline

    HLS_SIZE_T j,k;
        for (j = 0; j < 3 - 1; j++) {
#pragma HLS unroll
            for (k = 0; k < 6; k++) {
#pragma HLS unroll
            val[0][j][k] = val[0][j + 1][k];
        }
    }
}

void insert_pixel_1_3_6(pixel_t val[1][3][6], pixel_t value[6], int row, int col) {
#pragma HLS inline
    val[row][col][0] = value[0];
    val[row][col][1] = value[1];
    val[row][col][2] = value[2];
    val[row][col][3] = value[3];
    val[row][col][4] = value[4];
    val[row][col][5] = value[5];
}

#endif