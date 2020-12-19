#include "sales.hpp"

int main(int argc, char *argv[])
{
    SALES::Sales s1, s2;
    double arr[] = {1., 2., 3.};

    SALES::setSales(s1, arr, 3);
    SALES::setSales(s2);

    SALES::showSales(s1);
    SALES::showSales(s2);

    return 0;
}
