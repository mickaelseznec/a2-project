#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "graph.h"

static graph_t *file_to_graph(char *file_name)
{
    size_t n_nodes, n_edges;
    int oriented;

    FILE *f = fopen(file_name, "r");
    if (f == NULL) {
        printf("%s: %s\n", file_name, strerror(errno));
        return NULL;
    }

    fscanf(f, "%zu %zu %d", &n_nodes, &n_edges, &oriented);
    printf("Reading %zu connections between %zu nodes\n", n_edges, n_nodes);

    graph_t *graph = new_graph(n_nodes + 1);

    /* Loop to add edges*/
    size_t from, to;
    while (fscanf(f, "%zu %zu", &from, &to) != EOF) {
        add_edge(&graph->nodes[from], &graph->nodes[to], 1);
        if (!oriented) {
            add_edge(&graph->nodes[to], &graph->nodes[from], 1);
        }
    }
    fclose(f);
    return graph;
}

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; i++) {
        graph_t *graph = file_to_graph(argv[i]);
        printf("Processing \"%s\" (%5lu nodes)\n", argv[i], graph->size);

        int *distances_from_all = compute_shortest_paths(graph);
        free(distances_from_all);

        /*
        int *distances_from_1 = compute_shortest_path_unweighted(graph, &graph->nodes[1]);
        free(distances_from_1);
        */
        free_graph(graph);
    }

    return 0;
}
