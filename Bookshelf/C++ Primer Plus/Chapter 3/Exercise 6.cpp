#include <iostream>

int main(int argc, char *argv[]) {
    // use SI metric.
    double distance, petrol;

    std::cout << "Enter distances you drove in kilometers: ";
    std::cin >> distance;
    std::cout << "Enter petrol in liters: ";
    std::cin >> petrol;
    std::cout << "Your fuel economy is " << petrol / (distance / 100) << "."
              << std::endl;

    return 0;
}
