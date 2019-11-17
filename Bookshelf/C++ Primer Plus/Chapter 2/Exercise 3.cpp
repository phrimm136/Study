#include <iostream>

void Tbm();
void Shtr();

int main()
{
    Tbm();
    Tbm();
    Shtr();
    Shtr();

    return 0;
}

void Tbm()
{
    std::cout << "Three blind mice" << std::endl;
}

void Shtr()
{
    std::cout << "See how they run" << std::endl;
}
