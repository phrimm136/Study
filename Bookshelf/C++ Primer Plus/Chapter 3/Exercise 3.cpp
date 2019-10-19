#include <iostream>

int main() {
    int D, M, S;
    double Mconv = 1 / 60., Sconv = 1 / 3600.;

    std::cout << "Enter a latitide om degrees, minutes, and seconds:\n";
    std::cout << "First, engter the degrees: ";
    std::cin >> D;
    std::cout << "Next, enter the minutes of arc: ";
    std::cin >> M;
    std::cout << "Finally, enter the seconds of arc: ";
    std::cin >> S;
    std::cout << D << " degrees, " << M << " minutes, " << S
              << " seconds = " << double(D) + M * Mconv + S * Sconv
              << " degrees" << std::endl;

    return 0;
}
