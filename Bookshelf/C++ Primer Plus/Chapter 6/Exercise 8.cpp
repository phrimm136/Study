#include <fstream>
#include <iostream>

int main(int argc, char *argv[])
{
    int count = 0;
    std::ifstream inFile;

    inFile.open("test.txt");

    while (inFile.get() != EOF)
        ++count;

    std::cout << count << "\n";

    inFile.close();

    return 0;
}
