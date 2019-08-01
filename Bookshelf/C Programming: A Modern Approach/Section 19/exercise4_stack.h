#ifndef _STACK_H
#define _STACK_H

#include <stdbool.h>

typedef struct stack_type *Stack;

void make_empty(Stack *s);
bool is_empty(Stack *s);
bool is_full(Stack *s);
void push(Stack *s, int i);
int pop(Stack *s);

#endif