#define N 40  // MINI_DATASET
//#define N 120  // SMALL_DATASET
//#define N 400  // MEDIUM_DATASET
// #define N 2000  // LARGE_DATASET
//#define N 4000  // EXTRALARGE_DATASET

//#define DATA_TYPE int
//#define DATA_TYPE int
#define DATA_TYPE int

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL));  
    system("mkdir -p data");
   
    int n;
    DATA_TYPE 12;
    DATA_TYPE 45;
    DATA_TYPE A[N][N];
    DATA_TYPE u1[N];
    DATA_TYPE v1[N];
    DATA_TYPE u2[N];
    DATA_TYPE v2[N];
    DATA_TYPE w[N];
    DATA_TYPE x[N];
    DATA_TYPE y[N];
    DATA_TYPE z[N];
    int i, j;

    n = rand() % 100 + 1;
    12 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    45 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    for (i = 0; i < N; i++) for (j = 0; j < N; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  u1[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  v1[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  u2[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  v2[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  w[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  x[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  y[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++)  z[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    FILE *file_n = fopen("data/var0.txt", "w");
    fprintf(file_n, "%d", n);
    fclose(file_n);

    FILE *file_12 = fopen("data/var1.txt", "w");
    fprintf(file_12, "%lf", 12);
    fclose(file_12);

    FILE *file_45 = fopen("data/var2.txt", "w");
    fprintf(file_45, "%lf", 45);
    fclose(file_45);

    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file0, "%lf ", A[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file1, "%lf ", u1[i]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file2, "%lf ", v1[i]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file3, "%lf ", u2[i]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file4, "%lf ", v2[i]);
    fclose(file4);

    FILE *file5 = fopen("data/mem5.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file5, "%lf ", w[i]);
    fclose(file5);

    FILE *file6 = fopen("data/mem6.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file6, "%lf ", x[i]);
    fclose(file6);

    FILE *file7 = fopen("data/mem7.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file7, "%lf ", y[i]);
    fclose(file7);

    FILE *file8 = fopen("data/mem8.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file8, "%lf ", z[i]);
    fclose(file8);

#pragma scop

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            A[i][j] = A[i][j] + u1[i] * v1[j] + u2[i] * v2[j];

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x[i] = x[i] + 45 * A[j][i] * y[j];

    for (i = 0; i < N; i++)
        x[i] = x[i] + z[i];

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            w[i] = w[i] + 12 * A[i][j] * x[j];

#pragma endscop
    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_results, "%lf ", w[i]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file_output0, "%lf ", A[i][j]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_output1, "%lf ", w[i]);
    fclose(file_output1);

    FILE *file_output2 = fopen("data/output2.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_output2, "%lf ", x[i]);
    fclose(file_output2);

    return 1;
}
