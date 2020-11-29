#include <iostream>
#include <string>

template <typename T> T maxn(T[], const int);
template <> std::string maxn(std::string[], const int);

int main(int argc, char *argv[])
{
    int intarr[6] = {234, 768, 34, 5, 58739, 4576};
    double doublearr[4] = {512345.345, 345.2345, 345345.3425, 3456.1234};
    std::string strarr[5] = {"pen", "pineapple", "apple", "pen", "ppap"};

    std::cout.setf(std::ios::showpoint);

    std::cout.precision(10);

    std::cout << maxn(intarr, 6) << "\n";
    std::cout << maxn(doublearr, 4) << "\n";
    std::cout << maxn(strarr, 5) << "\n";

    return 0;
}

template <typename T> T maxn(T arr[], int n)
{
    T max = arr[0];

    for (int i = 1; i < n; ++i)
    {
        if (max < arr[i])
        {
            max = arr[i];
        }
    }

    return max;
}
template <> std::string maxn(std::string arr[], const int n)
{
    std::string max = arr[0];

    for (int i = 1; i < n; ++i)
    {
        if (max.length() < arr[i].length())
        {
            max = arr[i];
        }
    }

    return max;
}
