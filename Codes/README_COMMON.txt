You will use BRIDGES cluster for this assignment.

You will need to have following modules loaded to run the codes on bridges cluster:
- mpi/intel_openmpi
- intel/17.4
- gcc/7.2.0

Use "module load" command along with these modules to load them.

- Make sure you read the README inside the code directories carefully before starting the assignment.

- TO get access to a node in interactive mode on Bridges for testing the codes:

	loginXYZ]$ interact -N X -n Y

	Where: X => Number of nodes
		and Y => Total number of cores

	- Important note: Let's say if you request N=56 (56 nodes), and n=56 (56 cores), then you will get access to a total of 56 cores, and not 56*56=3136 cores.
	This applies for the case when you request resources inside a batch script too.