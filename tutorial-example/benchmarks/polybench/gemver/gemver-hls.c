#define N 256 // MINI_DATASET
// #define N 120  // SMALL_DATASET
// #define N 400  // MEDIUM_DATASET
//  #define N 2000  // LARGE_DATASET
// #define N 4000  // EXTRALARGE_DATASET

// #define DATA_TYPE int
// #define DATA_TYPE int
#define DATA_TYPE int

/* Main computational kernel. The whole function will be timed, including the
 * call and return. */
void kernel_gemver(DATA_TYPE A[N][N], DATA_TYPE u1[N], DATA_TYPE v1[N],
                   DATA_TYPE u2[N], DATA_TYPE v2[N], DATA_TYPE w[N],
                   DATA_TYPE x[N], DATA_TYPE y[N], DATA_TYPE z[N]) {
    int i, j;

#pragma scop

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            A[i][j] = A[i][j] + u1[i] * v1[j] + u2[i] * v2[j];

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            x[i] = x[i] + 45 * A[j][i] * y[j];

    for (i = 0; i < N; i++)
        x[i] = x[i] + z[i];

    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            w[i] = w[i] + 12 * A[i][j] * x[j];

#pragma endscop
}
