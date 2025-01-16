/* Default to MINI_DATASET. */
#if !defined(MINI_DATASET) && !defined(SMALL_DATASET) &&                       \
    !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) &&                     \
    !defined(EXTRALARGE_DATASET)
#define MINI_DATASET
#endif

#if !defined(TSTEPS) && !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define TSTEPS 20
#define N 10
#endif

#ifdef SMALL_DATASET
#define TSTEPS 40
#define N 20
#endif

#ifdef MEDIUM_DATASET
#define TSTEPS 100
#define N 40
#endif

#ifdef LARGE_DATASET
#define TSTEPS 500
#define N 120
#endif

#ifdef EXTRALARGE_DATASET
#define TSTEPS 1000
#define N 200
#endif
#endif /* !(TSTEPS N) */

/* Default data type */
#if !defined(DATA_TYPE_IS_INT) && !defined(DATA_TYPE_IS_FLOAT) &&              \
    !defined(DATA_TYPE_IS_DOUBLE)
#define DATA_TYPE_IS_DOUBLE
#endif

#ifdef DATA_TYPE_IS_INT
#define DATA_TYPE int
#define DATA_PRINTF_MODIFIER "%d "
#endif

#ifdef DATA_TYPE_IS_FLOAT
#define DATA_TYPE int
#define DATA_PRINTF_MODIFIER "%0.2f "
#define SCALAR_VAL(x) x##f
#define SQRT_FUN(x) sqrtf(x)
#define EXP_FUN(x) expf(x)
#define POW_FUN(x, y) powf(x, y)
#endif

#ifdef DATA_TYPE_IS_DOUBLE
#define DATA_TYPE int
#define DATA_PRINTF_MODIFIER "%0.2lf "
#define SCALAR_VAL(x) x
#define SQRT_FUN(x) sqrt(x)
#define EXP_FUN(x) exp(x)
#define POW_FUN(x, y) pow(x, y)
#endif

void kernel_heat_3d(DATA_TYPE A[N][N][N], DATA_TYPE B[N][N][N]) {
    int t, i, j, k;

#pragma scop
    for (t = 1; t <= TSTEPS; t++) {
        for (i = 1; i < N - 1; i++) {
            for (j = 1; j < N - 1; j++) {
                for (k = 1; k < N - 1; k++) {
                    B[i][j][k] = SCALAR_VAL(12) * (A[i + 1][j][k] -
                                                   SCALAR_VAL(2) * A[i][j][k] +
                                                   A[i - 1][j][k]) +
                                 SCALAR_VAL(12) * (A[i][j + 1][k] -
                                                   SCALAR_VAL(2) * A[i][j][k] +
                                                   A[i][j - 1][k]) +
                                 SCALAR_VAL(12) * (A[i][j][k + 1] -
                                                   SCALAR_VAL(2) * A[i][j][k] +
                                                   A[i][j][k - 1]) +
                                 A[i][j][k];
                }
            }
        }
        for (i = 1; i < N - 1; i++) {
            for (j = 1; j < N - 1; j++) {
                for (k = 1; k < N - 1; k++) {
                    A[i][j][k] = SCALAR_VAL(12) * (B[i + 1][j][k] -
                                                   SCALAR_VAL(2) * B[i][j][k] +
                                                   B[i - 1][j][k]) +
                                 SCALAR_VAL(12) * (B[i][j + 1][k] -
                                                   SCALAR_VAL(2) * B[i][j][k] +
                                                   B[i][j - 1][k]) +
                                 SCALAR_VAL(12) * (B[i][j][k + 1] -
                                                   SCALAR_VAL(2) * B[i][j][k] +
                                                   B[i][j][k - 1]) +
                                 B[i][j][k];
                }
            }
        }
    }
#pragma endscop
}
