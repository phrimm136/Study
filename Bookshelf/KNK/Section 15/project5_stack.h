#include <stdbool.h>

#define STACK_SIZE 100

void make_empty(void);
bool is_empty(void);
bool is_full(void);
void push(char i);
char pop(void);
void RPN_expression(void);
void calculate(char operator);
void print_value(int calculated);
void error(int error_code);
void stack_overflow(void);
void stack_underflow(void);