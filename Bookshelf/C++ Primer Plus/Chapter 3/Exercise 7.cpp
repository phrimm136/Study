#include <iostream>

int main(int argc, char *argv[])
{
    double europeGasoline;
    double inverseFactor = 62.14 * 3.875;

    std::cout << "Enter an automobile gasoline consumption figure in the European style: ";
    std::cin >> europeGasoline;
    std::cout << "The gasoline consumption figure in the mpg is " << inverseFactor / europeGasoline << "." << std::endl;

    return 0;
}
