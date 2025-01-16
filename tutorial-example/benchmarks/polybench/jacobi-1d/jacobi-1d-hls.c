/* Default to MINI_DATASET. */
#if !defined(MINI_DATASET) && !defined(SMALL_DATASET) &&                       \
    !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) &&                     \
    !defined(EXTRALARGE_DATASET)
#define MINI_DATASET
#endif

#if !defined(TSTEPS) && !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define TSTEPS 150
#define N 256
#endif

#ifdef SMALL_DATASET
#define TSTEPS 40
#define N 120
#endif

#ifdef MEDIUM_DATASET
#define TSTEPS 100
#define N 400
#endif

#ifdef LARGE_DATASET
#define TSTEPS 500
#define N 2000
#endif

#ifdef EXTRALARGE_DATASET
#define TSTEPS 1000
#define N 4000
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

void kernel_jacobi_1d(DATA_TYPE A[N], DATA_TYPE B[N]) {
    int t, i;

#pragma scop
    for (t = 0; t < TSTEPS; t++) {
        for (i = 1; i < N - 1; i++)
            B[i] = 3 * (A[i - 1] + A[i] + A[i + 1]);
        for (i = 1; i < N - 1; i++)
            A[i] = 3 * (B[i - 1] + B[i] + B[i + 1]);
    }
#pragma endscop
}
