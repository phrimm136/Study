#include <iostream>

int main(int argc, char *argv[]) {
    char ch;

    std::cout << "Please enter one of the following choices:\n"
              << "c) carnivore\t\tp) pianist\n"
              << "t) tree\t\t\tg) game\n";
    std::cin >> ch;

    while (ch != 'c' && ch != 'p' && ch != 't' && ch != 'g') {
        std::cout << "Please enter a c, p, t, or g: ";
        std::cin >> ch;
    }

    switch (ch) {
    case 'c':
        std::cout << "A lion is a carnivore.\n";
        break;
    case 'p':
        std::cout << "Bach is a pianist.\n";
        break;
    case 't':
        std::cout << "A maple is a tree.\n";
        break;
    case 'g':
        std::cout << "Starcraft is a game.\n";
        break;
    }

    return 0;
}
