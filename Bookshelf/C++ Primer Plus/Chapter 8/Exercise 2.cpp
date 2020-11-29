#include <iostream>
#include <string>

struct CandyBar
{
    std::string brandname;
    double weight;
    int calories;
};

void set(CandyBar &, std::string brandname = "Millennium Munch", double weight = 2.85, int calories = 350);
void print(const CandyBar &);

int main(int argc, char *argv[])
{
    CandyBar bar1, bar2;
    std::string brandname;
    double weight;
    int calories;

    std::cout << "Insert a name, weight, and calories for a candy bar: ";
    std::cin >> brandname >> weight >> calories;

    set(bar1);
    set(bar2, brandname, weight, calories);
    print(bar1);
    print(bar2);

    return 0;
}

void set(CandyBar &bar, std::string brandname, double weight, int calories)
{
    bar.brandname = brandname;
    bar.weight = weight;
    bar.calories = calories;
}

void print(const CandyBar &bar)
{
    std::cout << bar.brandname << "\n" << bar.weight << "\n" << bar.calories << "\n\n";
}
