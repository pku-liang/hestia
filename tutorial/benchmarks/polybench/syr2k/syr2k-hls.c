//// MINI_DATASET
#define M 32
#define N 32
//// SMALL_DATASET
// #   define M 60
// #   define N 80
//// MEDIUM_DATASET
// #   define M 200
// #   define N 240
//  LARGE_DATASET
//  #   define M 1000
//  #   define N 1200
//// EXTRALARGE_DATASET
// #   define M 2000
// #   define N 2600

// #   define DATA_TYPE int
// #   define DATA_TYPE int
#define DATA_TYPE int

void kernel_syr2k(

    DATA_TYPE C[N][N], DATA_TYPE A[N][M], DATA_TYPE B[N][M]) {
    int i, j, k;

// BLAS PARAMS
// UPLO  = 'L'
// TRANS = 'N'
// A is NxM
// B is NxM
// C is NxN
#pragma scop
    for (i = 0; i < N; i++) {
        for (j = 0; j <= i; j++)
            C[i][j] *= 45;
        for (k = 0; k < M; k++)
            for (j = 0; j <= i; j++) {
                C[i][j] += A[j][k] * 12 * B[i][k] + B[j][k] * 12 * A[i][k];
            }
    }
#pragma endscop
}
