#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "graph.h"
#include "node_heap.h"


#ifdef USE_BINARY_GRAPH

extern uint16_t _binary_graph_raw_start;
extern uint16_t _binary_graph_raw_end;

static graph_t *obj_to_file(void)
{
    uint16_t n_nodes, n_edges, oriented;
    int i = 0;
    n_nodes = _binary_graph_raw_start[i++]
    n_edges = _binary_graph_raw_start[i++]
    oriented = _binary_graph_raw_start[i++]

    graph_t *graph = new_graph(n_nodes + 1);

    /* Loop to add edges*/
    size_t from, to;
    int edge_count = 0;
    for (int edge_count = 0; edge_count < n_edges; edge_count++) {
        from = _binary_graph_raw_start[i++];
        to = _binary_graph_raw_start[i++];

        add_edge(&graph->nodes[from], &graph->nodes[to], 1);
        if (!oriented) {
            add_edge(&graph->nodes[to], &graph->nodes[from], 1);
        }
    }
    return graph;
}

#else

static const char filename[] = "resources/train.graph";

/** file_to_graph
 * [in] file_name: the name of the file to examine. It must have
 *  - a header line consisting of 3 ints :
 *      - number of nodes
 *      - number of edges
 *      - whether edges are oriented
 *  - then number of edges lines describing edges:
 *      - node from
 *      - node to
 * [return]: the result graph object
 */
static graph_t *file_to_graph(const char *file_name)
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

#endif

int main(void)
{
    graph_t *graph = file_to_graph(filename);
    printf("Processing \"%s\" (%5lu nodes)\n", filename, graph->size);

    // Test shortest path all to all and associated global efficiency
    int *result_all = malloc(graph->size * graph->size * sizeof(int));
    compute_shortest_paths(graph, result_all);
    show_shortest_paths(result_all, graph->size);
    printf("Global efficiency: %f\n", graph_global_efficiency(result_all, graph->size));

    // Test shortest path one to all and associated characteristics
    const int node_to_test = 3;
    node_heap_t heap;
    int *result = malloc(graph->size * sizeof(int));
    heap_init(&heap, result, graph->size);
    compute_shortest_path(graph, &graph->nodes[node_to_test], &heap, result);
    printf("Results for node %d:\n\n", node_to_test);
    printf("\tGraph diameter: %d\n", graph_diameter(result, graph->size));
    printf("\tGraph efficiency: %f\n", graph_efficiency(result, graph->size));
    printf("\tGraph closeness_centrality: %f\n", graph_closeness_centrality(result, graph->size));
    show_shortest_path(result, graph->size);

    // Test shortest path unweighted one to all and associated characteristics
    // Note: with our graphs, the unweighted version should behave exactly the same way
    node_queue_t queue;
    queue_init(&queue, graph->size);
    compute_shortest_path_unweighted(graph, &graph->nodes[node_to_test], &queue, result);
    printf("Results for node %d:\n\n", node_to_test);
    printf("\tGraph diameter: %d\n", graph_diameter(result, graph->size));
    printf("\tGraph efficiency: %f\n", graph_efficiency(result, graph->size));
    printf("\tGraph closeness_centrality: %f\n", graph_closeness_centrality(result, graph->size));
    show_shortest_path(result, graph->size);

    queue_free(&queue);
    heap_free(&heap);
    free(result_all);
    free(result);
    free_graph(graph);

    return 0;
}
