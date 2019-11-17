#include <iostream>

#define strsize 100

struct bop
{
    char fullname[strsize]; // real name
    char title[strsize];    // job title
    char bopname[strsize];  // secet BOP name
    int preference;         // 0 = fullname, 1 = title, 2 = bopname
};

int main(int argc, char *argv[])
{
    struct bop bop[5] = {{"Wimp Macho", "Undergraduate Student", "WISP", 0},
                         {"Raki Rhodes", "Junior Programmer", "RHINO", 1},
                         {"Celia Laiter", "Archietecture Designer", "MIPS", 2},
                         {"Hoppy Hipman", "Anaylyst Trainee", "PENNY", 1},
                         {"Pat Hand", "Chairman", "LOOPY", 2}};
    char ch;

    std::cout << "Benevolent Order of Programmers Report\n"
              << "a. display by name\tb. display by title\n"
              << "c. display by bopname\td.display by preference\n"
              << "q. quit\n";
    std::cout << "Enter your choice: ";
    while (true)
    {
        std::cin >> ch;

        switch (ch)
        {
        case 'a':
            for (int i = 0; i < 5; ++i)
                std::cout << bop[i].fullname << " \n";
            break;
        case 'b':
            for (int i = 0; i < 5; ++i)
                std::cout << bop[i].title << " \n";
            break;
        case 'c':
            for (int i = 0; i < 5; ++i)
                std::cout << bop[i].bopname << " \n";
            break;
        case 'd':
            for (int i = 0; i < 5; ++i)
                switch (bop[i].preference)
                {
                case 0:
                    std::cout << bop[i].fullname << " \n";
                    break;
                case 1:
                    std::cout << bop[i].title << " \n";
                    break;
                case 2:
                    std::cout << bop[i].bopname << " \n";
                    break;
                }
            break;
        case 'q':
            std::cout << "Bye!\n";
            return 0;
        }
        std::cout << "Next choice: ";
    }
}
