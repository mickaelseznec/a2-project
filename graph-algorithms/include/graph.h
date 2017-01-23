#ifndef __GRAPH_H__
#define __GRAPH_H__

#include <stddef.h>

typedef struct _node_t {
    size_t index;
    struct _edge_t *out;
} node_t;

typedef struct _edge_t {
    node_t *from;
    node_t *to;
    int weight;
    struct _edge_t *next;
} edge_t;

typedef struct _graph_t {
    size_t size;
    node_t *nodes;
} graph_t;

graph_t *new_graph(size_t size);
void free_graph(graph_t *graph);
void add_edge(node_t *from, node_t *to, int weight);

size_t *compute_shortest_paths(graph_t *graph);

void show_graph(graph_t *graph);
void show_shortest_paths(size_t *matrix, size_t size);

#endif
