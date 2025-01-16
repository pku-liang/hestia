// MINI_DATASET
#   define NQ 8
#   define NR 10
#   define NP 12
//// SMALL_DATASET
//#   define NQ 20
//#   define NR 25
//#   define NP 30
//// MEDIUM_DATASET
//#   define NQ 40
//#   define NR 50
//#   define NP 60
// LARGE_DATASET
// #   define NQ 140
// #   define NR 150
// #   define NP 160
//// EXTRALARGE_DATASET
//#   define NQ 220
//#   define NR 250
//#   define NP 270

//#   define DATA_TYPE int
//#   define DATA_TYPE int
#   define DATA_TYPE int

#  define SCALAR_VAL(x) x##f

void kernel_doitgen(DATA_TYPE A[NR][NQ][NP],
                    DATA_TYPE C4[NP][NP],
                    DATA_TYPE sum[NP]) {
    int r, q, p, s;

#pragma scop
    for (r = 0; r < NR; r++)
        for (q = 0; q < NQ; q++) {
            for (p = 0; p < NP; p++) {
                sum[p] = SCALAR_VAL(0.0);
                for (s = 0; s < NP; s++)
                    sum[p] += A[r][q][s] * C4[s][p];
            }
            for (p = 0; p < NP; p++)
                A[r][q][p] = sum[p];
        }
#pragma endscop

}
