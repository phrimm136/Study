#include <iostream>

int Fill_array(double[], const int);
void Show_array(double[], const int);
void Reverse_array(double[], const int);

int main(int argc, char *argv[])
{
    const int N = 10;
    double arr[N] = {};
    int length = 0;

    length = Fill_array(arr, N);
    Show_array(arr, length);
    Reverse_array(arr, length);
    Show_array(arr, length);

    return 0;
}

int Fill_array(double arr[], const int N)
{
    double value;
    int i;

    std::cout << "Enter " << N << " values to insert to array:\n";
    for (i = 0; i < N; ++i)
    {
        if ((std::cin >> value).fail() == true)
        {
            break;
        }
        arr[i] = value;
    }

    return i;
}

void Show_array(double arr[], const int N)
{
    for (int i = 0; i < N; ++i)
    {
        std::cout << arr[i] << " ";
    }
    std::cout << "\n";
}

void Reverse_array(double arr[], const int N)
{
    double temp;

    for (int i = 0; i < N / 2; ++i)
    {
        temp = arr[i];
        arr[i] = arr[N - i - 1];
        arr[N - i - 1] = temp;
    }
}
