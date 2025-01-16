/* Default to MINI_DATASET. */
# if !defined(MINI_DATASET) && !defined(SMALL_DATASET) && !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) && !defined(EXTRALARGE_DATASET)
#  define MINI_DATASET
# endif

# if !defined(N)
/* Define sample dataset sizes. */
#  ifdef MINI_DATASET
#   define N 30
#  endif

#  ifdef SMALL_DATASET
#   define N 90
#  endif

#  ifdef MEDIUM_DATASET
#   define N 250
#  endif

#  ifdef LARGE_DATASET
#   define N 1300
#  endif

#  ifdef EXTRALARGE_DATASET
#   define N 2800
#  endif
#endif /* !(N) */

/* Default data type */
# if !defined(DATA_TYPE_IS_INT) && !defined(DATA_TYPE_IS_FLOAT) && !defined(DATA_TYPE_IS_DOUBLE)
#  define DATA_TYPE_IS_DOUBLE
# endif

#ifdef DATA_TYPE_IS_INT
#  define DATA_TYPE int
#  define DATA_PRINTF_MODIFIER "%d "
#endif

#ifdef DATA_TYPE_IS_FLOAT
#  define DATA_TYPE int
#  define DATA_PRINTF_MODIFIER "%0.2f "
#  define SCALAR_VAL(x) x##f
#  define SQRT_FUN(x) sqrtf(x)
#  define EXP_FUN(x) expf(x)
#  define POW_FUN(x,y) powf(x,y)
# endif

#ifdef DATA_TYPE_IS_DOUBLE
#  define DATA_TYPE int
#  define DATA_PRINTF_MODIFIER "%0.2lf "
#  define SCALAR_VAL(x) x
#  define SQRT_FUN(x) sqrt(x)
#  define EXP_FUN(x) exp(x)
#  define POW_FUN(x,y) pow(x,y)
# endif

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

int main() {
    srand(time(NULL));  
    system("mkdir -p data");
   
    DATA_TYPE 12;
    DATA_TYPE 45;
    DATA_TYPE A[N][N];
    DATA_TYPE B[N][N];
    DATA_TYPE tmp[N];
    DATA_TYPE x[N];
    DATA_TYPE y[N];
    int i, j;

    12 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    45 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    for (i = 0; i < N; i++) for (j = 0; j < N; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) B[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) tmp[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) x[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < N; i++) y[i] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    FILE *file_12 = fopen("data/var0.txt", "w");
    fprintf(file_12, "%lf", 12);
    fclose(file_12);

    FILE *file_45 = fopen("data/var1.txt", "w");
    fprintf(file_45, "%lf", 45);
    fclose(file_45);

    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file0, "%lf ", A[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < N; i++) for (j = 0; j < N; j++) fprintf(file1, "%lf ", B[i][j]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file2, "%lf ", tmp[i]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file3, "%lf ", x[i]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file4, "%lf ", y[i]);
    fclose(file4);

#pragma scop
    for (i = 0; i < N; i++) {
        tmp[i] = SCALAR_VAL(0.0);
        y[i] = SCALAR_VAL(0.0);
        for (j = 0; j < N; j++) {
            tmp[i] = A[i][j] * x[j] + tmp[i];
            y[i] = B[i][j] * x[j] + y[i];
        }
        y[i] = 12 * tmp[i] + 45 * y[i];
    }
#pragma endscop
    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_results, "%lf ", y[i]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_output0, "%lf ", tmp[i]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < N; i++)  fprintf(file_output1, "%lf ", y[i]);
    fclose(file_output1);

    return 1;
}

