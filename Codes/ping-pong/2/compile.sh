#!/bin/bash
# Load module
module load gcc
module load intel
module load mpi

# Compile
echo "Compiling 1B"
mpicc ping_pong_blocking.c -DSIZE1 -o blocking_SIZE1
mpicc ping_pong_non_blocking.c -DSIZE1 -o non_blocking_SIZE1

echo "Compiling 10B"
mpicc ping_pong_blocking.c -DSIZE10 -o blocking_SIZE10
mpicc ping_pong_non_blocking.c -DSIZE10 -o non_blocking_SIZE10

echo "Compiling 100B"
mpicc ping_pong_blocking.c -DSIZE100 -o blocking_SIZE100
mpicc ping_pong_non_blocking.c -DSIZE100 -o non_blocking_SIZE100

echo "Compiling 1KB"
mpicc ping_pong_blocking.c -DSIZE1000 -o blocking_SIZE1000
mpicc ping_pong_non_blocking.c -DSIZE1000 -o non_blocking_SIZE1000

echo "Compiling 10KB"
mpicc ping_pong_blocking.c -DSIZE10000 -o blocking_SIZE10000
mpicc ping_pong_non_blocking.c -DSIZE10000 -o non_blocking_SIZE10000

echo "Compiling 100KB"
mpicc ping_pong_blocking.c -DSIZE100000 -o blocking_SIZE100000
mpicc ping_pong_non_blocking.c -DSIZE100000 -o non_blocking_SIZE100000

echo "Compiling 1MB"
mpicc ping_pong_blocking.c -DSIZE1000000 -o blocking_SIZE1000000
mpicc ping_pong_non_blocking.c -DSIZE1000000 -o non_blocking_SIZE1000000

echo "Compiling 10MB"
mpicc ping_pong_blocking.c -DSIZE10000000 -o blocking_SIZE10000000
mpicc ping_pong_non_blocking.c -DSIZE10000000 -o non_blocking_SIZE10000000

echo "Compiling 100MB"
mpicc ping_pong_blocking.c -DSIZE100000000 -o blocking_SIZE100000000
mpicc ping_pong_non_blocking.c -DSIZE100000000 -o non_blocking_SIZE100000000
