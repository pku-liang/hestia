// MINI_DATASET
#   define NI 16
#   define NJ 18
#   define NK 20
#   define NL 22
#   define NM 24
//// SMALL_DATASET
//#   define NI 40
//#   define NJ 50
//#   define NK 60
//#   define NL 70
//#   define NM 80
//// MEDIUM_DATASET
// #   define NI 180
// #   define NJ 190
// #   define NK 200
// #   define NL 210
// #   define NM 220
// LARGE_DATASET
// #   define NI 800
// #   define NJ 900
// #   define NK 1000
// #   define NL 1100
// #   define NM 1200
// EXTRALARGE_DATASET
//#   define NI 1600
//#   define NJ 1800
//#   define NK 2000
//#   define NL 2200
//#   define NM 2400

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

    DATA_TYPE E[NI][NJ];
    DATA_TYPE A[NI][NK];
    DATA_TYPE B[NK][NJ];
    DATA_TYPE F[NJ][NL];
    DATA_TYPE C[NJ][NM];
    DATA_TYPE D[NM][NL];
    DATA_TYPE G[NI][NL];
    int i, j, k;

    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) E[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++) A[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) B[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NJ; i++) for (j = 0; j < NL; j++) F[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NJ; i++) for (j = 0; j < NM; j++) C[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NM; i++) for (j = 0; j < NL; j++) D[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) G[i][j] = (DATA_TYPE)rand() / RAND_MAX * 2 - 1;

    // 列存
    system("mkdir -p data");
    FILE *file0 = fopen("data/mem0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) fprintf(file0, "%lf ", E[i][j]);
    fclose(file0);

    FILE *file1 = fopen("data/mem1.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NK; j++) fprintf(file1, "%lf ", A[i][j]);
    fclose(file1);

    FILE *file2 = fopen("data/mem2.txt", "w");
    for (i = 0; i < NK; i++) for (j = 0; j < NJ; j++) fprintf(file2, "%lf ", B[i][j]);
    fclose(file2);

    FILE *file3 = fopen("data/mem3.txt", "w");
    for (i = 0; i < NJ; i++) for (j = 0; j < NL; j++) fprintf(file3, "%lf ", F[i][j]);
    fclose(file3);

    FILE *file4 = fopen("data/mem4.txt", "w");
    for (i = 0; i < NJ; i++) for (j = 0; j < NM; j++) fprintf(file4, "%lf ", C[i][j]);
    fclose(file4);

    FILE *file5 = fopen("data/mem5.txt", "w");
    for (i = 0; i < NM; i++) for (j = 0; j < NL; j++) fprintf(file5, "%lf ", D[i][j]);
    fclose(file5);

    FILE *file6 = fopen("data/mem6.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file6, "%lf ", G[i][j]);
    fclose(file6);


    /* E := A*B */
    for (i = 0; i < NI; i++)
        for (j = 0; j < NJ; j++) {
            E[i][j] = SCALAR_VAL(0.0);
            for (k = 0; k < NK; ++k)
                E[i][j] += A[i][k] * B[k][j];
        }
    /* F := C*D */
    for (i = 0; i < NJ; i++)
        for (j = 0; j < NL; j++) {
            F[i][j] = SCALAR_VAL(0.0);
            for (k = 0; k < NM; ++k)
                F[i][j] += C[i][k] * D[k][j];
        }
    /* G := E*F */
    for (i = 0; i < NI; i++)
        for (j = 0; j < NL; j++) {
            G[i][j] = SCALAR_VAL(0.0);
            for (k = 0; k < NJ; ++k)
                G[i][j] += E[i][k] * F[k][j];
        }

    // 输出
    FILE *file_results = fopen("data/results.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file_results, "%lf ", G[i][j]);
    fclose(file_results);

    FILE *file_output0 = fopen("data/output0.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NJ; j++) fprintf(file_output0, "%lf ", E[i][j]);
    fclose(file_output0);

    FILE *file_output1 = fopen("data/output1.txt", "w");
    for (i = 0; i < NJ; i++) for (j = 0; j < NL; j++) fprintf(file_output1, "%lf ", F[i][j]);
    fclose(file_output1);

    FILE *file_output2 = fopen("data/output2.txt", "w");
    for (i = 0; i < NI; i++) for (j = 0; j < NL; j++) fprintf(file_output2, "%lf ", G[i][j]);
    fclose(file_output2);

    return 1;
}
