#include <stdio.h>

int main()
{
    int i;
    for (i = 0; i < 10; i++)
        printf("%i\n", next());
}

int next()
{
    static int i = 0;
    return i++;
}
