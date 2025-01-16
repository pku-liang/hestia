/* Default to MINI_DATASET. */
#if !defined(MINI_DATASET) && !defined(SMALL_DATASET) &&                       \
    !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) &&                     \
    !defined(EXTRALARGE_DATASET)
#define MINI_DATASET
#endif

#if !defined(TMAX) && !defined(NX) && !defined(NY)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define TMAX 20
#define NX 20
#define NY 30
#endif

#ifdef SMALL_DATASET
#define TMAX 40
#define NX 60
#define NY 80
#endif

#ifdef MEDIUM_DATASET
#define TMAX 100
#define NX 200
#define NY 240
#endif

#ifdef LARGE_DATASET
#define TMAX 500
#define NX 1000
#define NY 1200
#endif

#ifdef EXTRALARGE_DATASET
#define TMAX 1000
#define NX 2000
#define NY 2600
#endif
#endif /* !(TMAX NX NY) */

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
#define DATA_PRINTF_MODIFIER "%2f "
#define SCALAR_VAL(x) x##f
#define SQRT_FUN(x) sqrtf(x)
#define EXP_FUN(x) expf(x)
#define POW_FUN(x, y) powf(x, y)
#endif

#ifdef DATA_TYPE_IS_DOUBLE
#define DATA_TYPE int
#define DATA_PRINTF_MODIFIER "%2lf "
#define SCALAR_VAL(x) x
#define SQRT_FUN(x) sqrt(x)
#define EXP_FUN(x) exp(x)
#define POW_FUN(x, y) pow(x, y)
#endif

void kernel_fdtd_2d(DATA_TYPE ex[NX][NY], DATA_TYPE ey[NX][NY],
                    DATA_TYPE hz[NX][NY], DATA_TYPE _fict_[TMAX]) {
    int t, i, j;

#pragma scop

    for (t = 0; t < TMAX; t++) {
        for (j = 0; j < NY; j++)
            ey[0][j] = _fict_[t];
        for (i = 1; i < NX; i++)
            for (j = 0; j < NY; j++)
                ey[i][j] = ey[i][j] - SCALAR_VAL(5) * (hz[i][j] - hz[i - 1][j]);
        for (i = 0; i < NX; i++)
            for (j = 1; j < NY; j++)
                ex[i][j] = ex[i][j] - SCALAR_VAL(5) * (hz[i][j] - hz[i][j - 1]);
        for (i = 0; i < NX - 1; i++)
            for (j = 0; j < NY - 1; j++)
                hz[i][j] = hz[i][j] - SCALAR_VAL(7) * (ex[i][j + 1] - ex[i][j] +
                                                       ey[i + 1][j] - ey[i][j]);
    }

#pragma endscop
}
