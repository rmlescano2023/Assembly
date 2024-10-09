; file: lab2.asm
; Laboratory Exercise 2 for the Assembly course.
; This program checks whether a user input is a
; leap year or not.

; Works like the following C code:
; #include <stdio.h>
;
; int main() {
;
;     int years[20] = {1600, 1700, 1800, 1904, 1906, 1908, 1950, 1963, 1977,1984, 1999, 2000, 2003, 2004, 2008, 2012, 2013, 2018, 2019, 2020};
;     int inputYear;
;
;     for (int i = 0; i < 20; i++) {
;
;         inputYear = years[i];
;
;         if (inputYear % 400 == 0) {
;           printf("\nThe year %d is a leap year.", inputYear);
;         }
;         else if (inputYear % 400 != 0 && inputYear % 100 == 0) {
;
;             printf("\nThe year %d is NOT a leap year.", inputYear);
;            
;         }
;         else if (inputYear % 100 != 0 && inputYear % 4 == 0) {
;
;             printf("\nThe year %d is a leap year.", inputYear);
;            
;         }
;         else {
;             printf("\nThe year %d is NOT a leap year.", inputYear);
;         }
;
;     }
;
;     return 0;
; }

%include "asm_io.inc"

segment .data                       ; initialized data

    query       db "Enter a year: ", 0

    outmsg1     db "The year '", 0

    leapYear    db "' is a leap year.", 0
    notLeap     db "' is NOT a leap year.", 0 





segment .bss                        ; uninitialized data; variables are created here

    year        resd 1





segment .text

    global asm_main                 ; global directive was used to give asm_main an external scope

asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program

    call    print_nl
;
; start
;
    mov     eax, query
    call    print_string

    call    read_int                ; scans the input year, value is in EAX
    mov     [year], eax             ; stores user input to "year" variable

    mov     eax, outmsg1            
    call    print_string            ; prints first part of output message
    mov     eax, [year]
    call    print_int

    mov     edx, 0                  ; store 0 to upper bits of EDX:EAX
    mov     ecx, 400                ; store the operand 400 to ECX for division
    div     ecx                     ; EDX:EAX / ECX ; EDX stores the remainder, while EAX stores the quotient

    cmp     edx, 0                  ; if remainder - 0 = 0
    je      leap_block              ; if (inputYear % 400 == 0)
    jmp     else_if_block1    

leap_block:                         ; output block for leap years
    mov     eax, leapYear
    call    print_string

    jmp     next

not_leap_block:                     ; output block for non-leap years
    mov     eax, notLeap
    call    print_string

    jmp     next

else_if_block1:                     ; else if (inputYear % 400 != 0 && inputYear % 100 == 0)
    mov     edx, 0                  ; store 0 to upper bits of EDX:EAX
    mov     eax, [year]             
    mov     ecx, 100                ; store the operand 100 to ECX for division
    div     ecx                     ; divide year by 100

    cmp     edx, 0
    je      not_leap_block
    jne     else_if_block2

else_if_block2:                     ; else if (inputYear % 100 != 0 && inputYear % 4 == 0)
    mov     edx, 0
    mov     eax, [year]
    mov     ecx, 4                  ; store the operand 4 to ECX for division
    div     ecx                     ; divide year by 4

    cmp     edx, 0
    je      leap_block
    jne     not_leap_block

next:

;
; end
;
    call    print_nl
    call    print_nl
    
    popa                            ; removes general purpose registers off the stack to restore state
    mov     eax, 0                  ; return back to C
    leave                           ; leave the routine
    ret                             ; return