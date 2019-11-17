#include <iostream>

int main(int argc, char *argv[])
{
    long long wpop, USpop;

    std::cout << "Enter the world's population: ";
    std::cin >> wpop;
    std::cout << "Enter the population of the US: ";
    std::cin >> USpop;

    std::cout << "The population of the US is " << 100.0 * USpop / wpop << "% of the world population." << std::endl;

    return 0;
}
