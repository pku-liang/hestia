//// MINI_DATASET
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

void kernel_bicg(DATA_TYPE A[N][M], DATA_TYPE s[M], DATA_TYPE q[N],
                 DATA_TYPE p[M], DATA_TYPE r[N]) {
    int i, j;

#pragma scop
    for (i = 0; i < M; i++)
        s[i] = 0;
    for (i = 0; i < N; i++) {
        q[i] = SCALAR_VAL(0.0);
        for (j = 0; j < M; j++) {
            s[j] = s[j] + r[i] * A[i][j];
            q[i] = q[i] + A[i][j] * p[j];
        }
    }
#pragma endscop
}
