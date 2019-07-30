#include "bigint.h"
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BLOCK_SIZE 9
#define BLOCK_CARRY ((int) pow(10, BLOCK_SIZE))

struct node
{
    int data;
    struct node *next;
    struct node *prev;
};

struct bigint
{
    bool neg;
    int number;
    struct node *digit;
};


void enqueue_front(bigint target, int value)
{
    struct node *new;

    if ((new = malloc(sizeof(struct node))) == NULL)
        abort();
    new->data = value;
    new->prev = target->digit;
    new->next = target->digit->next;
    target->digit->next->prev = new;
    target->digit->next = new;
    target->number++;
}

void enqueue_rear(bigint target, int value)
{
    struct node *new;

    if ((new = malloc(sizeof(struct node))) == NULL)
        abort();
    new->data = value;
    new->prev = target->digit->prev;
    new->next = target->digit;
    target->digit->prev->next = new;
    target->digit->prev = new;
    target->number++;
}

void dequeue_front(bigint target)
{
    struct node *p = target->digit, *q = p->next;

    p->next = q->next;
    q->next->prev = p;
    free(q);
    target->number--;
}

void dequeue_rear(bigint target)
{
    struct node *p = target->digit, *q = p->prev;

    p->prev = q->prev;
    q->prev->next = p;
    free(q);
    target->number--;
}


bigint init(void)
{
    bigint target = NULL;

    if ((target = malloc(sizeof(struct bigint))) == NULL)
        abort();
    if ((target->digit = malloc(sizeof(struct node))) == NULL)
        abort();
    target->neg = false;
    target->digit->prev = target->digit;
    target->digit->next = target->digit;

    return target;
}

bigint create(char *input)
{
    int input_length;
    char block[10] = "";
    bigint target = init();

    input_length = strlen(input);
    if (input[0] == '-')
    {
        target->neg = true;
        input++;
    }

    while (0 < input_length)
    {
        // making a block
        strncpy(block,
                input_length < BLOCK_SIZE ? input : input+input_length-BLOCK_SIZE,
                input_length < BLOCK_SIZE ? input_length : BLOCK_SIZE);

        input_length -= BLOCK_SIZE;
        enqueue_front(target, atoi(block));
        memset(block, 0, BLOCK_SIZE+1);
    }

    return target;
}

void assign(bigint *target, bigint source)
{
    if (*target != NULL)
    {
        while ((*target)->digit != (*target)->digit->next)
            dequeue_front(*target);
    }
    else
            *target = init();

    // deep copy
    (*target)->neg = source->neg;
    (*target)->number = 0;
    for (struct node *p = source->digit->prev; p != source->digit; p = p->prev)
        enqueue_front(*target, p->data);
}

void print(bigint target)
{
    struct node *end = target->digit;

    if (target->neg == true)
        putchar('-');
    for (struct node *p = end->next; p != end; p = p->next)
    {
        if(p == end->next) // We don't have to fill zeros when printing the number of the first node.
            printf("%d", p->data);
        else // But we have to do when the rest nodes have number less than 100 million; digit changes
            printf("%09d", p->data);
    }
    putchar('\n');
}

int compare(bigint t1, bigint t2)
{
    struct node *p, *q;
    int i;

    if (t1->number > t2->number)
        return 1;
    else if (t1->number < t2->number)
        return -1;
    else
        for (i = t1->number, p = t1->digit->next, q = t2->digit->next; i >= 1; i--, p = p->next, q = q->next)
            if (p->data > q->data)
                return 1;
            else if (p->data < q->data)
                return -1;
    return 0;
}

bigint add(bigint augend, bigint addend)
{
    if (augend->neg == true && addend->neg == false) // (-) + (+)
    {
        bigint tmp = NULL;
        assign(&tmp, augend);
        tmp->neg = false;
        assign(&tmp, sub(addend, tmp));
        
        return tmp;
    }
    else if (augend->neg == false && addend->neg == true) // (+) + (-)
    {
        bigint tmp = NULL;
        assign(&tmp, addend);
        tmp->neg = false;
        assign(&tmp, sub(augend, tmp));

        return tmp;
    }
    else // (+) + (+) or (-) + (-)
    {
        bigint new = init();
        int sum = 0;
        struct node *p1 = augend->digit->prev, *p2 = addend->digit->prev;

        for (; p1 != augend->digit && p2 != addend->digit; p1 = p1->prev, p2 = p2->prev)
        {
            sum += p1->data + p2->data;
            enqueue_front(new, sum % (int) pow(10, BLOCK_SIZE));
            sum /= (int) pow(10, BLOCK_SIZE); // carry
        }
        for(; p1 != augend->digit; p1 = p1->prev)
        {
            sum += p1->data;
            enqueue_front(new, sum % (int) pow(10, BLOCK_SIZE));
            sum /= (int) pow(10, BLOCK_SIZE); // carry
        }
        for(; p2 != addend->digit; p2 = p2->prev)
        {
            sum += p2->data;
            enqueue_front(new, sum % (int) pow(10, BLOCK_SIZE));
            sum /= (int) pow(10, BLOCK_SIZE); // carry
        }
        if (sum != 0)
            enqueue_front(new, sum % (int) pow(10, BLOCK_SIZE)); // enqueue remaining carry

        if (augend->neg == true && addend->neg == true) // (-) + (-)
            new->neg = true;

        return new;
    }
}

bigint sub(bigint minuend, bigint subtrahend)
{
    bigint tmp = NULL;

    if (minuend->neg == true && subtrahend->neg == false) // (-) - (+)
    {
        assign(&tmp, subtrahend);
        tmp->neg = true;
        assign(&tmp, add(minuend, tmp));
        return tmp;
    }
    else if (minuend->neg == false && subtrahend->neg == true) // (+) - (-)
    {
        assign(&tmp, subtrahend);
        tmp->neg = false;
        assign(&tmp, add(minuend, tmp));
        return tmp;
    }
    else // (+) - (+) or (-) - (-)
    {
        if (compare(minuend, subtrahend) < 0) // t1 is smaller than t2
        {
            assign(&tmp, sub(subtrahend, minuend));
            tmp->neg ^= 1; // + on (-) - (-); - on (+) - (+).
            return tmp;
        }
        else
        {
            bigint new = init();
            struct node *p = minuend->digit->prev, *q = subtrahend->digit->prev;
            int i, diff = 0;
            bool borrow = 0;

            for (i = 1; i <= minuend->number; i++, p = p->prev, q = q->prev)
            {
                if (i > subtrahend->number)
                {
                    if (p->data - borrow != 0)
                        enqueue_front(new, p->data-borrow);
                    borrow = 0;
                }
                else
                {
                    if (p->data < q->data)
                    {
                        diff = ((int) pow(10, BLOCK_SIZE)) + p->data - q->data - borrow;
                        borrow = 1;
                    }
                    else
                    {
                        diff = p->data - q->data - borrow;
                        borrow = 0;
                    }
                    if (diff != 0 || new->digit == new->digit->next)
                        enqueue_front(new, diff);
                }
            }
            return new;
        }
    }
}

bigint mul(bigint multiplier, bigint multiplicand)
{
    bigint new = init();
    int carry = 0 , sum;
    long long result = 0;
    struct node *p, *q, *cur = new->digit, *cur_inner;

    for (int i = 0; i < multiplier->number + multiplicand->number - 1; i++, cur = cur->next)
        enqueue_front(new, 0); // make places to insert the result of multiplication
    new->number = multiplier->number + multiplicand->number - 1;
    if ((long long) multiplier->digit->next->data * multiplicand->digit->next->data >= pow(10, BLOCK_SIZE))
        // multiplication yields an additional digit
    {
        enqueue_front(new, 0);
        new->number++;
    }
    
    cur = new->digit->prev;
    // primal multiplication; multiply each block of the multiplier to the multiplcand
    for (p = multiplier->digit->prev; p != multiplier->digit; p = p->prev, cur = cur->prev)
    {
        cur_inner = cur;
        for (q = multiplicand->digit->prev; q != multiplicand->digit; q = q->prev, cur_inner = cur_inner->prev)
        {
            result = (long long) p->data * (long long) q->data;
            sum = (result % BLOCK_CARRY) + cur_inner->data + carry;
            carry = result / BLOCK_CARRY;
            if (sum > BLOCK_CARRY)
                carry += sum / BLOCK_CARRY;
            cur_inner->data = sum % BLOCK_CARRY;
        }
        if (carry > 0)
        {
            cur_inner->data = carry;
            carry = 0;
        }
    }

    if (multiplier->neg != multiplicand->neg) // (+) * (-) or (-) * (+)
        new->neg = true;

    return new;
}

bigint dvd(bigint dividend, bigint divisor)
{
    bigint new = init(), tmp = NULL, subend = NULL, digit = create("10");
    int result = 0, diff = (dividend->number - divisor->number) * BLOCK_SIZE +
        ((int) log10(dividend->digit->next->data) - (int) log10(divisor->digit->next->data));
    bool first = true, borrow = false;
    if (compare(dividend, divisor) < 0)
        enqueue_front(new, 0);
    else
    {
        assign(&tmp, dividend);
        assign(&subend, divisor);

        for (int i = 0; i < diff; i++)
            assign(&subend, mul(subend, digit));
        if (compare(tmp, subend) < 0) // division reduces a digit.
            borrow = true;

        // primal division; subtract the divisor from the dividned
        for (int i = diff; i >= 0; i--)
        {
            result *= 10;
            if (first == true)
            {
                if (result >= (int) pow(10, ((diff-borrow+1) % BLOCK_SIZE == 0) ? 9 : ((diff-borrow+1) % BLOCK_SIZE)))
                    // The first block could be not full.
                {
                    enqueue_rear(new, result / 10);
                    result %= 10;
                    first = false;
                }
            }
            else
                if (result >= BLOCK_CARRY)
                {
                    enqueue_rear(new, result / 10);
                    result %= 10;
                }

            while (compare(tmp, subend) >= 0)
            {
                assign(&tmp, sub(tmp, subend));
                result++;
            }
            assign(&tmp, mul(tmp, digit)); // instead of decreasing digit of divisor; increase that of dividend
        }
        if (result != 0)
            enqueue_rear(new, result);
    }

    if (dividend->neg != divisor->neg) // (+) / (-) or (-) / (+)
        new->neg = true;

    return new;
}
