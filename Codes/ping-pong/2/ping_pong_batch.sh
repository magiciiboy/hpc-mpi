#!/bin/bash
#SBATCH -N 2
#SBATCH -n 2
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:01:00
#SBATCH -o output_2N_2n_1taskPerNode_time1Min_process_pinning_bindByCore_mapByNode

module load mpi
module load gcc
module load intel

echo "1B"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE1
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE1

echo "10B"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE10
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE10

echo "100B"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE100
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE100

echo "1KB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE1000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE1000

echo "10KB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE10000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE10000

echo "100KB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE100000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE100000

echo "1MB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE1000000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE1000000

echo "10MB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE10000000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE10000000

echo "100MB"
echo "Blocking"
mpirun -np 2 --bind-to core --map-by node ./blocking_SIZE100000000
echo "NON Blocking"
mpirun -np 2 --bind-to core --map-by node ./non_blocking_SIZE100000000
