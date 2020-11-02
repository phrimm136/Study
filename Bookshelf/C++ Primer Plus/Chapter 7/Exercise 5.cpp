#include <iostream>

long long factorial(unsigned n);

int main(int argc, char *argv[])
{
    unsigned n;

    std::cout << "Enter a number to calculate factorial of it: "
              << "\n";
    std::cin >> n;
    std::cout << "Factorial of " << n << " is " << factorial(n) << ".\n";

    return 0;
}

long long factorial(unsigned n)
{
    return n > 1 ? n * factorial(n - 1) : 1;
}
