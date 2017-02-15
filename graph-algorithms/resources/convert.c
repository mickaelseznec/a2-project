#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

static const char filename[] = "resources/train.graph";

#define file_puts(file, value) fwrite(&value, sizeof(value), 1, file)

int main(int argc, char *argv[])
{
    if (argc != 3) {
        printf("Usage: %s in_file out_file\n", argv[0]);
        return -1;
    }

    uint16_t n_nodes, n_edges, oriented;

    FILE *in = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    if (in == NULL) {
        printf("%s: %s\n", argv[1], strerror(errno));
        return -1;
    }

    fscanf(in, "%hu %hu %hu", &n_nodes, &n_edges, &oriented);
    printf("Reading %u connections between %u nodes\n", n_edges, n_nodes);
    file_puts(out, n_nodes);
    file_puts(out, n_edges);
    file_puts(out, oriented);

    /* Loop to add edges*/
    uint16_t from, to;
    while (fscanf(in, "%hu %hu", &from, &to) != EOF) {
        file_puts(out, from);
        file_puts(out, to);
    }
    fclose(in);
    fclose(out);

    return 0;
}
