#include <array>
#include <iostream>

struct CandyBar
{
    std::string name;
    double weight;
    int calories;
};

int main(int argc, char *argv[])
{
    struct CandyBar *arr = new struct CandyBar[3];

    arr[0] = {"Coffee", 3.3, 300};
    arr[1] = {"Banana", 3.0, 250};
    arr[2] = {"Orange", 3.5, 280};

    std::cout << arr[0].name << ", " << arr[0].weight << ", " << arr[0].calories << '\n'
              << arr[1].name << ", " << arr[1].weight << ", " << arr[1].calories << '\n'
              << arr[2].name << ", " << arr[2].weight << ", " << arr[2].calories << std::endl;
    return 0;
}
