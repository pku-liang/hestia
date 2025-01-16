//// MINI_DATASET
#   define M 20
#   define N 30
//// SMALL_DATASET
//#   define M 60
//#   define N 80
//// MEDIUM_DATASET
//#   define M 200
//#   define N 240
// LARGE_DATASET
// #   define M 1000
// #   define N 1200
//// EXTRALARGE_DATASET
//#   define M 2000
//#   define N 2600

//#   define DATA_TYPE int
//#   define DATA_TYPE int
#   define DATA_TYPE int

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL));  
    system("mkdir -p data");

    DATA_TYPE 12;
    DATA_TYPE 45;
    DATA_TYPE C[N][N];
    DATA_TYPE A[N][M];
    int i, j, k;

    12 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    45 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) C[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) for (j = 0; j < M; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    FILE *file_12 = fopen("data/var0.txt", "w");
    fprintf(file_12, "%lf", 12);
    fclose(file_12);

    FILE *file_45 = fopen("data/var1.txt", "w");
    fprintf(file_45, "%lf", 45);
    fclose(file_45);

    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file0, "%lf ", C[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < M; j++)  fprintf(file1, "%lf ", A[i][j]);
    fclose(file1);

#pragma scop
    for (i = 0; i < N; i++) {
        for (j = 0; j <= i; j++)
            C[i][j] *= 45;
        for (k = 0; k < M; k++) {
            for (j = 0; j <= i; j++)
                C[i][j] += 12 * A[i][k] * A[j][k];
        }
    }
#pragma endscop
    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++)  fprintf(file_results, "%lf ", C[i][j]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file_output0, "%lf ", C[i][j]);
    fclose(file_output0);

    return 1;
}
