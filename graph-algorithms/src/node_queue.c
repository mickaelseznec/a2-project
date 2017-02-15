#include <stdlib.h>

#include "graph.h"
#include "node_queue.h"

void queue_init(node_queue_t *queue, size_t size)
{
    queue->nodes = malloc(size * sizeof(node_t *));
    queue->marked = malloc(size * sizeof(int));
    queue->first = 0;
    queue->last = 0;
    queue->count = 0;
    queue->size = size;
}

void queue_free(node_queue_t *queue)
{
    free(queue->nodes);
    free(queue->marked);
}

int queue_enqueue(node_queue_t *queue, node_t *node)
{
    if (queue->count >= queue->size)
        return -1;

    queue->nodes[queue->last] = node;
    queue->last = (queue->last + 1) % queue->size;
    queue->count++;
    return 0;
}

node_t *queue_dequeue(node_queue_t *queue)
{
    if (queue->count == 0)
        return NULL;

    node_t *result = queue->nodes[queue->first];
    queue->first = (queue->first + 1) % queue->size;
    queue->count--;

    return result;
}


