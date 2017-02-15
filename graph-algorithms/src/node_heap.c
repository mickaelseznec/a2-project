#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#include "graph.h"
#include "node_heap.h"

static void swap_position(node_t **heap, size_t index_1, size_t index_2)
{
    node_t *temp = heap[index_1];
    heap[index_1] = heap[index_2];
    heap[index_2] = temp;
}

node_t *heap_pop(node_heap_t *heap)
{
    if (heap->inner_size == 0)
        return NULL;

    node_t *res = heap->nodes[0];
    heap->nodes[0] = heap->nodes[heap->inner_size - 1];
    heap->inner_size--;

    size_t i = 0;
    while (1) {
        size_t left = i * 2 + 1, right = (i + 1) * 2;

        if (left < heap->inner_size
                && heap->nodes[left] != NULL
                && heap->distances[heap->nodes[left]->index] < heap->distances[heap->nodes[i]->index]) {
            swap_position(heap->nodes, i, left);
            i = left;
        } else if (right < heap->inner_size
                && heap->nodes[right] != NULL
                && heap->distances[heap->nodes[right]->index] < heap->distances[heap->nodes[i]->index]) {
            swap_position(heap->nodes, i, right);
            i = right;
        } else {
            break;
        }
    }

    return res;
}

void heap_push(node_heap_t *heap, node_t *node)
{
    if (heap->inner_size == heap->size) {
        fprintf(stderr, "Heap Overflow\n");
        exit(EXIT_FAILURE);
    }

    heap->nodes[heap->inner_size] = node;

    int i = heap->inner_size;
    while (1) {
        int father = (i - 1) / 2;

        if (father >= 0
                && heap->distances[heap->nodes[father]->index] > heap->distances[heap->nodes[i]->index]) {
            swap_position(heap->nodes, i, father);
            i = father;
        } else {
            break;
        }
    }
    heap->inner_size++;
}

void heap_init(node_heap_t *heap, int *distances, size_t size)
{
    *heap = (node_heap_t) {NULL, distances, size, 0};
    heap->nodes = (node_t **) malloc(heap->size * sizeof(*heap->nodes));
    memset(heap->nodes, 0, heap->size * sizeof(*heap->nodes));
}

void heap_free(node_heap_t *heap)
{
    free(heap->nodes);
}
