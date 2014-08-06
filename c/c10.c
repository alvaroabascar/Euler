#include <stdio.h>

#define MAX 2000000

long int primesum(int max);

int main()
{
    printf("The solution is: %li\n", primesum(MAX));
}

/* primesum: returns the sum of all primes below max */
long int primesum(int max)
{
    static long primes[MAX], num, sum;
    int i, isprime, primenum;

    for (i = 0; i < MAX; primes[i++] = 0); 
    /* find all primes below max */
    for (primenum = 0, num = 2; num < MAX; num++) {
        isprime = 1;
        for (i = 0; primes[i] != 0; i++)
            if (num % primes[i] == 0) {
                isprime = 0;
                break;
            }
        if (isprime) {
            primes[primenum++] = num;
        }
    }
    
    /* find the sum */
    sum = 0;
    for (i = 0; primes[i] != 0; i++) {
        sum += primes[i];
    }
    return sum;
}

