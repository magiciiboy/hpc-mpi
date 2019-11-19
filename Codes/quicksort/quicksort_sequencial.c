#include <stdio.h>
// #define N 100

#ifdef SMALL
#define N 100
#endif

#ifdef MEDIUM
#define N 10000
#endif

#ifdef LARGE
#define N 1000000
#endif

void generate_array (int *input) {
    unsigned int timeval = 0;
    srand(timeval);
    for(int i = 0; i < N ;i++){
        // input[i] = i;
        input[i] = rand() % 1000000;
    }
}

int validate (int *output) {
    int i = 0;
    int num_elements = N;
    if (output == NULL) {
        printf("Empty array!");
        return -1;
    }
    for (i = 0; i < num_elements - 1; i++) {
        if (output[i] > output[i + 1]) {
            printf("************* NOT sorted *************\n");
            printf("Element [%d]  = %d is greater than [%d] = %d \n", i, output[i], i+1, output[i+1]);
            return -1;
        }
    }
    printf ("============= SORTED ===========\n");
    return 0;
}

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
    int i;
    int *array = malloc(30 * sizeof(int));
    int num = N;
    generate_array(array);
    quicksort(array, 0, N-1);
    return validate(array);
}