mpicc broadcast.c -DONEMB -o broad_ONE
mpicc broadcast.c -DTENMB -o broad_TEN
mpicc broadcast.c -DHUNDREDMB -o broad_HUNDRED

mpicc reduce.c -DONEMB -o red_ONE
mpicc reduce.c -DTENMB -o red_TEN
mpicc reduce.c -DHUNDREDMB -o red_HUNDRED