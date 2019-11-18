#!/bin/bash
#SBATCH -N 16
#SBATCH -n 16
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_16N_16n_1taskPerNode
echo "Broadcast 16 processes"
mpirun -np 16  --bind-to core --map-by node ./broad
echo "Reduce 16 processes"
mpirun -np 16  --bind-to core --map-by node ./red