#include <stdio.h>
#include <math.h>

int main()
{
    long int num, div, fctr;
    num = 600851475143;

    for (div = sqrt(num); div > 0; div--) {
        if (num % div == 0) /* div is a factor of num */
            if (isprime(div)) {
                printf("Result is %li\n", div);
                return;
            }
    }
}

int isprime(long int num)
{
    int i;

    for (i = 2; i <= sqrt(num); i++)
        if (num % i == 0)
            return 0;
    return 1;
}
