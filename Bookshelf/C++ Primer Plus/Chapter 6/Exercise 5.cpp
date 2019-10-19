#include <iostream>

int main(int argc, char *argv[]) {
    int tvarp = 0, tax = 0;

    while (1) {
        std::cout
            << "Enter your income in tvarp (non numeric input to terminate): ";
        if (!(std::cin >> tvarp) || tvarp < 0) {
            std::cout << "Illegal input; terminating...\n";
            return 0;
        }
        if (tvarp > 5000 && tvarp <= 15000)
            tax = (tvarp - 5000) / 10;
        else if (tvarp <= 35000)
            tax = 1000 + (tvarp - 15000) / 100 * 15;
        else
            tax = 4000 + (tvarp - 35000) / 5;
        std::cout << "Your tax for income is " << tax << ".\n";
    }

    return 0;
}
