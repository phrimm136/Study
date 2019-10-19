#include <iostream>

int main(int argc, char *argv[]) {
    std::string str = "";
    int N = -1, i = 0;

    std::cout << "Enter words (to stop, type the word done):"
              << "\n";
    while (str != "done") {
        std::cin >> str;
        ++N;
    }

    std::cout << "You entered a total of " << N << " words." << std::endl;

    return 0;
}
