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
#define N 20
#endif

#ifdef SMALL_DATASET
#define TSTEPS 40
#define N 60
#endif

#ifdef MEDIUM_DATASET
#define TSTEPS 100
#define N 200
#endif

#ifdef LARGE_DATASET
#define TSTEPS 500
#define N 1000
#endif

#ifdef EXTRALARGE_DATASET
#define TSTEPS 1000
#define N 2000
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
#define DATA_PRINTF_MODIFIER "%2f "
#define SCALAR_VAL(x) x##f
#define SQRT_FUN(x) sqrtf(x)
#define EXP_FUN(x) expf(x)
#define POW_FUN(x, y) powf(x, y)
#endif

#ifdef DATA_TYPE_IS_DOUBLE
#define DATA_TYPE int
#define SCALAR_VAL(x) x
#define SQRT_FUN(x) sqrt(x)
#define EXP_FUN(x) exp(x)
#define POW_FUN(x, y) pow(x, y)
#endif

void kernel_adi(DATA_TYPE u[N][N], DATA_TYPE v[N][N], DATA_TYPE p[N][N],
                DATA_TYPE q[N][N]) {
    int t, i, j;
    DATA_TYPE DX, DY, DT;
    DATA_TYPE B1, B2;
    DATA_TYPE mul1, mul2;
    DATA_TYPE a, b, c, d, e, f;

#pragma scop

    DX = 2; // SCALAR_VAL(1) / (DATA_TYPE) N;
    DY = 3; // SCALAR_VAL(1) / (DATA_TYPE) N;
    DT = 4; // SCALAR_VAL(1) / (DATA_TYPE) TSTEPS;
    B1 = 5; // SCALAR_VAL(2);
    B2 = 6; // SCALAR_VAL(1);
    mul1 = B1 * DT * (DX * DX);
    mul2 = B2 * DT * (DY * DY);

    a = -mul1 * SCALAR_VAL(2);
    b = SCALAR_VAL(1) + mul1;
    c = a;
    d = -mul2 * SCALAR_VAL(2);
    e = SCALAR_VAL(1) + mul2;
    f = d;

    for (t = 1; t <= TSTEPS; t++) {
        // Column Sweep
        for (i = 1; i < N - 1; i++) {
            v[0][i] = SCALAR_VAL(1);
            p[i][0] = SCALAR_VAL(0);
            q[i][0] = v[0][i];
            for (j = 1; j < N - 1; j++) {
                p[i][j] = -c * (a * p[i][j - 1] + b);
                q[i][j] = (-d * u[j][i - 1] +
                           (SCALAR_VAL(1) + SCALAR_VAL(2) * d) * u[j][i] -
                           f * u[j][i + 1] - a * q[i][j - 1]) *
                          (a * p[i][j - 1] + b);
            }

            v[N - 1][i] = SCALAR_VAL(1);
            for (j = N - 2; j >= 1; j--) {
                v[j][i] = p[i][j] * v[j + 1][i] + q[i][j];
            }
        }
        // Row Sweep
        for (i = 1; i < N - 1; i++) {
            u[i][0] = SCALAR_VAL(1);
            p[i][0] = SCALAR_VAL(0);
            q[i][0] = u[i][0];
            for (j = 1; j < N - 1; j++) {
                p[i][j] = -f * (d * p[i][j - 1] + e);
                q[i][j] = (-a * v[i - 1][j] +
                           (SCALAR_VAL(1) + SCALAR_VAL(2) * a) * v[i][j] -
                           c * v[i + 1][j] - d * q[i][j - 1]) *
                          (d * p[i][j - 1] + e);
            }
            u[i][N - 1] = SCALAR_VAL(1);
            for (j = N - 2; j >= 1; j--) {
                u[i][j] = p[i][j] * u[i][j + 1] + q[i][j];
            }
        }
    }
#pragma endscop
}
