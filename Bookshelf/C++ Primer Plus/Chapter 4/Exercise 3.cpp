#include <iostream>
#include <cstring>

int main(int argc, char *argv[])
{
    char f_name[100] = "", l_name[100] = "", name[203] = "";

    std::cout << "Enter your first name: ";
    std::cin >> f_name;
    std::cout << "Enter your last name: ";
    std::cin >> l_name;

    strcpy(name, l_name);
    strcat(name, ", ");
    strcat(name, f_name);

    std::cout << "Here's the information in a single string: " << name << std::endl;

    return 0;
}
