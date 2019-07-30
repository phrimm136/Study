#include "bigint.h"
#include <stdio.h>

int main(void)
{
    bigint a = NULL;
    char input, number[1000] = "";

    for (;;)
    {
        scanf("%c", &input);

        switch (input)
        {
        case '=':
            scanf("%s", number);
            assign(&a, create(number));
            break;
        case '+':
            scanf("%s", number);
            assign(&a, add(a, create(number)));
            break;
        case '-':
            scanf("%s", number);
            assign(&a, sub(a, create(number)));
            break;
        case '*':
            scanf("%s", number);
            assign(&a, mul(a, create(number)));
            break;
        case '/':
            scanf("%s", number);
            assign(&a, dvd(a, create(number)));
            break;
        case 'p':
            print(a);
            break;
        case 'x':
            return 0;
        }
    }
}
