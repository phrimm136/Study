#include <iostream>
#include <cstring>

int main(int argc, char *argv[])
{
    char str[20] = "";
    int N = -1, i = 0;

    std::cout << "Enter words (to stop, type the word done):" << "\n";
    while (strcmp(str, "done") != 0)
    {
        i = 0;
        while ((str[i] = std::cin.get()) != ' ' && str[i] != '\n')
            ++i;
        str[i] = '\0';
        ++N;
    }

    std::cout << "You entered a total of " << N << " words." << std::endl;

    return 0;
}
