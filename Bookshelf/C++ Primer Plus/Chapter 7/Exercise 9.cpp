#include <iostream>
#include <string>

const int SLEN = 30;
struct student
{
    std::string fullname;
    std::string hobby;
    int ooplevel;
};

int getinfo(student pa[], int n);
void display1(student st);
void display2(const student *ps);
void display3(const student pa[], int n);

int main(int argc, char *argv[])
{
    std::cout << "Enter class size: ";
    int class_size;
    std::cin >> class_size;
    while (std::cin.get() != '\n')
        ;

    student *ptr_stu = new student[class_size];
    int entered = getinfo(ptr_stu, class_size);
    for (int i = 0; i < entered; ++i)
    {
        display1(ptr_stu[i]);
        display2(&ptr_stu[i]);
    }
    display3(ptr_stu, entered);
    delete[] ptr_stu;
    std::cout << "Done\n";

    return 0;
}

int getinfo(student pa[], int n)
{
    std::string fullname, hobby;
    int ooplevel;

    for (int input_num = 0; input_num < n; ++input_num)
    {
        std::cout << "Enter a full name of student" << input_num + 1 << ": ";
        getline(std::cin, fullname);
        if (fullname == "")
            return input_num;
        std::cout << "Enter a hobby of student" << input_num + 1 << ": ";
        getline(std::cin, hobby);
        std::cout << "Enter a ooplevel of student" << input_num + 1 << ": ";
        std::cin >> ooplevel;

        pa[input_num] = {fullname, hobby, ooplevel};
    }

    return n;
}

void display1(student st)
{
    std::cout << st.fullname << " " << st.hobby << " " << st.ooplevel << "\n\n";
}

void display2(const student *st)
{
    std::cout << st->fullname << " " << st->hobby << " " << st->ooplevel << "\n\n";
}

void display3(const student pa[], int n)
{
    for (int i = 0; i < n; ++i)
    {
        std::cout << pa[i].fullname << " " << pa[i].hobby << " " << pa[i].ooplevel << "\n";
    }
    std::cout << "\n";
}
