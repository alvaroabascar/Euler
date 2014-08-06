#include <stdio.h>
#include <math.h>

main()
{
    int a, b, c;

    for (a = 1; a < 1000; a++) {
        for (b = 1; b < 1000; b++) {
            c = 1000 - a - b;
            if (pow(a,2) + pow(b,2) == pow(c,2)) {
                printf("The solution is %i * %i * %i = %i\n", a, b, c, a*b*c);
                return 1;
            }
        }

    }
}
