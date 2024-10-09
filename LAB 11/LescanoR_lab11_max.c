#include <stdio.h>

#include "cdecl.h"

#define STR_SIZE 30

// prototype
void PRE_CDECL asm_copy( void *, const void *, unsigned ) POST_CDECL;
unsigned PRE_CDECL asm_strlen( const char * ) POST_CDECL;


int main()
{
    char st1[STR_SIZE], st2[STR_SIZE], current_Char, max_Char;
    int i,j, len, current_Char_Freq = 0, max_Char_Freq = 0;

    printf("\nFIND THE MAXIMUM OCCURING CHARACTER IN A STRING");
    printf("\n================================================");

    printf("\nEnter a string: ");   /* look for byte in string */
    scanf("%[^\n]%*c", st1);
    asm_copy(st2, st1, STR_SIZE);   /* copy all 30 chars of string */
    len = asm_strlen (st2);
    
    for(i = 0; i < len; i++) {
        
        current_Char = st2[i];      /* current char and frequency are set */
        current_Char_Freq = 0;

        for (j = 0; j < len; j++) {
            
            if (st2[j] == current_Char){            /* if the current letter in the string matches the current character */
                current_Char_Freq += 1;
            }

        }
        
        if (current_Char_Freq > max_Char_Freq){     /* if the current character's freuquency is greater than the current maximum */
            max_Char = current_Char;
            max_Char_Freq = current_Char_Freq;
        }

    }
    
    printf("The character with the highest frequency is/are '%c' appear/s a number of %d times \n", max_Char, max_Char_Freq);
    return 0;
}