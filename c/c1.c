#include <stdio.h>

int main()
{
    int num;
    long sum;

    sum = 0;
    for (num = 1; num * 3 < 1000; num++)
        sum += num * 3;
    for (num = 1; num * 5 < 1000; num++)
        if (num * 5 % 3 != 0)
            sum += num * 5;
    printf("The result is %li\n", sum);
}
