#!/bin/bash
#SBATCH -N 4
#SBATCH -n 4
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_4N_4n_1taskPerNode

echo "Broadcast 4 processes"
mpirun -np 4  --bind-to core --map-by node ./broad

echo "Reduce 4 processes"
mpirun -np 4  --bind-to core --map-by node ./red