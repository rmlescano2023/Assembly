; file: lab0.asm
; Laboratory Exercise 0 for Assembly course.
; This program takes two integer values from the user and stores it to two created variables
; named 'jack' and 'jill'. The first operation prints out the values of the two variables.
; Then, the program swaps the values of the two variables, and then the program prints out
; the new values.

%include "asm_io.inc"



segment .data                       ; initialized data

prompt1 db      "Enter the value of 'jack': ", 0
prompt2 db      "Enter the value of 'jill': ", 0

title1  db      "=============== Before the fall ===============", 0
title2  db      "=============== After the fall ===============", 0

outmsg1 db      "The value of 'jack' is ", 0
outmsg2 db      "The value of 'jill' is ", 0





segment .bss                        ; uninitialized data; variables are created here

jack    resd 1                      ; reserve room for data inputs
jill    resd 1





segment .text                       ; main code starts here

    global asm_main                 ; global directive was used to give asm_main an external scope

asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program

;
; get values of Jack and Jill
;
    mov     eax, prompt1            ; print the first query
    call    print_string

    call    read_int                ; scans the first user input
    mov     [jack], eax             ; store the value to 'jack' variable

    mov     eax, prompt2            ; print the second query
    call    print_string

    call    read_int                ; scans the second user input
    mov     [jill], eax             ; store the value to 'jill' variable

    call    print_nl                ; print new line

;
; print out the "Before the Fall" part
;
    mov     eax, title1
    call    print_string

    call    print_nl

    mov     eax, outmsg1            ; prints the result message for 'jack'
    call    print_string
    mov     eax, [jack]             ; prints the value of 'jack'
    call    print_int

    call    print_nl

    mov     eax, outmsg2            ; prints the result message for 'jill'
    call    print_string
    mov     eax, [jill]             ; prints the value of 'jill'
    call    print_int

    call    print_nl

;
; swap the values of Jack and Jill
;
    mov     eax, [jack]             ; temporarily store values of 'jack' and 'jill' to registers
    mov     ebx, [jill]
    mov     [jack], ebx             ; store new values of 'jack' and 'jill'
    mov     [jill], eax

    call    print_nl

;
; print out the "After the fall" part
;
    mov     eax, title2
    call    print_string

    call    print_nl

    mov     eax, outmsg1            ; prints the result message for 'jack'
    call    print_string
    mov     eax, [jack]             ; prints the new value of 'jack'
    call    print_int

    call    print_nl

    mov     eax, outmsg2            ; prints the result message for 'jill'
    call    print_string
    mov     eax, [jill]             ; prints the value of 'jill'
    call    print_int

    call    print_nl

    call    print_nl

;
; end
;
    popa                            ; removes general purpose registers off the stack to restore state
    mov     eax, 0                  ; return back to C
    leave                           ; leave the routine
    ret                             ; return