#include <array>
#include <iostream>

int main(int argc, char *argv[]) {
    std::array<double, 3> dash;

    std::cout << "Enter three times of 40-meter dash:\n";
    std::cin >> dash.at(0) >> dash.at(1) >> dash.at(2);

    std::cout << "Times: " << dash.at(0) << ", " << dash.at(1) << ", "
              << dash.at(2) << '\n';
    std::cout << "Average: " << (dash.at(0) + dash.at(1) + dash.at(2)) / 3
              << std::endl;

    return 0;
}
