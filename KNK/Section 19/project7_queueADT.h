#ifndef QUEUE_H
#define QUEUE_H

#include <stdbool.h>

typedef struct queue_type *Queue;

Queue create_queue(void);
void destroy(Queue q);
void insert_queue(Queue q, int i);
void remove_queue(Queue q);
int return_first(Queue q);
int return_last(Queue q);
bool is_empty_queue(Queue q);

#endif