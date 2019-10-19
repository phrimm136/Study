#include <iostream>

int main() {
    double height, weight;
    int ficonv = 12;
    double imconv = 0.0254;
    double pkconv = 1 / 2.2;

    std::cout << "Enter your height in feet and inches and weight in pounds: ";
    std::cin >> height >> weight;
    std::cout << "Your BMI is "
              << (weight * pkconv) /
                     ((height * ficonv * imconv) * (height * ficonv * imconv))
              << "." << std::endl;

    return 0;
}
