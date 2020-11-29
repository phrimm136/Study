#include <iostream>
#include <string>

struct stringy
{
    std::string str;
    int ct;
};

void set(stringy &, const std::string);
void show(const stringy &);
void show(const stringy &, const int);
void show(const std::string &);
void show(const std::string &, const int);

int main(int argc, char *argv[])
{
    stringy beany;
    std::string testing = "Reality isn't what it used to be.";

    set(beany, testing);
    show(beany);
    show(beany, 2);
    testing.at(0) = 'D';
    testing.at(1) = 'u';
    show(testing);
    show(testing, 3);
    show("Done!");

    return 0;
}

void set(stringy &stry, const std::string str)
{
    stry.str = str;
    stry.ct = str.length();
}
void show(const stringy &stry)
{
    std::cout << stry.str << "\n";
}
void show(const stringy &stry, const int n)
{
    for (int i = 0; i < n; ++i)
    {
        std::cout << stry.str << "\n";
    }
}
void show(const std::string &str)
{
    std::cout << str << "\n";
}
void show(const std::string &str, const int n)
{
    for (int i = 0; i < n; ++i)
    {
        std::cout << str << "\n";
    }
}
