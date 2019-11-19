#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h> 
// #define N 100

#ifdef SMALL
#define N 100
#endif

#ifdef MEDIUM
#define N 100000
#endif

#ifdef LARGE
#define N 100000000
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
    if (output == NULL) {
        printf("Empty array!");
        return -1;
    }
    for (i = 0; i < N - 1; i++) {
        if (output[i] > output[i + 1]) {
            printf("Validate: ***NOT sorted***\n");
            printf("At [%d] = %d > [%d] = %d \n", i, output[i], i+1, output[i+1]);
            return -1;
        }
    }
    printf ("Validate: Sorted!\n");
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
    int *array = malloc(N * sizeof(int));
    struct timeval start, stop;
    double secs;

    generate_array(array);
    
    gettimeofday(&start, NULL);
    quicksort(array, 0, N-1);
    gettimeofday(&stop, NULL);

    secs = (double)(stop.tv_usec - start.tv_usec) / 1000000 + (double)(stop.tv_sec - start.tv_sec);
    printf("Time: %f\n", secs);
    return validate(array);
}