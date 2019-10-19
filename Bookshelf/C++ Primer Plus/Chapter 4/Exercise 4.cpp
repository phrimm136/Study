#include <iostream>

int main(int argc, char *argv[]) {
    std::string f_name = "", l_name = "", name = "";

    std::cout << "Enter your first name: ";
    std::cin >> f_name;
    std::cout << "Enter your last name: ";
    std::cin >> l_name;

    name = l_name + ", " + f_name;

    std::cout << "Here's the information in a single string: " << name
              << std::endl;

    return 0;
}
