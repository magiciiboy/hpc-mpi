# Load Module
module load mpi
module load gcc
module load intel

# Compile
sh compile.sh

# Dos2Unix
dos2unix broad_red_2N_2n.sh
dos2unix broad_red_4N_4n.sh
dos2unix broad_red_8N_8n.sh
dos2unix broad_red_16N_16n.sh
dos2unix broad_red_28N_28n.sh
dos2unix broad_red_56N_56n.sh

# Submit
sbatch broad_red_2N_2n.sh
sbatch broad_red_4N_4n.sh
sbatch broad_red_8N_8n.sh
sbatch broad_red_16N_16n.sh
sbatch broad_red_28N_28n.sh
sbatch broad_red_56N_56n.sh

