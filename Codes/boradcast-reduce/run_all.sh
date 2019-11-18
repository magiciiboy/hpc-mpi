SIZES=("-DONEMB" "-DTENMB" "-DHUNDREDMB")

for size in "${SIZES[@]}"; do
    mpicc broadcast.c $size -o broad
    mpicc reduce.c $size -o red

    sh broad_red_2N_2n.sh
    sh broad_red_4N_4n.sh
    sh broad_red_8N_8n.sh
    sh broad_red_16N_16n.sh
    sh broad_red_28N_28n.sh
    sh broad_red_56N_56n.sh
done