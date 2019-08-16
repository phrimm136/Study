#include <iostream>

int main()
{
    int height;
    const double convert = 1/12.;

    std::cout << "Enter your height in inches: __\b\b";
    std::cin >> height;
    std::cout << "Your height in feet and inches is " << height * convert << "." << std::endl;

    return 0;
}
