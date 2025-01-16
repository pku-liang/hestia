#define N 16
#define DATA_TYPE int

void kernel_syr2k(DATA_TYPE C[N][N], DATA_TYPE A[N][N], DATA_TYPE B[N][N]) {
    int i, j, k;
    DATA_TYPE alpha = 12;
    DATA_TYPE beta = 34;

    // BLAS PARAMS
    // UPLO  = 'L'
    // TRANS = 'N'
    // A is NxM
    // B is NxM
    // C is NxN
#pragma scop
    for (i = 0; i < N; i++) {
        for (j = 0; j <= i; j++) {
            C[i][j] *= beta;
        }
        for (k = 0; k < N; k++)
            for (j = 0; j <= i; j++) {
                C[i][j] +=
                    A[j][k] * alpha * B[i][k] + B[j][k] * alpha * A[i][k];
            }
    }
#pragma endscop
}
