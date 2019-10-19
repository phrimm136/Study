#include <iostream>

int main(int argc, char *argv[]) {
    std::string month[12] = {"January",   "February", "March",    "April",
                             "May",       "June",     "July",     "August",
                             "September", "October",  "November", "December"};
    int sale[3][12] = {0}, total[3] = {0};

    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 12; ++j) {
            std::cout << "Enter sales of " << month[j] << " of year " << i + 1
                      << ": ";
            std::cin >> sale[i][j];
        }
        std::cout.put('\n');
    }
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 12; ++j)
            total[i] += sale[i][j];
    }

    for (int i = 0; i < 3; ++i)
        std::cout << "The total sales for the year " << i + 1 << " are "
                  << total[i] << "." << std::endl;
    std::cout << "The total sales for three years are "
              << total[0] + total[1] + total[2] << "." << std::endl;

    return 0;
}
