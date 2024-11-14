; file: lab7_factorial.asm
; Laboratory Exercise #7 for the Assembly course.
; This file contains the subprograms:
; get_int (responsible for getting an integer from the user), and
; factorial (responsible for solving the factorial of the given number)

%include "asm_io.inc"

segment .bss
    user_input      resd 1          
    counter         resd 1          
    product         resd 1         

segment .text
    global  factorial, get_int

get_int:
    enter   0,0  

    call    read_int                    ; reads user input, stores to eax
    mov     [user_input], eax           

    mov     ebx, [ebp + 8]              ; move the value of the stack pointer, ebp + 8, into the ebx register
    mov     [ebx], eax                  ; store the user input to the address pointed by ebx

    leave
    ret



segment .text

factorial:
    enter 0,0
    
    mov    eax, 1
    mov    [counter], eax               ; initialize value of 1 to counter's memory address
    mov    [product], eax               ; initialize value of 1 to product's memory address

    for_loop: 
        mov     eax, [counter]          
        mov     ebx, [user_input]             
        cmp     eax, ebx                ; compare the current index of the loop to the user input
        jnle    end_loop                ; if counter >= user_input, end the loop

        mov     eax, [product]          ; if not, continue loop here          
        mov     ebx, [counter]          
        mul     ebx                     ; multiplies the current product to the current index, result is stored in eax

        mov     [product], eax

        mov     eax, [counter]
        inc     eax                     ; increment the index
        mov     [counter], eax
        jmp     for_loop

    end_loop:
        mov     eax, [product]
        mov     ebx, [ebp + 8]          ; move the value of the stack pointer, ebp + 8, into the ebx register
        mov     [ebx], eax              ; stores the final value of the factorial to the address pointed by ebx

        leave                     
        ret