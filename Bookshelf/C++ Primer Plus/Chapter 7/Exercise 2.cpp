#include <iostream>

int input(int[]);
void print(int[], int);
double calc_mean(int[], int);

int main(int argc, char *argv[])
{
    int scores[10] = {}, count;

    count = input(scores);
    print(scores, count);

    return 0;
}

int input(int scores[])
{
    int score = 0, count = 0;

    std::cout << "Insert up to ten golf scores (zero to terminate input): \n";

    for (; count < 10; ++count)
    {
        std::cin >> score;
        if (score == 0)
            break;
        scores[count] = score;
    }

    return count;
}

void print(int scores[], int count)
{
    for (int i = 0; i < count; ++i)
    {
        std::cout << scores[i] << " ";
    }
    std::cout << "\n"
              << "average: " << calc_mean(scores, count) << "\n";
}

double calc_mean(int scores[], int count)
{
    int sum = 0;

    for (int i = 0; i < count; ++i)
        sum += scores[i];

    return double(sum) / count;
}
