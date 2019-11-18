#!/bin/bash
#SBATCH -N 2
#SBATCH -n 2
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_2N_2n_1taskPerNode
echo "1MB"
echo "Broadcast 2 processes"
mpirun -np 2  --bind-to core --map-by node ./broad_ONE

echo "Reduce 2 processes"
mpirun -np 2  --bind-to core --map-by node ./red_ONE

echo "10MB"
echo "Broadcast 2 processes"
mpirun -np 2  --bind-to core --map-by node ./broad_TEN

echo "Reduce 2 processes"
mpirun -np 2  --bind-to core --map-by node ./red_TEN

echo "100MB"
echo "Broadcast 2 processes"
mpirun -np 2  --bind-to core --map-by node ./broad_HUNDRED

echo "Reduce 2 processes"
mpirun -np 2  --bind-to core --map-by node ./red_HUNDRED