#!/bin/bash
#SBATCH -N 4
#SBATCH -n 4
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:02:00
#SBATCH -o output_4N_4n_1taskPerNode_time1Min_process_pinning_bindByCore_mapByNode

echo "Sort SMALL array"
mpirun -np 4 ./quicksort_parallel_SMALL
echo "Sort MEDIUM array"
mpirun -np 4 ./quicksort_parallel_MEDIUM
echo "Sort LARGE array"
mpirun -np 4 ./quicksort_parallel_LARGE
