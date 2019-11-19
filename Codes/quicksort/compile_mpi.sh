#!/bin/bash
# Load module
module load gcc
module load intel
module load mpi

mpicc quicksort_parallel.c -DSMALL -o quicksort_parallel_SMALL
mpicc quicksort_parallel.c -DMEDIUM -o quicksort_parallel_MEDIUM
mpicc quicksort_parallel.c -DLARGE -o quicksort_parallel_LARGE