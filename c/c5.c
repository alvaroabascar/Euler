#include <stdio.h>

main()
{
    long int num, div;

    div = 0;
    for (num = 1; div < 21; num++) {
        for (div = 1; div <= 20; div++) {
            if (num % div != 0) {
                break;
            }
        }
        if (div == 21)
            break;
    }
    printf("The solution is: %li\n", num);
}

