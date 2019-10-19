#include <iostream>

int main(int argc, char *argv[]) {
    std::string f_name, l_name;
    char grade;
    int age;

    std::cout << "What is your first name? ";
    std::getline(std::cin, f_name);
    std::cout << "What is your last name? ";
    std::cin >> l_name;
    std::cout << "What letter grade do you deserve? ";
    std::cin >> grade;
    std::cout << "What is your age? ";
    std::cin >> age;

    std::cout << "Name: " << l_name << ", " << f_name << "\n";
    std::cout << "Grade: " << char(grade + 1) << '\n';
    std::cout << "Age: " << age << std::endl;

    return 0;
}
