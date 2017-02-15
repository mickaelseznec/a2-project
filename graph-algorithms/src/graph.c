#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

#include "graph.h"
#include "node_heap.h"
#include "node_queue.h"

graph_t *new_graph(size_t size)
{
    graph_t* graph = (graph_t *) malloc(sizeof(graph_t));
    memset(graph, 0, sizeof(graph_t));

    graph->nodes = (node_t *) malloc(size * sizeof(node_t));
    if (graph->nodes == NULL)
        fprintf(stderr, "Could not alloc %zu\n", size * sizeof(node_t));
    for (size_t i = 0; i < size; i++) {
        graph->nodes[i] = (node_t) {i, NULL};
    }

    graph->size = size;
    return graph;
}

void show_graph(graph_t *graph)
{
    for (size_t i = 0; i < graph->size; i++) {
        printf("%zu: {", i);
        for (edge_t *it = graph->nodes[i].out; it != NULL; it = it->next) {
            printf("%zu", it->to->index);
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

/** compute_shortest_paths
 * [in] graph: graph object used
 * [out] result: must be a n*n sized array. Contains in [i][j] the shortest
 *               distance from node i to j.
 */
void compute_shortest_paths(graph_t *graph, int *result)
{
    size_t n = graph->size;
    int (*res_matrix)[n] = (int (*)[n]) result;

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
}

void compute_shortest_path(graph_t* graph, node_t *source, node_heap_t *heap, int *result)
{
    /* Initialize all distance to "infinity" but the source itself*/
    for (size_t i = 0; i < graph->size; i++)
        result[i] = INT_MAX;
    result[source->index] = 0;

    heap_push(heap, source);

    node_t *node = NULL;
    while ((node = heap_pop(heap)) != NULL) {
        for (edge_t *it = node->out; it != NULL; it = it->next) {
            if (result[it->to->index] > result[it->from->index] + it->weight) {
                result[it->to->index] = result[it->from->index] + it->weight;
                heap_push(heap, it->to);
            }
        }
    }
}

void compute_shortest_path_unweighted(graph_t * graph, node_t *source, node_queue_t *queue, int *result)
{

    /* Initialize all distance to "infinity" but the source itself*/
    for (size_t i = 0; i < graph->size; i++)
        result[i] = INT_MAX;
    result[source->index] = 0;

    memset(queue->marked, 0, graph->size * sizeof(int));
    queue_enqueue(queue, source);
    queue->marked[source->index] = 1;

    node_t *node;
    while ((node = queue_dequeue(queue)) != NULL) {

        for (edge_t *it = node->out; it != NULL; it = it->next) {
            if (!queue->marked[it->to->index]) {
                result[it->to->index] = result[node->index] + 1;
                queue->marked[it->to->index] = 1;
                queue_enqueue(queue, it->to);
            }
        }
    }
}

/** graph_global_efficiency
 * [in] matrix: the result array of compute_shortest_paths
 * [in] size: the size of the graph
 */
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


/** graph_diameter
 * [in] distances: the result array of compute_shortest_path
 * [in] size: the size of the graph
 */
int graph_diameter(int *distances, size_t size)
{
    int max = 0;
    for (size_t i = 0; i < size; i++) {
        if (distances[i] != INT_MAX && distances[i] > max)
            max = distances[i];
    }
    return max;
}

/** graph_efficiency
 * [in] distances: the result array of compute_shortest_path
 * [in] size: the size of the graph
 */
float graph_efficiency(int *distances, size_t size)
{
    int reachable = 0;
    int sum = 0;
    for (size_t i = 0; i < size; i++) {
        if (distances[i] != INT_MAX) {
            reachable++;
            sum += distances[i];
        }
    }
    return (reachable != 0) ? (float) sum / reachable : 0;
}

/** graph_closeness_centrality
 * Is defined as the inverse of graph_efficiency.
 */
float graph_closeness_centrality(int *distances, size_t size)
{
    return 1.0f / graph_efficiency(distances, size);
}

/** show_shortest_path
 * Help to show the result of compute_shortest_path
 * If a node is not reachable from another, display -1
 *
 * [in] distances: the result array of compute_shortest_path
 * [in] size: the size of the graph
 */
void show_shortest_path(int *distances, size_t size)
{
    for (size_t i = 0; i < size; i++) {
        printf("% d ", distances[i] == INT_MAX ? -1 : distances[i]);
        if ((i + 1) % 20 == 0)
            puts("");
    }
    puts("");
}

/** show_shortest_paths
 * Help to show the result of compute_shortest_paths
 * If a node is not reachable from another, display -1
 *
 * [in] matrix: the result matrix of compute_shortest_paths
 * [in] size: the size of the graph
 */
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
