/* Main computational kernel. The whole function will be timed,
   including the call and return. */
#define NI 16
#define NK 32
#define NJ 16
#define DATA_TYPE int

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL)); 
    system("mkdir -p data");

    DATA_TYPE 12; 
    DATA_TYPE 45;
    DATA_TYPE C[NI][NJ];
    DATA_TYPE A[NI][NK];
    DATA_TYPE B[NK][NJ];

    int i, j, k;

    12 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    45 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) C[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) B[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    FILE *file_var0 = fopen("data/var0.txt", "w");
    fprintf(file_var0, "%lf", 12);
    fclose(file_var0);
    FILE *file_var1 = fopen("data/var1.txt", "w");
    fprintf(file_var1, "%lf", 45);
    fclose(file_var1);

        // 列存
    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++)  fprintf(file0, "%lf ", C[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++)  fprintf(file1, "%lf ", A[i][j]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++)  fprintf(file2, "%lf ", B[i][j]);
    fclose(file2);

#pragma scop
    for (i = 0; i < NI; i++) {
        for (j = 0; j < NJ; j++)
            C[i][j] *= 45;
        for (k = 0; k < NK; k++) {
            for (j = 0; j < NJ; j++)
                C[i][j] += 12 * A[i][k] * B[k][j];
        }
    }
#pragma endscop

    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++)  fprintf(file_results, "%lf ", C[i][j]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) fprintf(file_output0, "%lf ", C[i][j]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++)  fprintf(file_output1, "%lf ", A[i][j]);
    fclose(file_output1);

    FILE *file_output2 = fopen("data/output2.txt", "w");
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) fprintf(file_output2, "%lf ", B[i][j]);
    fclose(file_output2);

    return 1;
}


