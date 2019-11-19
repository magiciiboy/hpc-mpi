mpicc quicksort_parallel.c -o quicksort_parallel
mpirun -np 4 ./quicksort_parallel
