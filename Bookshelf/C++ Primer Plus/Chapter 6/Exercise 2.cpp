#include <array>
#include <iostream>

int main(int argc, char *argv[])
{
    std::array<double, 10> arr;
    int i, larger = 0;
    double avg = 0;

    std::cout << "Enter up to 10 donation values:\n";
    for (i = 0; i < 10; ++i)
        if (!(std::cin >> arr.at(i)))
            break;
    for (int j = 0; j < i; ++j)
        avg += arr.at(j);
    avg /= i;
    for (int j = 0; j < i; ++j)
        if (arr.at(j) > avg)
            larger++;

    std::cout << "The average donation value is " << avg << ". \n";
    std::cout << "The number of donations exceeding the average is " << larger << ". \n";
    return 0;
}
