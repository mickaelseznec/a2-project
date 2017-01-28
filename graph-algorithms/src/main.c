#include <stdio.h>
#include <stdlib.h>

#include "graph.h"

#define FILE_PATH   "resources/test.graph"

int main(int argc, char *argv[])
{
    (void) argc; (void) argv;
    size_t n_nodes, n_edges;

    FILE *f = fopen(FILE_PATH, "r");
    if (f == NULL) {
        printf("%s: %m\n", FILE_PATH);
        return 1;
    }

    fscanf(f, "%lu %lu", &n_nodes, &n_edges);
    //printf("Reading %lu connections between %lu nodes\n", n_edges, n_nodes);

    graph_t *graph = new_graph(n_nodes + 1);

    /* Loop to add edges*/
    size_t from, to;
    while (fscanf(f, "%lu %lu", &from, &to) != EOF) {
        add_edge(&graph->nodes[from], &graph->nodes[to], 1);
        add_edge(&graph->nodes[to], &graph->nodes[from], 1);
    }
    fclose(f);

    int *distances_to_all = compute_shortest_paths(graph);
    show_shortest_paths(distances_to_all, graph->size);

    int *distance_from_node = compute_shortest_path(graph, &graph->nodes[1]);
    show_shortest_path(distance_from_node, graph->size);

    free(distance_from_node);
    free(distances_to_all);
    free_graph(graph);
    return 0;
}
