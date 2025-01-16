//// MINI_DATASET
#   define N 40
//// SMALL_DATASET
//#   define N 120
//// MEDIUM_DATASET
//#   define N 400
// LARGE_DATASET
// #   define N 2000
//// EXTRALARGE_DATASET
//#   define N 4000

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
   
    DATA_TYPE x1[N];
    DATA_TYPE x2[N];
    DATA_TYPE y_1[N];
    DATA_TYPE y_2[N];
    DATA_TYPE A[N][N];
    int i, j;

    for (i = 0; i < N; i++)  x1[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  x2[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  y_1[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  y_2[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < N; i++) fprintf(file0, "%lf ", x1[i]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file1, "%lf ", x2[i]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file2, "%lf ", y_1[i]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file3, "%lf ", y_2[i]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++)  fprintf(file4, "%lf ", A[i][j]);
    fclose(file4);

#pragma scop
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x1[i] = x1[i] + A[i][j] * y_1[j];
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x2[i] = x2[i] + A[j][i] * y_2[j];
#pragma endscop

    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_results, "%lf ", x2[i]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < N; i++) fprintf(file_output0, "%lf ", x1[i]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_output1, "%lf ", x2[i]);
    fclose(file_output1);

    return 1;
}
