#!/bin/bash
#SBATCH -N 4
#SBATCH -n 4
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:02:00
#SBATCH -o output_4N_4n_1taskPerNode_time1Min_process_pinning_bindByCore_mapByNode

mpirun -np 4 ./quicksort_parallel_SMALL
mpirun -np 4 ./quicksort_parallel_MEDIUM
mpirun -np 4 ./quicksort_parallel_LARGE
