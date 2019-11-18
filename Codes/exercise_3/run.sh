module load mpi/gcc_openmpi
echo "Run for 4 procs"
mpicc exercise3_4ranks.c -o ex3_4
mpirun -np 4 ex3_4
echo "-----------------------------------------"
echo "Run for 8 procs"
mpicc exercise3_8ranks.c -o ex3_8
mpirun -np 8 ex3_8
echo "-----------------------------------------"
echo "Run for 16 procs"
mpicc exercise3_16ranks.c -o ex3_16
mpirun -np 16 ex3_16
echo "-----------------------------------------"
echo "Run for 32 procs"
mpicc exercise3_32ranks.c -o ex3_32
mpirun -np 32 ex3_32
echo "-----------------------------------------"
echo "Run for 64 procs"
mpicc exercise3_56ranks.c -o ex3_56
mpirun -np 56 ex3_56
echo "-----------------------------------------"
