#!/bin/bash
#SBATCH -N 28
#SBATCH -n 28
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_28N_28n_1taskPerNode
echo "1MB"
echo "Broadcast 28 processes"
mpirun -np 28  --bind-to core --map-by node ./broad_ONE
echo "Reduce 28 processes"
mpirun -np 28  --bind-to core --map-by node ./red_ONE

echo "10MB"
echo "Broadcast 28 processes"
mpirun -np 28  --bind-to core --map-by node ./broad_TEN
echo "Reduce 28 processes"
mpirun -np 28  --bind-to core --map-by node ./red_TEN

echo "100MB"
echo "Broadcast 28 processes"
mpirun -np 28  --bind-to core --map-by node ./broad_HUNDRED
echo "Reduce 28 processes"
mpirun -np 28  --bind-to core --map-by node ./red_HUNDRED