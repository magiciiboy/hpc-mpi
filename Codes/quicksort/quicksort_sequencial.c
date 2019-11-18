#include <stdio.h>

enum { SIZE = 9 };

void quicksort(int *target, int left, int right) {
  if(left >= right) return;
  int i = left, j = right;
  int tmp, pivot = target[i];
  for(;;) {
    while(target[i] < pivot) i++;
    while(pivot < target[j]) j--;
    if(i >= j) break;
    tmp = target[i]; target[i] = target[j]; target[j] = tmp;
    i++; j--;
  }
  quicksort(target, left, i-1);
  quicksort(target, j+1, right);
}

int main() {
  int i, array[SIZE] = { 2, 6, 3, 8, 5, 4, 1, 9, 7 };

  quicksort(array, 0, SIZE-1);

  for(i=0; i<SIZE; i++)
    printf("%d ", array[i]);
  printf("\n");
}