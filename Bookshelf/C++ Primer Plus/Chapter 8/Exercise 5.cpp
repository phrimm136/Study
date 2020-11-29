#include <array>
#include <iostream>

template <typename T> T max5(std::array<T, 5> &);

int main(int argc, char *argv[])
{
    std::array<int, 5> intarr = {234, 768, 34, 5, 58739};
    std::array<double, 5> doublearr = {512345.345, 345.2345, 345345.3425, 3456.1234, 4576.345};

    std::cout.setf(std::ios::showpoint);
    std::cout.precision(10);

    std::cout << max5(intarr) << "\n";
    std::cout << max5(doublearr) << "\n";

    return 0;
}

template <typename T> T max5(std::array<T, 5> &arr)
{
    T max = arr.at(0);

    for (int i = 1; i < 5; ++i)
    {
        if (max < arr.at(i))
        {
            max = arr.at(i);
        }
    }

    return max;
}
