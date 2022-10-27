#include "print.h"
#include "sbi.h"

void puts(char *s) {
    // unimplemented
    for(int i = 0; s[i] != '\0'; i++) {
        sbi_ecall(0x1, 0x0, (uint64)s[i], 0, 0, 0, 0, 0);
    }
}

void puti(int x) {
    // unimplemented
    char num_to_s[12] = {'\0'};
    toString(num_to_s, x);
    puts(num_to_s);
}

void toString(char str[], int num)
{
    char tmp[12];
    int len = 0;
    short isNegtive = 0;
    if(num < 0)
        num = -num, isNegtive = 1;
    
    do {
        tmp[len++] = num % 10 + '0';
        num /= 10;
    } while (num);
    if(isNegtive)
        tmp[len++] = '-';

    for(int i = 0; i < len; i++)
        str[i] = tmp[len - i - 1];
}