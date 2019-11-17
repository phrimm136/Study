#include <iostream>

struct car
{
    std::string make;
    int year;
};

int main(int argc, char *argv[])
{
    struct car *catalog = NULL;
    int N;

    std::cout << "How many cars do you wish to catalog? ";
    std::cin >> N;
    std::cin.get();
    catalog = new struct car[N];

    for (int i = 0; i < N; ++i)
    {
        std::cout << "Car #" << i + 1 << "\n";
        std::cout << "Please enter the make: ";
        getline(std::cin, catalog[i].make);
        std::cout << "Please enter the year made: ";
        std::cin >> catalog[i].year;
        std::cin.get();
    }

    std::cout << "Here is your collection:"
              << "\n";
    for (int i = 0; i < N; ++i)
        std::cout << catalog[i].year << " " << catalog[i].make << "\n";

    return 0;
}
