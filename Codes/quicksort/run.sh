mpicc quicksort_parallel.c -o quicksort_parallel
mpirun -np 56 ./quicksort_parallel
