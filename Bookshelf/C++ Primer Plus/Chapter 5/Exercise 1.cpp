#include <iostream>

int main(int argc, char *argv[])
{
    int sum = 0, from, to;

    std::cout << "Enter two integers to calculate the ranged sum of them: \n";
    std::cin >> from >> to;

    for (int i = from; i <= to; ++i)
        sum += i;

    std::cout << "The ranged sum is " << sum << "." << std::endl;

    return 0;
}
