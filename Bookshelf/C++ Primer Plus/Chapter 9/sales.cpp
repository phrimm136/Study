#include "sales.hpp"
#include <iostream>

void SALES::setSales(Sales &s, const double ar[], int n)
{
    for (int i = 0; i < n && i < SALES::QUARTERS; ++i)
        s.sales[i] = ar[i];
    s.average = (s.sales[0] + s.sales[1] + s.sales[2] + s.sales[3]) / (n > SALES::QUARTERS ? SALES::QUARTERS : n);
    s.min = s.max = s.sales[0];
    for (int i = 1; i < n && i < SALES::QUARTERS; ++i)
        if (s.min > s.sales[i])
            s.min = s.sales[i];
    for (int i = 1; i < n && i < SALES::QUARTERS; ++i)
        if (s.max < s.sales[i])
            s.max = s.sales[i];
}

void SALES::setSales(Sales &s)
{
    std::cout << "Enter four sales value: ";
    for (int i = 0; i < SALES::QUARTERS; ++i)
        std::cin >> s.sales[i];

    s.average = (s.sales[0] + s.sales[1] + s.sales[2] + s.sales[3]) / SALES::QUARTERS;
    s.min = s.max = s.sales[0];
    for (int i = 1; i < SALES::QUARTERS; ++i)
        if (s.min > s.sales[i])
            s.min = s.sales[i];
    for (int i = 1; i < SALES::QUARTERS; ++i)
        if (s.max < s.sales[i])
            s.max = s.sales[i];
}

void SALES::showSales(const Sales &s)
{
    std::cout << "Sales value: ";
    for (int i = 0; i < SALES::QUARTERS; ++i)
        std::cout << s.sales[i] << ' ';
    std::cout << '\n';
    std::cout << "Average: " << s.average << '\n';
    std::cout << "Min: " << s.min << '\n';
    std::cout << "Max: " << s.max << '\n';
}
