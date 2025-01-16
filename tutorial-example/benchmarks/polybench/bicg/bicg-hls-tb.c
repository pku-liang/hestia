//// MINI_DATASET
#   define M 38
#   define N 42
//// SMALL_DATASET
//#   define M 116
//#   define N 124
//// MEDIUM_DATASET
//#   define M 390
//#   define N 410
// LARGE_DATASET
// #   define M 1900
// #   define N 2100
//// EXTRALARGE_DATASET
//#   define M 1800
//#   define N 2200

//#   define DATA_TYPE int
//#   define DATA_TYPE int
#   define DATA_TYPE int

#  define SCALAR_VAL(x) x

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL)); 

    DATA_TYPE A[N][M];
    DATA_TYPE s[M];
    DATA_TYPE q[N];
    DATA_TYPE p[M];
    DATA_TYPE r[N];
    int i, j;

    for (i = 0; i < N; i++) for (j = 0; j < M; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < M; i++)                         s[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)                         q[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < M; i++)                         p[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)                         r[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    // 列存
    system("mkdir -p data");
    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < M; j++)   fprintf(file0, "%lf ", A[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < M; i++)                            fprintf(file1, "%lf ", s[i]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < N; i++)                            fprintf(file2, "%lf ", q[i]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < M; i++)                            fprintf(file3, "%lf ", p[i]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < N; i++)                            fprintf(file4, "%lf ", r[i]);
    fclose(file4);

#pragma scop
    for (i = 0; i < M; i++)
        s[i] = 0;
    for (i = 0; i < N; i++) {
        q[i] = SCALAR_VAL(0.0);
        for (j = 0; j < M; j++) {
            s[j] = s[j] + r[i] * A[i][j];
            q[i] = q[i] + A[i][j] * p[j];
        }
    }
#pragma endscop
    
    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < N; i++) fprintf(file_results, "%lf ", q[i]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < M; i++) fprintf(file_output0, "%lf ", s[i]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < N; i++) fprintf(file_output1, "%lf ", q[i]);
    fclose(file_output1);

    return 1;

}

