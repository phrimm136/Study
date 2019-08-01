#ifndef QUEUE_H
#define QUEUE_H

#include <stdbool.h>

void insert_queue(int i);
void remove_queue(void);
int return_first(void);
int return_last(void);
bool is_empty_queue(void);

#endif