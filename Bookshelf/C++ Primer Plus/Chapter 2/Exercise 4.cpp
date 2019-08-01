#include <iostream>

int convert(int);


int main()
{
    int age;

    std::cout << "Enter your age: ";
    std::cin >> age;
    std::cout << "Your age in months is " << convert(age) << "." << std::endl;

    return 0;
}

int convert(int age)
{
    return age * 12; // It seems that 384 is a typo of 348.
}
