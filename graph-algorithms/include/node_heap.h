#ifndef __NODE_HEAP_H
#define __NODE_HEAP_H

#include "graph.h"

typedef struct _node_heap {
    node_t **nodes;
    int *distances;
    size_t size;
    size_t inner_size;
} node_heap_t;

node_t *heap_pop(node_heap_t *heap);
void heap_push(node_heap_t *heap, node_t *node);
void heap_init(node_heap_t *heap, int *distances, size_t size);
void heap_free(node_heap_t *heap);

#endif
