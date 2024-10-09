; file: lab1.asm
; Laboratory Exercise 1 for Assembly course.
; This program ...

%include "asm_io.inc"



segment .data                       ; initialized data

prob db     "PROBLEM: The code uses each digit from 1-5 only once. The first two digits add up to 8. The difference of the second and fifth digits is equal to the fourth digit. The middle digit is the quotient when the product of the first and last digit is divided by 6. Get the code and you get the treasure.", 0

ans db      "ANSWER:", 0

digit1 db   "The first digit is ", 0
digit2 db   "The second digit is ", 0
digit3 db   "The third digit is ", 0
digit4 db   "The fourth digit is ", 0
digit5 db   "The fifth digit is ", 0

code db     "The code is ", 0



 segment .bss                        ; uninitialized data; variables are created here

a   resd 1
b   resd 1
c   resd 1
d   resd 1
e   resd 1



segment .text                       ; main code starts here

    global asm_main                 ; global directive was used to give asm_main an external scope

asm_main:
    enter 0, 0                      ; set up routine
    pusha                           ; push general purpose registers onto the stack so it can be used in the program

    call    print_nl                ; print new line
;
; print out problem statement
;
    mov     eax, prob
    call    print_string

    call    print_nl
;
; solving for the code starts here
;
; clue #1 equation is: a + b = 8
; the numbers from 1 - 5 that can add up to 8 is only 3 and 5,
; we assume a value for a
;

    mov     dword [a], 3

;
; now, the equation is: 3 + b = 8
; then, b = 8 - 3
;

    mov     eax, 8
    sub     eax, [a]                ; 8 - 3 = 5
    mov     [b], eax                ; store 5 to [b]

;
; clue #2 equation is: b - e = d
; since b = 5, then
; 5 - e = d
; then, 5 = d + e
; the remaining numbers that we can add to equate to 5 are 1 and 4
; we assume a value for e
;

    mov     dword [e], 4

;
; now, from the original equation: b - e = d
; then, 5 - 4 = d
;

    mov     eax, [b]
    sub     eax, [e]                ; 5 - 4 = 1
    mov     [d], eax                ; store 1 to [d]

;
; clue #3 equation is: c = (a * e) / 6
; based from the assumptions and results we've done,
; 2 is the only remaining number left
; therefore, the value of c should be 2
; let's check
;

    mov     eax, [a]                
    imul    eax, [e]                ; 3 * 4 = 12
    
    cdq                             ; extend EAX register to EDX:EAX
    mov     ecx, 6                  ; move 6 integer value to the ecx register first since we cannot divide immediate value
    idiv    ecx                     ; EDX:EAX / ECX ; 12 / 6 = 2
    mov     [c], eax                ; store quotient to [c]

    call    print_nl

;
; display of results starts here
;

    mov     eax, ans                
    call    print_string            ; "ANSWER"

    call    print_nl

    mov     eax, digit1
    call    print_string            ; "The first digit is "
    mov     eax, [a]
    call    print_int

    call    print_nl

    mov     eax, digit2
    call    print_string            ; "The second digit is "
    mov     eax, [b]
    call    print_int

    call    print_nl

    mov     eax, digit3
    call    print_string            ; "The third digit is "
    mov     eax, [c]
    call    print_int

    call    print_nl

    mov     eax, digit4
    call    print_string            ; "The fourth digit is "
    mov     eax, [d]
    call    print_int

    call    print_nl

    mov     eax, digit5
    call    print_string            ; "The fifth digit is "
    mov     eax, [e]
    call    print_int

    call    print_nl
    call    print_nl

    mov     eax, code
    call    print_string            ; "The code is "
    mov     eax, [a]
    call    print_int
    mov     eax, [b]
    call    print_int
    mov     eax, [c]
    call    print_int
    mov     eax, [d]
    call    print_int
    mov     eax, [e]
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