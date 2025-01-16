#define NI 64
#define NJ 32
#define NK 1
#define NL 16
#define DATA_TYPE int
#define SCALAR_VAL(x) x
void kernel_2mm(DATA_TYPE A[NI][NK], DATA_TYPE B[NK][NJ], DATA_TYPE C[NJ][NL],
                DATA_TYPE D[NI][NL], DATA_TYPE tmp[NI][NJ]) {
#pragma HLS array_partition type = cyclic dim = 2 variable = tmp factor = 4
#pragma scop
    DATA_TYPE alpha = 6, beta = 7;
    int i, j, k;
    for (i = 0; i < NI; i++)
        for (j = 0; j < NJ; j++) {
#pragma HLS unroll factor = 4
            tmp[i][j] = SCALAR_VAL(0);
            for (k = 0; k < NK; ++k) {
#pragma HLS unroll
                tmp[i][j] += alpha * A[i][k] * B[k][j];
            }
        }
    for (i = 0; i < NI; i++) {
        for (j = 0; j < NL; j++) {
            D[i][j] *= beta;
            for (k = 0; k < NJ; ++k) {
#pragma HLS unroll factor = 4
                D[i][j] += tmp[i][k] * C[k][j];
            }
        }
    }
#pragma endscop
}
