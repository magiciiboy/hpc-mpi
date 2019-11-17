1) This directory contains following files:
- broadcast.c : Sample code for MPI broadcast call.
- reduce.c : Sample code for MPI reduce call.
- run_broad.sh : Script to compile and test broadcast.c.
- run_reduce.sh : Script to compile and test reduce.c.
- broad_red_XN_Yn.sh : Scripts to submit batch job. Where 'X' stands for number of NODES, and 'Y' stands for total number of cores.
- README : this file.

2) Both codes broadcast.c and reduce.c by default use process ZERO as the root process as broadcaster and reduce result gatherer respectively. But as mentioned in the assignment doc, you will modify the code to select a root node randomly among the 56 processes. You can use any random number generator function to select a process as root.

3) TESTING THE CODE: The scripts run_broad.sh and run_reduce.sh are provided to only test correct working and the outputs of your program using minimal number of nodes, for example 2 Nodes for 56 processes. 

4) Running your codes with number of MPI processes equal to number of nodes: Once you test the programs and verify outputs, use "sbatch" to submit the batch files to submit jobs.

- You will use the batch sripts provided to submit jobs which request number of number of nodes equal to MPI processes.

- Beware that resources such as 56 nodes may not be allocated instantly and the jobs may stay pending for more than 24 hours, which is why it is important to verify that you are running the programs correctly before submitting the job.

5) You can check status of your jobs using: squeue -u <your_user_name>

6) Since the scripts run_broad and run_reduce are just for testing, they do not use process pinning parameters while running programs.
   Process pinning calls are added in the batch job script. Reference for process pinning and the parameter values can be found here:
	> https://www.open-mpi.org/doc/v2.0/man1/mpirun.1.php#sect9
	> https://www.open-mpi.org/faq/?category=tuning#using-paffinity-v1.4

The batch script employs process pinning in way such that consecutive processes are executed on adjacent nodes.
	
7) Both sample codes have variable 'N' defined with "ifdef"s according to the data sizes mentioned in the assignment. To compile the codes with appropriate data sizes:
	
	- For broadcast.c: xyz]$ mpicc broadcast.c -DONEMB -o broad

	- For reduce.c : xyz]$ mpicc reduce.c -DONEMB -o red

	=> Here options for datasizes are:
		=> -DONEMB	- For one MB of data
		=> -DTENMB	- For ten MB of data
		=> -DHUNDREDMB - For hundred MB of data

