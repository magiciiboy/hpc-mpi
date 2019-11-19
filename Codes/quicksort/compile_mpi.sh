#!/bin/bash
# Load module
module load gcc
module load intel
module load mpi

mpicc -Wall -DSMALL -o quicksort_parallel_SMALL quicksort_parallel.c
mpicc -Wall -DMEDIUM -o quicksort_parallel_MEDIUM quicksort_parallel.c
mpicc -Wall -DLARGE -o quicksort_parallel_LARGE quicksort_parallel.c