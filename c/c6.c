#include <stdio.h>

main()
{
    long int sumsqr, sqrsum, arr[100];
    int i;

    sumsqr = sqrsum = 0;

    for (i = 1; i < 101; i++) {
        sumsqr += i*i;
        sqrsum += i;
    }

    sqrsum *= sqrsum;
    printf("The solution is: %li\n", sqrsum - sumsqr);
}


    
