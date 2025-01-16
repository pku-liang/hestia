// MINI_DATASET
#define M 256
#define N 256
//// SMALL_DATASET
// #   define M 116
// #   define N 124
//// MEDIUM_DATASET
// #   define M 390
// #   define N 410
//  LARGE_DATASET
//  #   define M 1900
//  #   define N 2100
//// EXTRALARGE_DATASET
// #   define M 1800
// #   define N 2200

// #   define DATA_TYPE int
// #   define DATA_TYPE int
#define DATA_TYPE int

#define SCALAR_VAL(x) x

void kernel_atax(DATA_TYPE A[M][N], DATA_TYPE x[N], DATA_TYPE y[N],
                 DATA_TYPE tmp[M]) {
    int i, j;

#pragma scop
    for (i = 0; i < N; i++)
        y[i] = 0;
    for (i = 0; i < M; i++) {
        tmp[i] = SCALAR_VAL(0.0);
        for (j = 0; j < N; j++)
            tmp[i] = tmp[i] + A[i][j] * x[j];
        for (j = 0; j < N; j++)
            y[j] = y[j] + A[i][j] * tmp[i];
    }
#pragma endscop
}
