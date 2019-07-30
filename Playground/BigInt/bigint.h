#ifndef BIGINT_H
#define BIGINT_H

typedef struct bigint *bigint;

bigint create(char *input);
void assign(bigint *target, bigint source);
void print(bigint target);
int compare(bigint t1, bigint t2);
bigint add(bigint t1, bigint t2);
bigint sub(bigint t1, bigint t2);
bigint mul(bigint t1, bigint t2);
bigint dvd(bigint t1, bigint t2);

#endif
