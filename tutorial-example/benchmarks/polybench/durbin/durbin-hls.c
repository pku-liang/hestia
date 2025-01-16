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

#define SCALAR_VAL(x) x

void kernel_durbin(DATA_TYPE r[N], DATA_TYPE y[N]) {
    DATA_TYPE z[N];
    DATA_TYPE alpha;
    DATA_TYPE beta;
    DATA_TYPE sum;

    int i, k;

#pragma scop
    y[0] = r[0];
    beta = SCALAR_VAL(1.0);
    alpha = r[0];

    for (k = 1; k < N; k++) {
        beta = (1 - alpha * alpha) * beta;
        sum = SCALAR_VAL(0);
        for (i = 0; i < k; i++) {
            sum += r[k - i - 1] * y[i];
        }
        alpha = (r[k] + sum) * beta;

        for (i = 0; i < k; i++) {
            z[i] = y[i] + alpha * y[k - i - 1];
        }
        for (i = 0; i < k; i++) {
            y[i] = z[i];
        }
        y[k] = alpha;
    }
#pragma endscop
}
