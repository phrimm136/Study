#include <iostream>

struct box
{
    char maker[40];
    float height;
    float width;
    float length;
    float volume;
};

void display(box);
void set_volume(box *);

int main(int argc, char *argv[])
{
    box B;

    std::cout << "Enter the maker, height, width and length of a box: "
              << "\n";
    std::cin >> B.maker >> B.height >> B.width >> B.length;

    set_volume(&B);

    display(B);

    return 0;
}

void display(box B)
{
    std::cout << "Maker: " << B.maker << "\n"
              << "Height: " << B.height << "\n"
              << "Width: " << B.width << "\n"
              << "Length: " << B.length << "\n"
              << "Volume: " << B.volume << "\n";
}

void set_volume(box *B)
{
    B->volume = B->height * B->width * B->length;
}
