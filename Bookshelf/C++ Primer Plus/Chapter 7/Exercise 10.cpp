#include <iostream>

double add(double, double);
double sub(double, double);
double mul(double, double);
double calculate(double, double, double(double, double));

int main(int argc, char *argv[])
{
    double (*pf[3])(double, double) = {add, sub, mul};
    double x, y;

    std::cout << "Enter two real numbers: ";
    std::cin >> x >> y;

    for (int i = 0; i < 3; ++i)
    {
        std::cout << calculate(x, y, pf[i]) << "\n";
    }

    return 0;
}

double add(double x, double y)
{
    return x + y;
}
double sub(double x, double y)
{
    return x - y;
}
double mul(double x, double y)
{
    return x * y;
}
double calculate(double x, double y, double arith(double, double))
{
    return arith(x, y);
}
