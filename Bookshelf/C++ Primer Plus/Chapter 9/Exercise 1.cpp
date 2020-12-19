#include "golf.hpp"
#include <iostream>

int main(int argc, char *argv[])
{
    golf andy, ann;

    setgolf(ann, "Ann Bridfree", 24);
    setgolf(andy);

    showgolf(ann);
    handicap(ann, 15);

    showgolf(ann);
    showgolf(andy);

    return 0;
}
