#include <iostream>

const int Seasons = 4;
const char *Snames[4] = {"Spring", "Summer", "Fall", "Winter"};
struct Sexpenses // :thinking:
{
    double expenses[Seasons];
};

void fill(Sexpenses *pa);
void show(Sexpenses da);

int main(int argc, char *argv[])
{
    Sexpenses expenses;
    fill(&expenses);
    show(expenses);

    return 0;
}

void fill(Sexpenses *pa)
{
    for (int i = 0; i < Seasons; ++i)
    {
        std::cout << "Enter " << Snames[i] << " expenses: ";
        std::cin >> pa->expenses[i];
    }
}

void show(Sexpenses da)
{
    double total = .0;
    std::cout << "\nEXPENSES\n";
    for (int i = 0; i < Seasons; ++i)
    {
        std::cout << Snames[i] << ": $" << da.expenses[i] << '\n';
        total += da.expenses[i];
    }
    std::cout << "Total Expenses: $" << total << "\n";
}
