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

size_t *compute_shortest_paths(graph_t *graph)
{
    size_t n = graph->size;
    size_t (*res_matrix)[n] = (size_t (*)[n]) calloc(n * n, sizeof(size_t));

    /* Initialize with edges' weight*/
    for (size_t i = 0; i < n; i++) {
        for (edge_t *it = graph->nodes[i].out; it != NULL; it = it->next) {
            res_matrix[it->from->index][it->to->index] = it->weight;
        }
    }

    /* Do the Floyd-Marshald algorithm*/
    for (size_t k = 0; k < n; k++) {
        for (size_t i = 0; i < n; i++) {
            for (size_t j = 0; j < n; j++) {
                if (res_matrix[i][k] > 0 && res_matrix[k][j] > 0)
                    if (res_matrix[i][j] == 0 || res_matrix[i][j] > res_matrix[i][k] + res_matrix[k][j])
                    res_matrix[i][j] = res_matrix[i][k] + res_matrix[k][j];
            }
        }
    }

    return (size_t *) res_matrix;
}

void show_shortest_paths(size_t *matrix, size_t size)
{
    size_t (*mat)[size] = (size_t (*)[size]) matrix;
    for (size_t i = 0; i < size; i++) {
        for (size_t j = 0; j < size; j++) {
            printf("%lu ", mat[i][j]);
        }
        puts("");
    }
}
