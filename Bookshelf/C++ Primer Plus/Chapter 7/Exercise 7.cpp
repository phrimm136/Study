#include <iostream>

const int Max = 5;

double *fill_array(double *begin, int limit);
void show_array(double *begin, double *end);
void revalue(double r, double *begin, double *end);

int main(int argc, char *argv[])
{
    double properties[Max];

    double *end = fill_array(properties, Max);
    show_array(properties, end);

    if (end > properties)
    {
        std::cout << "Enter revaluation factor: ";
        double factor;
        while (!(std::cin >> factor))
        {
            std::cin.clear();
            while (std::cin.get() != '\n')
                continue;
            std::cout << "Bad input; Please enter a number: ";
        }
        revalue(factor, properties, end);
        show_array(properties, end);
    }
    std::cout << "Done.\n";
    std::cin.get();
    std::cin.get();

    return 0;
}

double *fill_array(double *begin, int limit)
{
    double temp;
    int i;

    for (i = 0; i < limit; ++i)
    {
        std::cout << "Enter value #" << (i + 1) << ": ";
        std::cin >> temp;
        if (!std::cin)
        {
            std::cin.clear();
            while (std::cin.get() != '\n')
                continue;
            std::cout << "Bad input; input process terminated.\n";
            break;
        }
        else if (temp < 0)
            break;
        *(begin + i) = temp;
    }
    return begin + i;
}

void show_array(double *begin, double *end)
{
    int i;
    double *index;
    for (i = 1, index = begin; index < end; ++index)
    {
        std::cout << "Property #" << i << ": $" << *index << '\n';
    }
}

void revalue(double r, double *begin, double *end)
{
    for (double *index = begin; index < end; ++index)
        *index *= r;
}
