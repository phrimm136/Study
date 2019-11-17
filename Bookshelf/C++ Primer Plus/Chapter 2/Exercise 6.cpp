#include <iostream>

int convert(double);

int main()
{
    double ly;

    std::cout << "Enter the number of light years: ";
    std::cin >> ly;
    std::cout << ly << " light years = " << convert(ly) << " astronomical units." << std::endl;

    return 0;
}

int convert(double ly)
{
    return ly * 63240;
}
