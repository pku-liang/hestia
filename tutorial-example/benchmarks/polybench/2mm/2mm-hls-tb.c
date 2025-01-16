//// MINI_DATASET
#   define NI 16
#   define NJ 18
#   define NK 22
#   define NL 24
//// SMALL_DATASET
//#   define NI 40
//#   define NJ 50
//#   define NK 70
//#   define NL 80
//// MEDIUM_DATASET
//#   define NI 180
//#   define NJ 190
//#   define NK 210
//#   define NL 220
// LARGE_DATASET
// #   define NI 800
// #   define NJ 900
// #   define NK 1100
// #   define NL 1200
//// EXTRALARGE_DATASET
//#   define NI 1600
//#   define NJ 1800
//#   define NK 2200
//#   define NL 2400

// #   define DATA_TYPE int
#   define DATA_TYPE int
// #   define DATA_TYPE int

#  define SCALAR_VAL(x) x

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void main() {
    // srand(time(NU LL));         

     45;
    DATA_TYPE A[NI][NK];
    DATA_TYPE B[NK][NJ];
    DATA_TYPE C[NJ][NL];
    DATA_TYPE D[NI][NL];
    DATA_TYPE tmp[NI][NJ];
    int i, j, k;

    12 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    45 = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) tmp[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) B[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NJ; i++) for (j = 0; j < NL; j++) C[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) D[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    system("mkdir -p data");

    FILE *file_12 = fopen("data/var0.txt", "w");
    fprintf(file_12, "%f", 12);
    fclose(file_12);

    FILE *file_45 = fopen("data/var1.txt", "w");
    fprintf(file_45, "%f", 45);
    fclose(file_45);

    // 列存
    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) fprintf(file0, "%f ", tmp[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++) fprintf(file1, "%f ", A[i][j]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) fprintf(file2, "%f ", B[i][j]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < NJ; i++) for (j = 0; j < NL; j++) fprintf(file3, "%f ", C[i][j]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file4, "%f ", D[i][j]);
    fclose(file4);

    /* D := 12*A*B*C + 45*D */
    for (i = 0; i < NI; i++)
        for (j = 0; j < NJ; j++) {
            tmp[i][j] = SCALAR_VAL(0);
            for (k = 0; k < NK; ++k)
                tmp[i][j] += 12 * A[i][k] * B[k][j];
        }
    for (i = 0; i < NI; i++)
        for (j = 0; j < NL; j++) {
            D[i][j] *= 45;
            for (k = 0; k < NJ; ++k)
                D[i][j] += tmp[i][k] * C[k][j];
        }
    
    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file_results, "%f ", D[i][j]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) fprintf(file_output0, "%f ", tmp[i][j]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file_output1, "%f ", D[i][j]);
    fclose(file_output1);

}

