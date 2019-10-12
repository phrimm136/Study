#include <iostream>
#include <cctype>

int main(int argc, char *argv[])
{
    char ch;

    while (1)
    {
        std::cin >> ch;

        if (ch == '@')
            break;
        else if (isdigit(ch))
            continue;
        else if (islower(ch))
            std::cout << char(toupper(ch));
        else if (isupper(ch))
            std::cout << char(tolower(ch));
        else
            std::cout << ch;
    }
    std::cout.put('\n');

    return 0;
}
