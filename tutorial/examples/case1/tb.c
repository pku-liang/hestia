#include "kernel_2mm.c"
#include <stdio.h>
#include <stdlib.h>

int rand_int(int x) { return rand() % (2 * x - 1) - x; }

int rand_uint(int x) { return rand() % x; }

#define random_matrix(A, n, m)                                                 \
    for (int i = 0; i < n; i++) {                                              \
        for (int j = 0; j < m; j++) {                                          \
            A[i][j] = rand_uint(100);                                          \
        }                                                                      \
    }

#define print_matrix(file, A, n, m)                                            \
    for (int i = 0; i < n; i++) {                                              \
        for (int j = 0; j < m; j++) {                                          \
            fprintf(file, "%d ", A[i][j]);                                     \
        }                                                                      \
        fprintf(file, "\n");                                                   \
    }

#define print_matrix_cider(file, A, n, m)                                      \
    for (int i = 0; i < n; i++) {                                              \
        for (int j = 0; j < m; j++) {                                          \
            if (i == 0 && j == 0)                                              \
                fprintf(file, "%d", A[i][j]);                                  \
            else                                                               \
                fprintf(file, ", %d", A[i][j]);                                \
        }                                                                      \
    }

int main() {
    DATA_TYPE A[NI][NK], B[NK][NJ], C[NJ][NL], D[NI][NL], tmp[NI][NJ];
    random_matrix(A, NI, NK);
    random_matrix(B, NK, NJ);
    random_matrix(C, NJ, NL);
    FILE *A_file = fopen("data/A.txt", "w");
    print_matrix(A_file, A, NI, NK);
    FILE *B_file = fopen("data/B.txt", "w");
    print_matrix(B_file, B, NK, NJ);
    FILE *C_file = fopen("data/C.txt", "w");
    print_matrix(C_file, C, NJ, NL);

    kernel_2mm(A, B, C, D, tmp);
    FILE *tmp_file = fopen("data/tmp_out.txt", "w");
    print_matrix(tmp_file, tmp, NI, NJ);

    FILE *D_file = fopen("data/D_out.txt", "w");
    print_matrix(D_file, D, NI, NL);
    FILE *cider = fopen("data/futil.data", "w");
    fprintf(cider, "{\n");
    fprintf(cider, "  \"ext_mem0\":{\n");
    fprintf(cider, "    \"format\":{\"numeric_type\":\"bitnum\", "
                   "\"is_signed\":true, \"width\":32},\n");
    fprintf(cider, "    \"data\":[");
    print_matrix_cider(cider, A, NI, NK);
    fprintf(cider, "]\n  },\n");

    fprintf(cider, "  \"ext_mem1\":{\n");
    fprintf(cider, "    \"format\":{\"numeric_type\":\"bitnum\", "
                   "\"is_signed\":true, \"width\":32},\n");
    fprintf(cider, "    \"data\":[");
    print_matrix_cider(cider, B, NK, NJ);
    fprintf(cider, "]\n  },\n");

    fprintf(cider, "  \"ext_mem2\":{\n");
    fprintf(cider, "    \"format\":{\"numeric_type\":\"bitnum\", "
                   "\"is_signed\":true, \"width\":32},\n");
    fprintf(cider, "    \"data\":[");
    print_matrix_cider(cider, C, NJ, NL);
    fprintf(cider, "]\n  }\n");

    fprintf(cider, "}\n");
}
