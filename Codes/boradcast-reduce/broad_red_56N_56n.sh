#!/bin/bash
#SBATCH -N 56
#SBATCH -n 56
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o broad_red_output_56N_56n_1taskPerNode
echo "1MB"
echo "Broadcast 56 processes"
mpirun -np 56  --bind-to core --map-by node ./broad_ONE
echo "Reduce 56 processes"
mpirun -np 56  --bind-to core --map-by node ./red_ONE

echo "10MB"
echo "Broadcast 56 processes"
mpirun -np 56  --bind-to core --map-by node ./broad_TEN
echo "Reduce 56 processes"
mpirun -np 56  --bind-to core --map-by node ./red_TEN

echo "100MB"
echo "Broadcast 56 processes"
mpirun -np 56  --bind-to core --map-by node ./broad_HUNDRED
echo "Reduce 56 processes"
mpirun -np 56  --bind-to core --map-by node ./red_HUNDRED