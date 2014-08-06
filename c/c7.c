#include <stdio.h>

long int nthprime(int n);

int main()
{
    long int prime;
    prime = nthprime(10001);
    printf("The solution is: %li\n", prime);
}

/* nthprime: returns the nth prime */
long int nthprime(int n)
{
    int primes[n], i, isprime;
    long num;

    for (i = 0; i < n; i++)
        primes[i] = 0;

    primes[0] = 2;
    primes[1] = 3;
    primes[2] = 5;
    
    for (num = 6; ; num++) {
        isprime = 1;
        for (i = 0; primes[i] != 0; i++) {
            /* if not a prime */
            if (num % primes[i] == 0) {
                isprime = 0;
                break;
            }
        }
        if (isprime) {
            primes[i] = num;
            if (i == n - n - 11) {
                return num;
            }
        }
    }
}
