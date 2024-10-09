; file: lab3.asm
; Laboratory Exercise #3 for the Assembly course.
; This program takes in two integers and solves for its LCM.

%include "asm_io.inc"

segment .data                       ; initialized data

    outmsg1     db "Enter two integers: ", 0

    result1     db "The least common multiple of ", 0
    result2     db " and ", 0
    result3     db " is ", 0
    result4     db ".", 0

    none        db "none", 0

    lcm         dd 0





segment .bss                        ; uninitialized data; variables are created here

    a           resd 1
    b           resd 1

    max         resd 1
    min         resd 1





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

    call    read_int                ; reads first number
    mov     [a], eax
    call    read_int                ; reads second number
    mov     [b], eax

check_zero:
    mov     eax, [a]
    cmp     eax, 0                  ; check if a is 0
    je      result_block

    mov     ebx, [b]
    cmp     ebx, 0                  ; check if b is 0
    je      result_block

if_block:
    cmp     eax, ebx                ; compare if a >= b
    jb      else_block              ; jump to else_block if condition is false (a is below b)

then_block:                         ; then block here (a is above or equal to b)
    mov     eax, [a]
    mov     [max], eax              ; assign max value
    mov     eax, [b]
    mov     [min], eax              ; assign min value

    jmp     endif                   ; skip else block
    
else_block:                         ; else block here (a is less than b)
    mov     eax, [b]
    mov     [max], eax
    mov     eax, [a]
    mov     [min], eax

endif:
    mov     ebx, 0                  ; set multiplier for max number

do:
    inc     ebx                     ; set multiplier to 1 on first loop, increment on the next loops

    mov     eax, [max]
    mul     ebx                     ; multiply max number with multiplier

    mov     [lcm], eax              ; store possible LCM

    mov     edx, 0                  ; EDX:EAX / ECX
    mov     ecx, [min]
    div     ecx                     ; divide possible LCM with the min number to check if it is divisible

    cmp     edx, 0                  ; checks if EDX (remainder) is zero, then it is the LCM
    jne     do                      ; if remainder is not equal to zero

result_block:
    mov     eax, result1
    call    print_string
    mov     eax, [a]
    call    print_int
    mov     eax, result2
    call    print_string
    mov     eax, [b]
    call    print_int
    mov     eax, result3
    call    print_string

    mov     eax, [lcm]
    cmp     eax, 0                  ; if LCM remains as zero, meaning a or b is zero
    je      none_block

    call    print_int               ; else, the LCM will be printed
    mov     eax, result4
    call    print_string
    
    jmp     end

none_block:
    mov     eax, none
    call    print_string
    mov     eax, result4
    call    print_string

end:

;
; end
;
    call    print_nl
    call    print_nl
    popa                            ; removes general purpose registers off the stack to restore state
    mov     eax, 0                  ; return back to C
    leave                           ; leave the routine
    ret                             ; return