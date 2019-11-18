#!/bin/bash
module load mpi
module load gcc
module load intel

sh compile.sh
dos2unix ping_pong_batch.sh
sbatch ping_pong_batch.sh