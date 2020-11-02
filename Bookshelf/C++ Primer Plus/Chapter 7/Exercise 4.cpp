#include <iostream>

long double probability(unsigned numbers, unsigned picks, unsigned mega_number);

int main(int argc, char *argv[])
{
    double total, choices, mega_number;

    std::cout << "Enter the total number of choices on the game card,\n"
              << "the number of picks allowed and\n"
              << "the total number of mega number: \n";

    while ((std::cin >> total >> choices >> mega_number) && choices <= total)
    {
        std::cout << "You have one chance in " << probability(total, choices, mega_number) << " of winning.\n"
                  << "Next three numbers (q to quit): ";
    }
    std::cout << "bye\n";

    return 0;
}

long double probability(unsigned numbers, unsigned picks, unsigned mega_number)
{
    long double result = 1. * mega_number;
    long double n;
    unsigned p;

    for (n = numbers, p = picks; p > 0; --n, --p)
        result *= n / p;

    return result;
}
