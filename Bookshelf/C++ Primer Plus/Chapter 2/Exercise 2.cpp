#include <iostream>

int convert(int);

int main() {
    int furlongs;

    std::cout << "Enter a distance in furlongs: ";
    std::cin >> furlongs;
    std::cout << "The distance in yards is " << convert(furlongs) << "."
              << std::endl;

    return 0;
}

int convert(int furlongs) { return 220 * furlongs; }
