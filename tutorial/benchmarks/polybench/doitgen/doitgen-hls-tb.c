//// MINI_DATASET
#   define NQ 8
#   define NR 10
#   define NP 12
//// SMALL_DATASET
//#   define NQ 20
//#   define NR 25
//#   define NP 30
//// MEDIUM_DATASET
//#   define NQ 40
//#   define NR 50
//#   define NP 60
// LARGE_DATASET
// #   define NQ 140
// #   define NR 150
// #   define NP 160
//// EXTRALARGE_DATASET
//#   define NQ 220
//#   define NR 250
//#   define NP 270

//#   define DATA_TYPE int
//#   define DATA_TYPE int
#   define DATA_TYPE int

#  define SCALAR_VAL(x) x##f

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL));  
    system("mkdir -p data");
   
    DATA_TYPE A[NR][NQ][NP];
    DATA_TYPE C4[NP][NP];
    DATA_TYPE sum[NP];
    int r, q, p, s;

    int i, j, k;
    for (i = 0; i < NR; i++) for (j = 0; j < NQ; j++) for (k = 0; k < NP; k++) A[i][j][k] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NP; i++) for (j = 0; j < NP; j++) C4[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NP; i++) sum[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    // 列存
    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < NR; i++) for (j = 0; j < NQ; j++) for (k = 0; k < NP; k++)  fprintf(file0, "%lf ", A[i][j][k]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < NP; i++) for (j = 0; j < NP; j++)  fprintf(file1, "%lf ", C4[i][j]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < NP; i++) fprintf(file2, "%lf ", sum[i]);
    fclose(file2);

#pragma scop
    for (r = 0; r < NR; r++)
        for (q = 0; q < NQ; q++) {
            for (p = 0; p < NP; p++) {
                sum[p] = SCALAR_VAL(0.0);
                for (s = 0; s < NP; s++)
                    sum[p] += A[r][q][s] * C4[s][p];
            }
            for (p = 0; p < NP; p++)
                A[r][q][p] = sum[p];
        }
#pragma endscop

    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < NR; i++) for (j = 0; j < NQ; j++) for (k = 0; k < NP; k++)  fprintf(file_results, "%lf ", A[i][j][k]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < NR; i++) for (j = 0; j < NQ; j++) for (k = 0; k < NP; k++) fprintf(file_output0, "%lf ", A[i][j][k]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < NP; i++)  fprintf(file_output1, "%lf ",  sum[i]);
    fclose(file_output1);

    return 1;
}
