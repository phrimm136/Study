#include <iostream>

int main(int argc, char *argv[])
{
    int sum = 0, input;

    std::cout << "Enter numbers for cumulative sum:\n";
    std::cin >> input;
    while (input)
    {
        sum += input;
        std::cout << " + " << input << " = " << sum << '\n';
        std::cin >> input;
    }
    std::cout << "Entered zero. Terminating.." << std::endl;
    return 0;
}
