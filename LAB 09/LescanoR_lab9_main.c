#include <stdio.h>

#include "cdecl.h"

void PRE_CDECL fibonacci(int) POST_CDECL; /* prototype for assembly routine */

int main(void){
    int n;
    printf("\nEnter a number: ");
    scanf("%d", &n);
    
    fibonacci(n);
    return 0;
}