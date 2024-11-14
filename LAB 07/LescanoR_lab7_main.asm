; file: lab7_main.asm
; Laboratory Exercise #7 for the Assembly course.
; This program computes the factorial of a number,
; with an additional implementation of multi-module program.

%include "asm_io.inc"

segment .data                       ; initialized data

    outmsg1     db "Enter a number to calculate its factorial: ", 0
    outmsg2     db "Factorial of ", 0
    outmsg3     db " is ", 0



segment .bss                        ; uninitialized data; variables are created here

    num1        resd 1
    result      resd 1



segment .text
    global  asm_main
    extern  factorial, get_int      ; declare as external, since these functions were defined in the factorial.asm file
asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program
    call    print_nl

    mov     eax, outmsg1            ; prints query
    call    print_string

    push    dword num1              ; push address of num1 variable onto the stack
    call    get_int                 ; get user input
    add     esp, 4                  ; adjust the stack pointer

    push    dword result            ; push address of result variable onto the stack
    call    factorial               ; compute factorial
    add     esp, 4                  ; adjust stack pointer
    
result_block:
    call    print_nl

    mov     eax, outmsg2
    call    print_string
    mov     eax, [num1]     
    call    print_int
    mov     eax, outmsg3    
    call    print_string

    mov     eax, [result]
    call    print_int

    call    print_nl
    call    print_nl

    popa                            ; removes general purpose registers off the stack to restore state
    mov     eax, 0                  ; return back to C
    leave                           ; leave the routine
    ret                             ; return