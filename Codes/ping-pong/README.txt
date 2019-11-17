1) This directory contains following files:
- ping_pong_blocking.c : Sample code for MPI blocking communication call.
- ping_pong_non_blocking.c : Sample code for MPI non blocking call.
- run.sh : Script to compile and test both source codes.
- ping_pong_batch.sh : Sample script to submit batch job.
- README : this file.

2) Please note: Use the script run.sh to only test the outputs of your program using minimal number of nodes, for example 2 Nodes for 56 processes.
Once you test the programs and verify outputs, use "sbatch" with batch script to submit jobs.

Beware that resources such as 56 nodes may not be allocated instantly and the jobs may stay pending for more than 24 hours, which is why it is important to verify that you are running the programs correctly before submitting the job.

3) You can check status of your jobs using: squeue -u <user_name>

4) Since the scripts run.sh are just for testing, they do not use process pinning parameters while running programs.
   Process pinning calls are added in the batch job script. Reference for process pinning and the parameter values can be found here:
	> https://www.open-mpi.org/doc/v2.0/man1/mpirun.1.php#sect9
	> https://www.open-mpi.org/faq/?category=tuning#using-paffinity-v1.4

5) Both sample codes have variable 'N' defined. Modify its value to adjust your data size. A 'char' is usually 1 Byte and a 'double' being 8 Bytes.