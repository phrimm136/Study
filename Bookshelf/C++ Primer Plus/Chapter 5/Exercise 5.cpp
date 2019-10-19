#include <iostream>

int main(int argc, char *argv[]) {
    std::string month[12] = {"January",   "February", "March",    "April",
                             "May",       "June",     "July",     "August",
                             "September", "October",  "November", "December"};
    int sale[12] = {0}, total = 0;

    for (int i = 0; i < 12; ++i) {
        std::cout << "Enter sales of " << month[i] << ": ";
        std::cin >> sale[i];
    }
    for (int i = 0; i < 12; ++i)
        total += sale[i];

    std::cout << "The total sales for the year are " << total << "."
              << std::endl;

    return 0;
}
