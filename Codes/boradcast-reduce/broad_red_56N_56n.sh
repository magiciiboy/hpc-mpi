#!/bin/bash
#SBATCH -N 56
#SBATCH -n 56
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_56N_56n_1taskPerNode
echo "Broadcast 56 processes"
mpirun -np 56  --bind-to core --map-by node ./broad
echo "Reduce 56 processes"
mpirun -np 56  --bind-to core --map-by node ./red