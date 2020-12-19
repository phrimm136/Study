#include <iostream>
#include <string>

void strcount(const std::string str);

int main(int argc, char *argv[])
{
    std::string input;
    char next;

    std::cout << "Enter a line:\n";
    getline(std::cin, input);
    while (input != "")
    {
        strcount(input);
        std::cout << "Enter next line (empty line to quit):\n";
        getline(std::cin, input);
    }
    std::cout << "Bye\n";

    return 0;
}

void strcount(const std::string str)
{
    static int total = 0;

    std::cout << "\"" << str << "\" contains ";
    total += str.length();
    std::cout << str.length() << " characters\n" << total << " characters total\n";
}
