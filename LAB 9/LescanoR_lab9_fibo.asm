; file: lab9.asm file
; Laboratory Exercise #9 for the Assembly course.
; This program computes for each of the Fibonacci numbers
; in the series, interfaced with a C program.

%include "asm_io.inc"

segment .data                       ; initialized data

    no_series       db "No series", 0



segment .bss                        ; uninitialized data; variables are created here

    num1        resd 1              ; previous number
    num2        resd 1              ; latest number
    counter     resd 1              ; series counter
    sum         resd 1              ; current sum in the fibonacci series



segment .text

    global  fibonacci               ; global directive was used to give fibonacci an external scope

fibonacci:
    enter   0,0                     ; setup routine

    mov     eax, [ebp + 8]        
    cmp     eax, 0
    je      zero_series             ; when user input is zero, go to error handler

    mov     eax, 0
    call    print_int               ; when user input is one, just print the first number in the series
    mov     eax, [ebp + 8]
    cmp     eax, 1                  ; checks if user input is one
    je      end_loop                ; if true, exit program

    call    print_nl

    mov     eax, 1                  ; prints third number in the series
    call    print_int

; assign starting two numbers in the series, 0 and 1
    mov     eax, 0
    mov     [num1], eax             ; num1 = 0
    mov     [sum], eax              ; set current sum value to zero, sum = 0
    inc     eax
    mov     [num2], eax             ; num2 = 1
    inc     eax
    mov     [counter], eax          ; series counter starts at two, counter = 2
    
lp:
    call    print_nl

    mov     eax, [counter]          
    cmp     eax, [ebp + 8]          ; check if counter is greater or equal to user input
    jge     end_loop                ; if true, proceed to end of program

    mov     eax, [num1]             
    mov     ebx, [num2]
    add     eax, ebx                ; add the previous and latest number in the series
    mov     [sum], eax              ; store it to sum
    call    print_int               ; print new latest number

; update the next two numbers in the series
    mov     ebx, [num2]
    mov     [num1], ebx             ; set the value of num2 as the previous number
    mov     [num2], eax             ; set the value of sum as the latest number

    mov     eax, [counter]
    inc     eax                     ; increment the series counter
    mov     [counter], eax

    jmp     lp

zero_series:
    mov     eax, no_series          ; error handler
    call    print_string

end_loop:
    call    print_nl
    call    print_nl

    leave
    ret