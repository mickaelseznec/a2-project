#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

#include "graph.h"

typedef struct _node_heap {
    node_t **nodes;
    int *distances;
    size_t size;
    size_t inner_size;
} node_heap_t;

typedef struct _node_queue {
    node_t **nodes;
    size_t first, last, count;
    size_t size;
} node_queue_t;

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

int *compute_shortest_paths(graph_t *graph)
{
    size_t n = graph->size;
    int (*res_matrix)[n] = (int (*)[n]) malloc(n * n * sizeof(int));

    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            res_matrix[i][j] = INT_MAX;
        }
    }

    /* Initialize with edges' weight*/
    for (size_t i = 0; i < n; i++) {
        res_matrix[i][i] = 0;
        for (edge_t *it = graph->nodes[i].out; it != NULL; it = it->next) {
            res_matrix[it->from->index][it->to->index] = it->weight;
        }
    }

    /* Do the Floyd-Marshald algorithm*/
    for (size_t k = 0; k < n; k++) {
        for (size_t i = 0; i < n; i++) {
            for (size_t j = 0; j < n; j++) {
                if (res_matrix[i][k] < INT_MAX && res_matrix[k][j] < INT_MAX
                        && res_matrix[i][j] > res_matrix[i][k] + res_matrix[k][j])
                    res_matrix[i][j] = res_matrix[i][k] + res_matrix[k][j];
            }
        }
    }

    return (int *) res_matrix;
}

static void swap_position(node_t **heap, size_t index_1, size_t index_2)
{
    node_t *temp = heap[index_1];
    heap[index_1] = heap[index_2];
    heap[index_2] = temp;
}

static node_t *heap_pop(node_heap_t *heap)
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

static void heap_push(node_heap_t *heap, node_t *node)
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

static void heap_init(node_heap_t *heap, int *distances, size_t size)
{
    *heap = (node_heap_t) {NULL, distances, size, 0};
    heap->nodes = (node_t **) malloc(heap->size * sizeof(*heap->nodes));
    memset(heap->nodes, 0, heap->size * sizeof(*heap->nodes));
}

int *compute_shortest_path(graph_t* graph, node_t *source)
{
    int *distances = (int *) malloc(graph->size * sizeof(*distances));
    /* Initialize all distance to "infinity" but the source itself*/
    for (size_t i = 0; i < graph->size; i++)
        distances[i] = INT_MAX;
    distances[source->index] = 0;

    /* Initialize heap*/
    node_heap_t heap;
    heap_init(&heap, distances, graph->size);
    heap_push(&heap, source);

    node_t *node = NULL;
    while ((node = heap_pop(&heap)) != NULL) {
        for (edge_t *it = node->out; it != NULL; it = it->next) {
            if (distances[it->to->index] > distances[it->from->index] + it->weight) {
                distances[it->to->index] = distances[it->from->index] + it->weight;
                heap_push(&heap, it->to);
            }
        }
    }

    free(heap.nodes);
    return distances;
}

static void queue_init(node_queue_t *queue, size_t size)
{
    queue->nodes = malloc(size * sizeof(node_t *));
    queue->first = 0;
    queue->last = 0;
    queue->count = 0;
    queue->size = size;
}

static int queue_enqueue(node_queue_t *queue, node_t *node)
{
    if (queue->count >= queue->size)
        return -1;

    queue->nodes[queue->last] = node;
    queue->last = (queue->last + 1) % queue->size;
    queue->count++;
    return 0;
}

static node_t *queue_dequeue(node_queue_t *queue)
{
    if (queue->count == 0)
        return NULL;

    node_t *result = queue->nodes[queue->first];
    queue->first = (queue->first + 1) % queue->size;
    queue->count--;

    return result;
}

int *compute_shortest_path_unweighted(graph_t * graph, node_t *source)
{
    int *distances = (int *) malloc(graph->size * sizeof(*distances));
    int *marked = (int *) malloc(graph->size * sizeof(*marked));

    /* Initialize all distance to "infinity" but the source itself*/
    for (size_t i = 0; i < graph->size; i++)
        distances[i] = INT_MAX;
    distances[source->index] = 0;

    memset(marked, 0, graph->size * sizeof(*marked));

    node_queue_t queue;
    queue_init(&queue, graph->size);
    queue_enqueue(&queue, source);
    marked[source->index] = 1;

    node_t *node;
    while ((node = queue_dequeue(&queue)) != NULL) {

        for (edge_t *it = node->out; it != NULL; it = it->next) {
            if (!marked[it->to->index]) {
                distances[it->to->index] = distances[node->index] + 1;
                marked[it->to->index] = 1;
                queue_enqueue(&queue, it->to);
            }
        }
    }

    free(marked);
    return distances;
}

float graph_global_efficiency(int *matrix, size_t size)
{
    int (*mat)[size] = (int (*)[size]) matrix;
    float sum = 0;

    for (size_t i = 0; i < size; i++) {
        for (size_t j = i + 1; j < size; j++) {
            if (mat[i][j] != INT_MAX)
                sum += 1 / mat[i][j];
        }
    }
    return (2 * sum) / (size * (size - 1));
}


int graph_diameter(int *distances, size_t size)
{
    int max = 0;
    for (size_t i = 0; i < size; i++) {
        if (distances[i] != INT_MAX && distances[i] > max)
            max = distances[i];
    }
    return max;
}

float graph_efficiency(int *distances, size_t size)
{
    int reachable = 0;
    float sum = 0;
    for (size_t i = 0; i < size; i++) {
        if (distances[i] != INT_MAX) {
            reachable++;
            sum += distances[i];
        }
    }
    return (reachable != 0) ? sum / reachable : 0;
}

void show_shortest_path(int *matrix, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        printf("% d ", matrix[i] == INT_MAX ? -1 : matrix[i]);
        if ((i + 1) % 20 == 0)
            puts("");
    }
    puts("");
}

void show_shortest_paths(int *matrix, size_t size)
{
    int (*mat)[size] = (int (*)[size]) matrix;
    for (size_t i = 0; i < size; i++) {
        for (size_t j = 0; j < size; j++) {
            printf("% d ", mat[i][j] == INT_MAX ? -1 : mat[i][j]);
        }
        puts("");
    }
    puts("");
}
