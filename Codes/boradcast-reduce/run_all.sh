echo "1 MB"
mpicc broadcast.c -DONEMB -o broad
mpicc reduce.c -DONEMB -o red

sh broad_red_2N_2n.sh
sh broad_red_4N_4n.sh
sh broad_red_8N_8n.sh
sh broad_red_16N_16n.sh
sh broad_red_28N_28n.sh
sh broad_red_56N_56n.sh

echo "10 MB"
mpicc broadcast.c -DTENMB -o broad
mpicc reduce.c -DTENMB -o red

sh broad_red_2N_2n.sh
sh broad_red_4N_4n.sh
sh broad_red_8N_8n.sh
sh broad_red_16N_16n.sh
sh broad_red_28N_28n.sh
sh broad_red_56N_56n.sh

echo "100 MB"
mpicc broadcast.c -DHUNDREDMB -o broad
mpicc reduce.c -DHUNDREDMB -o red

sh broad_red_2N_2n.sh
sh broad_red_4N_4n.sh
sh broad_red_8N_8n.sh
sh broad_red_16N_16n.sh
sh broad_red_28N_28n.sh
sh broad_red_56N_56n.sh

