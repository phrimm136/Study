#include <iostream>

template <typename T> T SumArray(T arr[], int n);
template <typename T> T SumArray(T *arr[], int n);

struct debts
{
    char name[50];
    double amount;
};

int main(int argc, char *argv[])
{
    int things[6] = {13, 31, 103, 301, 310, 130};
    debts mr_E[3] = {{"Ima Wolfe", 2400.0}, {"Ura Foxe", 1300.0}, {"Iby Stout", 1800.0}};
    double *pd[3];

    for (int i = 0; i < 3; ++i)
        pd[i] = &mr_E[i].amount;

    std::cout << "Number of Mr. E's counts of things: " << sizeof things / sizeof things[0] << "\n";

    std::cout << "Sum of Mr. E's counts of things: " << SumArray(things, 6) << "\n";
    std::cout << "Number of Mr.E's debts: " << sizeof pd / sizeof pd[0] << "\n";
    std::cout << "Sum of Mr.E's debts: " << SumArray(pd, 3) << "\n";

    return 0;
}

template <typename T> T SumArray(T arr[], int n)
{
    T sum = 0;

    for (int i = 0; i < n; ++i)
        sum += arr[i];

    return sum;
}

template <typename T> T SumArray(T *arr[], int n)
{
    T sum = 0;

    for (int i = 0; i < n; ++i)
        sum += *arr[i];

    return sum;
}
