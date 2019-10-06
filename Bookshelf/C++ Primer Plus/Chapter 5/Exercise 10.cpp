#include <iostream>

int main(int argc, char *argv[])
{
    int N = 0, j;

    std::cout << "Enter number of rows: ";
    std::cin >> N;

    for (int i = 0; i < N; ++i)
    {
        for (j = 0; j < N-i-1; ++j)
            std::cout << '.';
        for (; j < N; ++j)
            std::cout << '*';
        std::cout.put('\n');
    }

    return 0;
}
