#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

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
    int i = 0;
    srand(timeval);
    for(i = 0; i < N ;i++){
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

/* swap entries in array v at positions i and j; used by quicksort */
static inline void swap(int * v, int i, int j)
{
  int t = v[i];
  v[i] = v[j];
  v[j] = t;
}

/* (quick) sort slice of array v; slice starts at s and is of length n */
void quicksort(int * v, int s, int n) {
  int x, p, i;
  // base case?
  if (n <= 1)
    return;
  // pick pivot and swap with first element
  x = v[s + n/2];
  swap(v, s, s + n/2);
  // partition slice starting at s+1
  p = s;
  for (i = s+1; i < s+n; i++)
    if (v[i] < x) {
      p++;
      swap(v, i, p);
    }
  // swap pivot into place
  swap(v, s, p);
  // recurse into partition
  quicksort(v, s, p-s);
  quicksort(v, p+1, s+n-p-1);
}


/* merge two sorted arrays v1, v2 of lengths n1, n2, respectively */
int * merge(int * v1, int n1, int * v2, int n2)
{
  int * result = (int *)malloc((n1 + n2) * sizeof(int));
  int i = 0;
  int j = 0;
  int k;
  for (k = 0; k < n1 + n2; k++) {
    if (i >= n1) {
      result[k] = v2[j];
      j++;
    }
    else if (j >= n2) {
      result[k] = v1[i];
      i++;
    }
    else if (v1[i] < v2[j]) { // indices in bounds as i < n1 && j < n2
      result[k] = v1[i];
      i++;
    }
    else { // v2[j] <= v1[i]
      result[k] = v2[j];
      j++;
    }
  }
  return result;
}

int main(int argc, char ** argv)
{
  int n = N;
  int * data = malloc(N * sizeof(int));
  int c, s;
  int * chunk;
  int o;
  int * other;
  int step;
  int p, id;
  MPI_Status status;
  double elapsed_time;
  int i;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &p);
  MPI_Comm_rank(MPI_COMM_WORLD, &id);

  if (id == 0) {
    c = (n%p!=0) ? n/p+1 : n/p;
    data = (int *)malloc(p*c * sizeof(int));
    generate_array(data);
    for (i = n; i < p*c; i++)
      data[i] = 0;
  }

  // start the timer
  MPI_Barrier(MPI_COMM_WORLD);
  elapsed_time = - MPI_Wtime();

  // broadcast size
  MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);

  // compute chunk size
  c = (n%p!=0) ? n/p+1 : n/p;

  // scatter data
  chunk = (int *)malloc(c * sizeof(int));
  MPI_Scatter(data, c, MPI_INT, chunk, c, MPI_INT, 0, MPI_COMM_WORLD);
  free(data);
  data = NULL;

  // compute size of own chunk and sort it
  s = (n >= c * (id+1)) ? c : n - c * id;
  quicksort(chunk, 0, s);

  // up to log_2 p merge steps
  for (step = 1; step < p; step = 2*step) {
    if (id % (2*step) != 0) {
      // id is no multiple of 2*step: send chunk to id-step and exit loop
      MPI_Send(chunk, s, MPI_INT, id-step, 0, MPI_COMM_WORLD);
      break;
    }
    // id is multiple of 2*step: merge in chunk from id+step (if it exists)
    if (id+step < p) {
      // compute size of chunk to be received
      o = (n >= c * (id+2*step)) ? c * step : n - c * (id+step);
      // receive other chunk
      other = (int *)malloc(o * sizeof(int));
      MPI_Recv(other, o, MPI_INT, id+step, 0, MPI_COMM_WORLD, &status);
      // merge and free memory
      data = merge(chunk, s, other, o);
      free(chunk);
      free(other);
      chunk = data;
      s = s + o;
    }
  }

  // stop the timer
  elapsed_time += MPI_Wtime();

  if (id == 0) {
    validate(data);
    printf("Quicksort %d ints on %d procs: %f secs\n", n, p, elapsed_time);
  }

  MPI_Finalize();
  return 0;
}