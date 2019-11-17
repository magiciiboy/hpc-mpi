echo "Blocking"
mpicc ping_pong_blocking.c -o blocking

echo "Non Blocking"
mpicc ping_pong_non_blocking.c -o non_blocking
