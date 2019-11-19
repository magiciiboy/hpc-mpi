#!/bin/bash
#SBATCH -N 16
#SBATCH -n 16
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:05:00
#SBATCH -o output_16N_16n_1taskPerNode_time1Min_process_pinning_bindByCore_mapByNode

mpirun -np 4 ./quicksort_parallel_SMALL
mpirun -np 4 ./quicksort_parallel_MEDIUM
mpirun -np 4 ./quicksort_parallel_LARGE
