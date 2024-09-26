#include <stdio.h>
#define N 4
#define M 4

void odd_sum(int n, int m, int matrix[N][M], int *sum) {
  *sum = 0; 
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      if ((i + j) % 2 != 0) {
        *sum += matrix[i][j];
      }
    }
  }
}

int main() {
  int matrix[N][M] = {{1,2,3,4},{5,6,7,8},{1,2,3,4},{5,6,7,8}};
  int sum;
  odd_sum(N, M, matrix, &sum);
  printf("odd_sum = %d\n", sum);
  return 0;
}