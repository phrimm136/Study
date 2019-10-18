#include <iostream>

struct contrib
{
    std::string name;
    double money;
};

int main(int argc, char *argv[])
{
    int N, members = 0;
    struct contrib *contrib;

    std::cout << "Enter the number of monetary contributors: ";
    std::cin >> N;
    std::cin.get();
    contrib = new struct contrib[N];

    for (int i = 0; i < N; ++i)
    {
        std::cout << "Enter a name of a contributor: ";
        getline(std::cin, contrib[i].name);
        std::cout << "Enter monetary contributio of the contributor: ";
        std::cin >> contrib[i].money;
        std::cin.get();
    }

    std::cout << "Grand Patrons\n";
    for (int i = 0; i < N; ++i)
        if (contrib[i].money >= 10000.)
        {
            std::cout << "Name: " << contrib[i].name
                      << ", Contribution: " << contrib[i].money << "\n";
            ++members;
        }
    if (members == 0)
        std::cout << "none\n";

    members = 0;
    std::cout << "Patrons\n";
    for (int i = 0; i < N; ++i)
        if (contrib[i].money < 10000.)
        {
            std::cout << "Name: " << contrib[i].name
                      << ", Contribution: " << contrib[i].money << "\n";
            ++members;
        }
    if (members == 0)
        std::cout << "none\n";

    delete[] contrib;

    return 0;
}
