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
#define N 30
#endif

#ifdef SMALL_DATASET
#define TSTEPS 40
#define N 90
#endif

#ifdef MEDIUM_DATASET
#define TSTEPS 100
#define N 250
#endif

#ifdef LARGE_DATASET
#define TSTEPS 500
#define N 1300
#endif

#ifdef EXTRALARGE_DATASET
#define TSTEPS 1000
#define N 2800
#endif

#endif /* !(TSTEPS N) */

#define _PB_TSTEPS POLYBENCH_LOOP_BOUND(TSTEPS, tsteps)
#define _PB_N POLYBENCH_LOOP_BOUND(N, n)

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

void kernel_jacobi_2d(DATA_TYPE A[N][N], DATA_TYPE B[N][N]) {
    int t, i, j;

#pragma scop
    for (t = 0; t < TSTEPS; t++) {
        for (i = 1; i < N - 1; i++)
            for (j = 1; j < N - 1; j++)
                B[i][j] = SCALAR_VAL(2) * (A[i][j] + A[i][j - 1] + A[i][1 + j] +
                                           A[1 + i][j] + A[i - 1][j]);
        for (i = 1; i < N - 1; i++)
            for (j = 1; j < N - 1; j++)
                A[i][j] = SCALAR_VAL(2) * (B[i][j] + B[i][j - 1] + B[i][1 + j] +
                                           B[1 + i][j] + B[i - 1][j]);
    }
#pragma endscop
}
