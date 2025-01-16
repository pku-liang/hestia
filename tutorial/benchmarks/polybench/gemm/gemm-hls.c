/* Main computational kernel. The whole function will be timed,
   including the call and return. */
#define NI 32
#define NK 64
#define NJ 32
#define DATA_TYPE int

void kernel_gemm(DATA_TYPE C[NI][NJ], DATA_TYPE A[NI][NK],
                 DATA_TYPE B[NK][NJ]) {
    int i, j, k;
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
}
