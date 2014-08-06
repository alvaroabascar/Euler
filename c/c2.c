#include <stdio.h>

int main()
{
    long int a, b, c, max, sum;
    max = 4000000;
    a = 0;
    b = 1;
    sum = 0;
    while ((c = a + b) < max) {
        a = b;
        b = c;
        sum += (c % 2 == 0) ? c : 0;
    }
    printf("The result is %li\n", sum);
}

