#include <iostream>

int CtoF(int);


int main()
{
    int Cel;

    std::cout << "Please enter a Celsius Value: ";
    std::cin >> Cel;
    std::cout << Cel << " degrees Celsius is " << CtoF(Cel) << " degrees Fahrenheit." << std::endl;

    return 0;
}

int CtoF(int Cel)
{
    return Cel * 9 / 5 + 32;
}
