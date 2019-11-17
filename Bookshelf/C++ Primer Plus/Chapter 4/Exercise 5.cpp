#include <iostream>

struct CandyBar
{
    std::string name;
    double weight;
    int calories;
};

int main(int argc, char *argv[])
{
    struct CandyBar snack = {"Munch", 2.3, 350};

    std::cout << "Name: " << snack.name << '\n'
              << "Weight: " << snack.weight << '\n'
              << "calories: " << snack.calories << std::endl;

    return 0;
}
