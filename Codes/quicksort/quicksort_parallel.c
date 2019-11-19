#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

#define N 100

#ifdef SMALL
#define N 100
#endif

#ifdef MEDIUM
#define N 100000
#endif

#ifdef LARGE
#define N 100000000
#endif

void generate_array (int *input) {
    unsigned int timeval = 0;
    srand(timeval);
    for(int i = 0; i < N ;i++){
        // input[i] = i;
        input[i] = rand() % 1000000;
    }
}

int validate (int *output) {
    int i = 0;
    if (output == NULL) {
        printf("Empty array!");
        return -1;
    }
    for (i = 0; i < N - 1; i++) {
        if (output[i] > output[i + 1]) {
            printf("Validate: ***NOT sorted***\n");
            printf("At [%d] = %d > [%d] = %d \n", i, output[i], i+1, output[i+1]);
            return -1;
        }
    }
    printf ("Validate: Sorted!\n");
    return 0;
}

int main (int argc, char **argv)
{
    int *input = NULL;
    int *output = NULL;
    int N;
    int  i = 0;
    int numtasks, rank, rc;
    MPI_Status recv_status;

    int elems_per_task;
    int adjust;
    int part_start;

    rc = MPI_Init(&argc, &argv);
    if(rc != MPI_SUCCESS) {
        printf("Error starting MPI program. Terminating. \n");
        MPI_Abort(MPI_COMM_WORLD, rc);
    }

    MPI_Comm_size(MPI_COMM_WORLD, &numtasks);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    printf("Running with rank [%d] and N[%d]\n", rank, N);

    if (!(input = (int *) calloc (N, sizeof (int)))){
        printf ("Memory error\n");
        exit (EXIT_FAILURE);
    }

    if(rank == 0){
        printf("My rank is : %d\n", rank);
        generate_array(input);
        elems_per_task = (N/numtasks);
        adjust  = N - elems_per_task*numtasks;
        if(adjust > 0){
                part_start = elems_per_task + 1;
                adjust --;
        } else {
                part_start = elems_per_task;
        }
        for(i = 1; i < numtasks; i++){
                if(adjust > 0){
                        MPI_Send((input + part_start), elems_per_task + 1, MPI_INT, i, 0, MPI_COMM_WORLD);
                        part_start += (elems_per_task + 1);
                        adjust -- ;
                } else {
                        MPI_Send((input + part_start), elems_per_task, MPI_INT, i, 0, MPI_COMM_WORLD);
                        part_start += (elems_per_task);
                }
        }
    } else {
        printf("My rank is : %d\n", rank);
        elems_per_task = (N/numtasks);
        adjust  = N - elems_per_task*numtasks;
        part_start = 0;
        for(i=0; i < rank; i++){
                if(adjust > 0){
                        part_start += (elems_per_task + 1);
                        adjust --;
                } else {
                        part_start += (elems_per_task);
                }
        }
                
        if(adjust > 0){
                MPI_Recv((input + part_start), elems_per_task+ 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &recv_status);
        } else {
                MPI_Recv((input + part_start), elems_per_task, MPI_INT, 0, 0, MPI_COMM_WORLD, &recv_status);
        }
        // for(i = part_start; i < part_start + elems_per_task; i ++){
        //         printf("[%d] [%d] = [%d] \n", rank, i, input[i]);
        // }
    }
    MPI_Finalize();

    /* if(validate (output) != 0) return EXIT_FAILURE; */
    return EXIT_SUCCESS;
}