#include <iostream>

void clock(int, int);


int main()
{
    int hour, minute;

    std::cout << "Enter the number of hours: ";
    std::cin >> hour;
    std::cout << "Enter the number of minutes: ";
    std::cin >> minute;
    clock(hour, minute);

    return 0;
}

void clock(int hour, int minute)
{
    std::cout << "Time: " << hour << ":" << minute<< std::endl;
}
