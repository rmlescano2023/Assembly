; file: lab5.asm
; Laboratory Exercise #5 for the Assembly course.
; This program accepts two integers and outputs
; their results after using bitwise operations.

%include "asm_io.inc"

segment .data                       ; initialized data

    outmsg1     db "Enter a number: ", 0
    outmsg2     db "Enter another number: ", 0

    op1         db " & ", 0
    op2         db " | ", 0
    op3         db " ^ ", 0

    outmsg3     db " is ", 0



segment .bss                        ; uninitialized data; variables are created here

    num1    resd 1
    num2    resd 1

    andNum  resd 1
    orNum   resd 1
    xorNum  resd 1




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
    mov     [num1], eax

    mov     eax, outmsg2
    call    print_string
    call    read_int
    mov     [num2], eax

    call    print_nl

; bitwise_block:
    mov     eax, [num1]             ; AND operation starts here
    and     eax, [num2]
    mov     [andNum], eax

    mov     eax, [num1]             ; OR operation starts here
    or      eax, [num2]
    mov     [orNum], eax

    mov     eax, [num1]             ; XOR operation starts here
    xor     eax, [num2]
    mov     [xorNum], eax


; result_block:
    mov     eax, [num1]             ; the ff. code block prints the AND result of the two numbers
    call    print_int
    mov     eax, op1
    call    print_string
    mov     eax, [num2]
    call    print_int
    mov     eax, outmsg3
    call    print_string
    mov     eax, [andNum]           ; store the AND result to the EAX register to be printed into the output
    call    print_int

    call    print_nl

    mov     eax, [num1]             ; this code block prints the OR result of the two numbers
    call    print_int
    mov     eax, op2
    call    print_string
    mov     eax, [num2]
    call    print_int
    mov     eax, outmsg3
    call    print_string
    mov     eax, [orNum]            ; store the OR result to the EAX register to be printed into the output
    call    print_int

    call    print_nl

    mov     eax, [num1]             ; this code block prints the XOR result of the two numbers
    call    print_int
    mov     eax, op3
    call    print_string
    mov     eax, [num2]
    call    print_int
    mov     eax, outmsg3
    call    print_string
    mov     eax, [xorNum]            ; store the OR result to the EAX register to be printed into the output
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