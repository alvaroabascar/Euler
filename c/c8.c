#include <stdio.h>

int main()
{
    char number[1000], c;
    FILE *fp = fopen("c8.input", "r");
    int i, k, prod, grt;
   
    if (fp == NULL) {
        fprintf(stderr, "Couldn't open c8.input\n");
        return 1;
    }
    
    while ((c = fgetc(fp)) != EOF)
        if (c >= '0' && c <= '9') {
            number[i] = c - '0';
            i++;
        }

    grt = 0;
    for (i = 0; i < 1000; i++) {
        prod = 1;
        for (k = 0; k < 5; k++)
            prod *= number[i+k];
        if (prod > grt)
            grt = prod;
    }
    printf("The solution is: %i\n", grt);
}
