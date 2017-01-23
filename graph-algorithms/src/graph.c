#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "graph.h"

graph_t *new_graph(size_t size)
{
    graph_t* graph = (graph_t *) malloc(sizeof(graph_t));
    memset(graph, 0, sizeof(graph_t));

    graph->nodes = (node_t *) malloc(size * sizeof(node_t));
    for (size_t i = 0; i < size; i++) {
        graph->nodes[i] = (node_t) {i, NULL};
    }

    graph->size = size;
    return graph;
}

void show_graph(graph_t *graph)
{
    for (size_t i = 0; i < graph->size; i++) {
        printf("%lu: {", i);
        for (edge_t *it = graph->nodes[i].out; it != NULL; it = it->next) {
            printf("%lu", it->to->index);
            if (it->next != NULL) {
                printf(", ");
            }
        }
        puts("}");
    }
}

void free_graph(graph_t *graph)
{
    for (size_t i = 0; i < graph->size; i++) {
        edge_t *it = graph->nodes[i].out;
        while (it != NULL) {
            edge_t *temp = it;
            it = it->next;
            free(temp);
        }
    }
    free(graph->nodes);
    free(graph);
}

void add_edge(node_t *from, node_t *to, int weight)
{
    edge_t *edge = (edge_t *) malloc(sizeof(edge_t));
    *edge = (edge_t) {from, to, weight, NULL};

    edge_t *it = from->out;
    if (it == NULL) {
        from->out = edge;
    } else {
        for (; it->next != NULL; it = it->next) ;
        it->next = edge;
    }
}

void remove_edge(edge_t *edge)
{
    (void) edge;
}
