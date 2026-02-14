/*
 * client.c - Remote System Monitoring Client
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <rpc/rpc.h>
#include <rpc/auth.h>
#include "date.h"

int main(int argc, char **argv) {
    CLIENT *cl;
    char *server;
    struct stats *result;
    long l_opt = 1;

    if (argc != 2) {
        fprintf(stderr, "usage: %s hostname\n", argv[0]);
        exit(1);
    }

    server = argv[1];

    /* 1. Create client handle */
    cl = clnt_create(server, DATE_PROG, DATE_VERS, "udp");
    if (cl == NULL) {
        clnt_pcreateerror(server);
        exit(2);
    }

    /* 2. Call the remote procedure */
    /* rpcgen -k results in get_stats_1 naming */
    result = get_stats_1(&l_opt, cl);

    /* 3. SAFETY CHECK: If the server failed, result is NULL */
    if (result == NULL) {
        clnt_perror(cl, "RPC Call Failed");
        exit(3);
    }

    /* 4. Printing the results safely */
    printf("\n--- Remote Server Stats ---\n");
    
    /* Ensure the string exists before printing */
    if (result->time_str != NULL) {
        printf("Server Time:    %s", result->time_str);
    }
    
    printf("CPU Usage:      %.2f%%\n", result->cpu_usage);
    printf("Memory Total:   %ld KB\n", result->mem_total);
    printf("Memory Free:    %ld KB\n", result->mem_free);
    printf("Load Average:   %.2f\n", result->load_avg);
    printf("---------------------------\n");

    clnt_destroy(cl);
    return 0;
}