//// MINI_DATASET
#define N 256
//// SMALL_DATASET
// #   define N 120
//// MEDIUM_DATASET
// #   define N 400
//  LARGE_DATASET
//  #   define N 2000
//// EXTRALARGE_DATASET
// #   define N 4000

// #   define DATA_TYPE int
// #   define DATA_TYPE int
#define DATA_TYPE int

void kernel_mvt(DATA_TYPE x1[N], DATA_TYPE x2[N], DATA_TYPE y_1[N],
                DATA_TYPE y_2[N], DATA_TYPE A[N][N]) {
    int i, j;

#pragma scop
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x1[i] = x1[i] + A[i][j] * y_1[j];
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x2[i] = x2[i] + A[j][i] * y_2[j];
#pragma endscop
}
