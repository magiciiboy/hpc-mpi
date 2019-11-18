#!/bin/bash
#SBATCH -N 56
#SBATCH -n 56
#SBATCH --ntasks-per-node 1
#SBATCH -t 00:10:00
#SBATCH -o output_56N_56n_1taskPerNode_time1Min_process_pinning_bindByCore_mapByNode

echo "1B"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1

echo "10B"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10

echo "100B"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100

echo "1KB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000

echo "10KB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000

echo "100KB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000

echo "1MB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE1000000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE1000000

echo "10MB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE10000000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE10000000

echo "100MB"
echo "Blocking"
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000000
mpirun -np 56 --bind-to core --map-by node ./blocking_SIZE100000000
echo "NON Blocking"
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000000
mpirun -np 56 --bind-to core --map-by node ./non_blocking_SIZE100000000
