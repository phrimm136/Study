#include <cctype>
#include <iostream>
#include <string>

void exclaim(const std::string);

int main(int argc, char *argv[])
{
    std::string str;

    for (;;)
    {
        std::cout << "Enter a string (q to quit): ";
        getline(std::cin, str);
        if (str == "q")
        {
            std::cout << "Bye.\n";
            return 0;
        }
        exclaim(str);
    }
}

void exclaim(const std::string str)
{
    int len = str.length();

    for (int i = 0; i < len; ++i)
    {
        std::cout << char(toupper(str.at(i)));
    }
    std::cout << "\n";
}
