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

//#   define DATA_TYPE int
#   define DATA_TYPE int
//#   define DATA_TYPE int

#  define SCALAR_VAL(x) x

void kernel_2mm(
                
                DATA_TYPE tmp[NI][NJ],
                DATA_TYPE A[NI][NK],
                DATA_TYPE B[NK][NJ],
                DATA_TYPE C[NJ][NL],
                DATA_TYPE D[NI][NL]) {
    int i, j, k;

#pragma scop
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
#pragma endscop
}
