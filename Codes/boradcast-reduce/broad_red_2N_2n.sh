#!/bin/bash
#SBATCH -N 2
#SBATCH -n 2
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_2N_2n_1taskPerNode

echo "Broadcast 2 processes"
mpirun -np 2  --bind-to core --map-by node ./broad

echo "Reduce 2 processes"
mpirun -np 2  --bind-to core --map-by node ./red