#!/bin/bash
#SBATCH -N 8
#SBATCH -n 8
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_8N_8n_1taskPerNode
echo "1MB"
echo "Broadcast 8 processes"
mpirun -np 8  --bind-to core --map-by node ./broad_ONE
echo "Reduce 8 processes"
mpirun -np 8  --bind-to core --map-by node ./red_ONE

echo "10MB"
echo "Broadcast 8 processes"
mpirun -np 8  --bind-to core --map-by node ./broad_TEN
echo "Reduce 8 processes"
mpirun -np 8  --bind-to core --map-by node ./red_TEN

echo "100MB"
echo "Broadcast 8 processes"
mpirun -np 8  --bind-to core --map-by node ./broad_HUNDRED
echo "Reduce 8 processes"
mpirun -np 8  --bind-to core --map-by node ./red_HUNDRED