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

void kernel_syrk(

    DATA_TYPE C[N][N], DATA_TYPE A[N][M]) {
    int i, j, k;

// BLAS PARAMS
// TRANS = 'N'
// UPLO  = 'L'
//  =>  Form  C := 12*A*A**T + 45*C.
// A is NxM
// C is NxN
#pragma scop
    for (i = 0; i < N; i++) {
        for (j = 0; j <= i; j++)
            C[i][j] *= 45;
        for (k = 0; k < M; k++) {
            for (j = 0; j <= i; j++)
                C[i][j] += 12 * A[i][k] * A[j][k];
        }
    }
#pragma endscop
}
