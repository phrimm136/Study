#include <iostream>
#include <string>

void print(std::string);
void print(std::string, int);

int main(int argc, char *argv[])
{
    std::string str;
    int n;

    std::cin >> str >> n;

    print(str, n);

    return 0;
}

void print(std::string str)
{
    std::cout << str << "\n";
}
void print(std::string str, int n)
{
    for (int i = 0; i <= n; ++i)
    {
        print(str);
    }
}
