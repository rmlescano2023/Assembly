; file: lab4.asm
; Laboratory Exercise #4 for the Assembly course.
; This program takes in two numbers wherein the second
; operand is the number of places to shift the first
; operand, either to the left or right.

%include "asm_io.inc"

segment .data                       ; initialized data

    outmsg1     db "Enter a number: ", 0
    outmsg2     db "Enter the number of places to shift: ", 0

    left        db " << ", 0
    right       db " >> ", 0

    outmsg3     db " is ", 0




segment .bss                        ; uninitialized data; variables are created here

    num     resd 1
    shift   resd 1




segment .text

    global asm_main                 ; global directive was used to give asm_main an external scope

asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program
    call    print_nl
;
; start
;
    mov     eax, outmsg1
    call    print_string
    call    read_int
    mov     [num], eax              ; store the user input

    mov     eax, outmsg2
    call    print_string
    call    read_int
    mov     [shift], eax            ; store the number of shift/s

    call    print_nl
    
result_block:
    mov     cl, [shift]             ; move the number of shift/s into the CL register

    mov     eax, [num]
    call    print_int
    mov     eax, left
    call    print_string
    mov     eax, [shift]
    call    print_int
    mov     eax, outmsg3
    call    print_string

; shift left
    mov     eax, [num]              ; move the user input into the EAX register
    shl     eax, cl                 ; shift left operation
    call    print_int

    call    print_nl

    mov     eax, [num]
    call    print_int
    mov     eax, right
    call    print_string
    mov     eax, [shift]
    call    print_int
    mov     eax, outmsg3
    call    print_string

; shift right
    mov     eax, [num]              ; move the user input into the EAX register
    shr     eax, cl                 ; shift right operation
    call    print_int
;
; end
;
    call    print_nl
    call    print_nl
    popa                            ; removes general purpose registers off the stack to restore state
    mov     eax, 0                  ; return back to C
    leave                           ; leave the routine
    ret                             ; return