; file: lab6.asm
; Laboratory Exercise #6 for the Assembly course.
; This program solves for the factorial of a given number.

%include "asm_io.inc"

segment .data                       ; initialized data

    outmsg1     db "Enter a number to calculate its factorial: ", 0
    outmsg2     db "Factorial of ", 0
    outmsg3     db " is ", 0



segment .bss                        ; uninitialized data; variables are created here

    num1        resd 1
    counter     resd 1              ; loop counter
    product     resd 1              


segment .text

    global asm_main                 ; global directive was used to give asm_main an external scope

asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program
    call    print_nl
;
; start
;
    mov    eax, 1                   ; set the counters to 1
    mov    [counter], eax
    mov    [product], eax

    mov     eax, outmsg1            
    call    print_string            ; prints query

    mov     ebx, num1               ; store address of num1 into ebx, where user input will be stored
    mov     ecx, factorial          ; store the return address of the factorial into ecx
    jmp     short get_int           ; jump to get_int where user input will be taken
    

factorial:
    for_loop: 
        mov     eax, [counter]          
        mov     ebx, [num1]             
        cmp     eax, ebx                ; compare the current index of the loop to the user input
        jnle    result_block            ; if counter >= num1, end the loop

        mov     eax, [product]          ; if not, continue loop here          
        mov     ebx, [counter]          
        mul     ebx                     ; multiplies the current product to the current index, result is stored in eax

        mov     [product], eax

        mov     eax, [counter]
        inc     eax                     ; increment the index
        mov     [counter], eax
        jmp     for_loop

    result_block:
        call    print_nl

        mov     eax, outmsg2
        call    print_string
        mov     eax, [num1]         
        call    print_int
        mov     eax, outmsg3
        call    print_string

        mov     eax, [product]       
        call    print_int
        
        call    print_nl
        call    print_nl

        popa
        mov     eax, 0
        leave                     
        ret

get_int:
    call    read_int                ; reads user input, stores to eax
    mov     [ebx], eax              ; store input into ebx, containing the num1 address
    jmp     ecx                     ; jump the the address of factorial