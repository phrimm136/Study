#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *helpmsg = "Options: \n"
                      "  -h         Print this help message.                       \n"
                      "  -v         Optional verbose flag.                         \n"
                      "  -s <num>   Number of set index bits.                      \n"
                      "  -E <num>   Number of lines per set.                       \n"
                      "  -b <num>   Number of block offset bits.                   \n"
                      "  -t <file>  Trace file.                                    \n"
                      "\n"
                      "Examples:                                                   \n"
                      "  linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace      \n"
                      "  linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace";

typedef struct
{
    int h;
    int v;
    int s;
    int E;
    int b;
    char *t;
} Arg;

typedef struct
{
    int valid;
    int tag;
    int elapsed;
} CacheLine;

typedef CacheLine *CacheSet;
typedef CacheSet *Cache;

typedef struct
{
    int hit;
    int miss;
    int eviction;
} Cnt;

void initArgs(int argc, char **argv, Arg *arg)
{
    int opt;

    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1)
    {
        switch (opt)
        {
        case 'h':
            arg->h = 1;
            break;
        case 'v':
            arg->v = 1;
            break;
        case 's':
            arg->s = atoi(optarg);
            break;
        case 'E':
            arg->E = atoi(optarg);
            break;
        case 'b':
            arg->b = atoi(optarg);
            break;
        case 't':
            arg->t = malloc(sizeof(char) * (strlen(optarg) + 1));
            strcpy(arg->t, optarg);
            break;
        default:
            fprintf(stderr, "wrong argument\n");
            exit(EXIT_FAILURE);
            break;
        }
    }
}

void help(Arg *arg)
{
    if (arg->h == 1 || arg->s == -1 || arg->E == -1 || arg->b == -1 || arg->t == NULL)
    {
        puts(helpmsg);
        exit(EXIT_SUCCESS);
    }
}

void initCache(Cache *cache, Arg *arg)
{
    int S = 1 << arg->s;

    *cache = malloc(sizeof(CacheSet) * S);
    for (int i = 0; i < S; ++i)
    {
        (*cache)[i] = malloc(sizeof(CacheLine) * arg->E);
        for (int j = 0; j < arg->E; ++j)
        {
            (*cache)[i][j].valid = 0;
            (*cache)[i][j].tag = -1;
            (*cache)[i][j].elapsed = 0;
        }
    }
}

void findCache(Cache *cache, Arg *arg, Cnt *counts, int addr)
{
    int tag = addr >> (arg->s + arg->b);
    int S = (0x0FFFFFFFFFFFFFFFF >> (64 - arg->s)) & (addr >> arg->b);
    int verbose = arg->v;
    int least_idx = 0, least = 0;
    CacheSet cacheset = (*cache)[S];

    for (int i = 0; i < arg->E; ++i)
        if (cacheset[i].valid)
            ++cacheset[i].elapsed;

    for (int i = 0; i < arg->E; ++i)
    {
        if (cacheset[i].valid && tag == cacheset[i].tag)
        {
            if (verbose)
                printf("%s", " hit");
            cacheset[i].elapsed = 0;
            ++counts->hit;
            return;
        }
    }

    if (verbose)
        printf("%s", " miss");
    ++counts->miss;
    for (int i = 0; i < arg->E; ++i)
    {
        if (cacheset[i].valid == 0)
        {
            cacheset[i].valid = 1;
            cacheset[i].elapsed = 1;
            cacheset[i].tag = tag;
            return;
        }
    }

    if (verbose)
        printf("%s", " eviction");
    ++counts->eviction;
    least = cacheset[0].elapsed;
    for (int i = 1; i < arg->E; ++i)
    {
        if (cacheset[i].elapsed > least)
        {
            least = cacheset[i].elapsed;
            least_idx = i;
        }
    }
    cacheset[least_idx].tag = tag;
    cacheset[least_idx].elapsed = 0;
}

void runTrace(Cache *cache, Arg *arg, Cnt *counts)
{
    FILE *trace = fopen(arg->t, "r");
    char op;
    int addr, size;
    int verbose = arg->v;

    while (fscanf(trace, " %c %x,%d", &op, &addr, &size) > 0)
    {
        switch (op)
        {
        case 'I':
            break;
        case 'L':
            if (verbose)
                printf("L %x,%d", addr, size);
            findCache(cache, arg, counts, addr);
            if (verbose)
                putchar('\n');
            break;
        case 'S':
            if (verbose)
                printf("S %x,%d", addr, size);
            findCache(cache, arg, counts, addr);
            if (verbose)
                putchar('\n');
            break;
        case 'M':
            if (verbose)
                printf("M %x,%d", addr, size);
            findCache(cache, arg, counts, addr);
            findCache(cache, arg, counts, addr);
            if (verbose)
                putchar('\n');
            break;
        default:
            fprintf(stderr, "Error: invalid operation.");
            exit(EXIT_FAILURE);
        }
    }
}

void unloadCache(Cache *cache, Arg *arg)
{
    int S = 1 << arg->s;
    for (int i = 0; i < S; ++i)
    {
        free((*cache)[i]);
    }
    free(*cache);
}

int main(int argc, char **argv)
{
    Arg arg = {0, 0, -1, -1, -1, NULL};
    Cnt counts = {0, 0, 0};
    Cache cache;

    initArgs(argc, argv, &arg);
    help(&arg);
    initCache(&cache, &arg);

    runTrace(&cache, &arg, &counts);

    unloadCache(&cache, &arg);

    printSummary(counts.hit, counts.miss, counts.eviction);

    return 0;
}
