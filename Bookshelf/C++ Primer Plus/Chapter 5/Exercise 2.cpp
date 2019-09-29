#include <iostream>
#include <array>

int main(int argc, char *argv[])
{
    const int ArSize = 101;
    std::array<long double, ArSize> factorials;

    factorials.at(1) = factorials.at(0) = 1L;
    for (int i = 2; i < ArSize; ++i)
        factorials.at(i) = i * factorials.at(i-1);
    for (int i = 0; i < ArSize; ++i)
        std::cout << i << "! = " << factorials.at(i) << std::endl;


    return 0;
}
