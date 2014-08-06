#include <stdio.h>


int ispalindrome(int num);

int main()
{
    int i, k, curr, largest;
    int arr[1000];

    /* build array from 100 to 999 (three digit numbers) */
    for (i = 0; i < 900; i++)
        arr[i] = 100 + i;

    largest = 0; /* largest palindrome found so far */
    while (i >= 0) {
        for (k = i; k >= 0; k--) {
            curr = arr[i] * arr[k];
            if (ispalindrome(curr) && curr > largest) {
                largest = curr;
                printf("%i * %i = %i\n", arr[i], arr[k], curr);
            }
        }
        i--;
    }
    printf("The solution is: %i\n", largest);
}


/* ispalindrome: returns 1 if num is a palindrome, 0 if not */
int ispalindrome(int num)
{
    char rev[100], *rev_ptr;
    char str[100], *str_ptr;
    int len; /* size of str */

    rev_ptr = &rev[0];
    str_ptr = &str[0];

    /* builds string, but in reverse */
    len = 0;
    while (num > 0) {
        *rev_ptr++ = '0' + num % 10;
        num /= 10;
        len++;
    }
    *rev_ptr = '\0';

    /* now reverse string */
    while (len-- >= 0)
        *str_ptr++ = *--rev_ptr;
    *str_ptr = '\0';
    return (strcmp(str, rev) == 0) ? 1 : 0;
}

