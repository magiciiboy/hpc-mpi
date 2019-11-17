echo "Blocking"
mpicc ping_pong_blocking.c -o blocking
mpirun -np 56 ./blocking

echo "Non Blocking"
mpicc ping_pong_non_blocking.c -o non_blocking
mpirun -np 56 ./non_blocking
