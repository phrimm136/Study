#include <iostream>

int main(int argc, char *argv[]) {
    int year = 0, D_orig = 100, C_orig = 100, D_curr = 100, C_curr = 100;
    double simple_int = .1, comp_int = .05;

    for (; D_curr >= C_curr; ++year) {
        D_curr += simple_int * D_orig;
        C_curr += comp_int * C_curr;
        std::cout << "Daphne: " << D_curr << ", Cleo: " << C_curr << "\n";
    }
    std::cout << year << " years are taken." << std::endl;

    return 0;
}
