#include <iostream>

struct pizza
{
    std::string company;
    double diameter;
    double weight;
};

int main(int argc, char *argv[])
{
    struct pizza *pizza = new struct pizza;

    std::cout << "Enter diameter of the pizza: ";
    std::cin >> pizza->diameter;
    std::cin.get();
    std::cout << "Enter a name of pizza company: ";
    getline(std::cin, pizza->company);
    std::cout << "Enter weight of the pizza: ";
    std::cin >> pizza->weight;

    std::cout << "Company name: " << pizza->company << '\n'
              << "Diameter: " << pizza->diameter << '\n'
              << "Weight: " << pizza->weight << std::endl;

    return 0;
}
