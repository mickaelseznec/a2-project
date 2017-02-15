#ifndef __NODE_QUEUE_H__
#define __NODE_QUEUE_H__

#include "graph.h"

typedef struct _node_queue {
    node_t **nodes;
    int *marked;
    size_t first, last, count;
    size_t size;
} node_queue_t;

void queue_init(node_queue_t *queue, size_t size);
int queue_enqueue(node_queue_t *queue, node_t *node);
node_t *queue_dequeue(node_queue_t *queue);
void queue_free(node_queue_t *queue);

#endif
