/* itos: turns num into a string and stores it in str */
char *itos(int num, char *str)
{
    char tmp[100], *tmp_ptr;
    char *str_ptr;
    int len; /* size of str */

    tmp_ptr = &tmp[0];
    str_ptr = &str[0];

    /* builds string, but in reverse */
    while (num > 0) {
        *tmp_ptr++ = '0' + num % 10;
        num /= 10;
        len++;
    }

    /* reverse string */
    while (len-- > 0)
        *str_ptr++ = *--tmp_ptr;
    *str_ptr = '\0';
    return str;
}

