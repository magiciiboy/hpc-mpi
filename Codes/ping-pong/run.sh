echo "Blocking"
mpicc ping_pong_blocking.c -o Blocking
mpirun -np 56 ./Blocking

echo "Non Blocking"
mpicc ping_pong_non_blocking.c -o non_blocking
mpirun -np 56 ./non_blocking
