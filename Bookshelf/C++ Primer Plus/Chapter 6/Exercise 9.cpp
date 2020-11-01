#include <fstream>
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
    std::ifstream inFile;

    inFile.open("test.txt");

    inFile >> N;
    inFile.get();
    contrib = new struct contrib[N];

    for (int i = 0; i < N; ++i)
    {
        getline(inFile, contrib[i].name);
        inFile >> contrib[i].money;
        inFile.get();
    }

    std::cout << "Grand Patrons\n";
    for (int i = 0; i < N; ++i)
        if (contrib[i].money >= 10000.)
        {
            std::cout << "Name: " << contrib[i].name << ", Contribution: " << contrib[i].money << "\n";
            ++members;
        }
    if (members == 0)
        std::cout << "none\n";

    members = 0;
    std::cout << "Patrons\n";
    for (int i = 0; i < N; ++i)
        if (contrib[i].money < 10000.)
        {
            std::cout << "Name: " << contrib[i].name << ", Contribution: " << contrib[i].money << "\n";
            ++members;
        }
    if (members == 0)
        std::cout << "none\n";

    inFile.close();

    delete[] contrib;

    return 0;
}
