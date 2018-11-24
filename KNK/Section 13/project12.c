#include <stdio.h>

int main()
{
    char sentence[30][20], terminating_characher = '\0';
    int length = 0;

    printf("Enter a sentence: ");
    for (;;length++)
    {
        scanf("%s", sentence[length]);
        for (char *p = &sentence[length][0]; *p; p++)
        {
            if(*p == '.' || *p == ',' || *p == '!' || *p == '?')
            {
                terminating_characher = *p;
                *p = '\0';
                break;
            }
        }
        if (terminating_characher)
            break;
    }

    printf("Reversal of sentence:");
    for (int i = length; i >= 0; i--)
    {
        printf("%s", sentence[i]);
        if (i == 0)
            printf("%c", terminating_characher);
        else
            printf(" ");
    }

    return 0;
}