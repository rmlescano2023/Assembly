; file: lab10.asm file
; Laboratory Exercise #10 for the Assembly course.
; This program ...

%include "asm_io.inc"
%define ARRAY_SIZE 100

segment .data                               ; initialized data

    outmsg1                 db "Enter array size: ", 0
    outmsg2                 db "Enter value @ array[", 0
    outmsg3                 db "]: ", 0

    outmsg4                 db "Array contains: ", 0



segment .bss                                ; uninitialized data; variables are created here

    array                   resd ARRAY_SIZE

    array_size              resd 1
    index                   resd 1



segment .text

    global asm_main                         ; global directive was used to give asm_main an external scope

asm_main:
    enter   0, 0                            ; set up routine

    call    print_nl

get_array_size:
    mov     eax, outmsg1     
    call    print_string
    call    read_int
    mov     [array_size], eax               ; array size input stored into array_size
    
    mov     eax, 0                          ; index set to 0
    mov     [index], eax

array_values:                               ; loop responsible for taking the values in the array
    mov     eax, [array_size]               
    mov     ebx, [index]
    cmp     eax, ebx                        ; check if current index is equivalent to array size
    jle     unsorted_array                  ; array query is done
    
    mov     eax, outmsg2     
    call    print_string                    ; print ouput message with the current array index
    mov     eax, [index]
    call    print_int
    mov     eax, outmsg3
    call    print_string

    call    read_int                        ; read integer and store in the array
    mov     [array + ebx], eax
    
    mov     eax, [index]
    inc     eax                             ; increment index to prepare for the next loop
    mov     [index], eax
    jmp     array_values

unsorted_array:                             
    call    print_nl

    mov     eax, outmsg4
    call    print_string                    ; prints "Array contains: "

    call    print_nl

    mov     ecx, 0                          ; reset index for the next loop

print_unsorted_array:                       ; prints the array after taking values from the user
    mov     eax, [array_size] 
    mov     ebx, ecx
    cmp     eax, ebx                        ; loop ends if index reach array size
    jle     end_loop

    mov     al, [array + ecx]               ; prints the value at the current index in the array
    call    print_int

    mov     al, 32       
    call    print_char                      ; prints the ASCII character set value of 32, which is a space

    inc     ecx

    jmp     print_unsorted_array

;----------------------------------------------- SORT

end_loop:
    call    print_nl
    call    print_nl

    leave
    ret