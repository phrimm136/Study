#include <iostream>

double harmonic_mean(double x, double y);

int main(int argc, char *argv[])
{
    double x, y;

    std::cin >> x >> y;
    while (x != 0 && y != 0)
    {
        std::cout << harmonic_mean(x, y) << "\n";
        std::cin >> x >> y;
    }

    return 0;
}

double harmonic_mean(double x, double y)
{
    return 2.0 * x * y / (x + y);
}
