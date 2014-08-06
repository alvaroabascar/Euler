#include <stdio.h>


int main()
{
    int divs, triang;

    for (triang=0, divs=0; divs < MAX; triang=nextTriang());

    printf("%i\n", triang);
}

int nextTriang() {
    static int lastnum, num;
    int triang;
    lastnum = 0;
    num = 1;

    

/* numdivs(int num): returns the number of divisors of num */
int numdivs(int num) {
    int i;
    int divs;
    for (i = 0; i <= num; i++)
        if (num % i == 0)
            divs++;
    return divs;
}


