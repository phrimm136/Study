#include <iostream>
#include <string>

struct chaff
{
    std::string dross;
    int slag;
};

int main(int argc, char *argv[])
{
    chaff *c, *cp;
    char buffer[100];

    c = new chaff;
    cp = new (buffer) chaff[2];

    c->dross = "Metal";
    c->slag = 4;
    for (int i = 0; i < 2; ++i)
    {
        cp[i].dross = "Aluminum";
        cp[i].slag = i + 5;
    }

    std::cout << 0 << " chaff - dross: " << c->dross << " slug: " << c->slag << "\n";
    for (int i = 0; i < 2; ++i)
    {
        std::cout << i << " chaff - dross: " << cp[i].dross << " slug: " << cp[i].slag << "\n";
    }

    return 0;
}
