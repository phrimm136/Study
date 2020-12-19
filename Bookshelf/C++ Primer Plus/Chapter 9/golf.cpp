#include "golf.hpp"
#include <iostream>

void setgolf(golf &g, std::string name, int hc)
{
    g.fullname = name;
    g.handicap = hc;
}

int setgolf(golf &g)
{
    std::string name;
    int hc;

    std::cout << "Enter the full name: ";
    std::cin >> name;
    std::cout << "Enter a handicap: ";
    std::cin >> hc;

    g.fullname = name;
    g.handicap = hc;

    return name != "" ? 1 : 0;
}

void handicap(golf &g, int hc)
{
    g.handicap = hc;
}

void showgolf(const golf &g)
{
    std::cout << "fullname: " << g.fullname << "\n"
              << "handicap: " << g.handicap << "\n";
}
