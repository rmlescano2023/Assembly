; file: lab8.asm
; Laboratory Exercise #8 for the Assembly course.
; This program prints a multiplication table based
; from the user input read from the C file, which is
; interfaced with this assembly file.

%include "asm_io.inc"

segment .data                       ; initialized data



segment .bss                        ; uninitialized data; variables are created here

    product     resd 1

    row_count   resd 1         
    col_count   resd 1



segment .text

    global mult                             ; global directive was used to give mult an external scope

mult:
    enter   0,0                             ; set up routine
    
    mov     eax, 1                      
    mov     [product], eax                  ; initialize value of 1 to product's memory address
    mov     [row_count], eax                ; initialize value of 1 to row counter's memory address

outer_loop:                                 ; in charge of the rows in the table
    mov     eax, 1                          ; crucial in completing all columns in every loop, that's why it should reset to 1 every time
    mov     [col_count], eax                ; initialize value of 1 to column counter's memory address

    mov     eax, [row_count]                ; compare current value of row counter with user input
    cmp     eax, [ebp + 8]                  ; [ebp + 8] is the address of the user input
    jnle    end_outer                       ; ends outer loop if row_count > user input or [ebp + 8]

inner_loop:                                 ; in charge of the columns in the table
    mov     eax, [col_count]       
    cmp     eax, [ebp + 8]                  ; compare current value of column counter with user input
    jnle    end_inner                       ; ends inner loop if col_count > user input
    
    mov     eax, [col_count]                ; if not, continue operation here
    mov     ebx, [row_count]       
    imul    eax, ebx                        ; current values of the row counter and column counter are multiplied
    mov     [product], eax                  
                
    mov     al, 9                           ; loads the ASCII code for the TAB into the AL register.
    call    print_char

    mov     eax, [product]                  
    call    print_int                       ; prints the product of the current loop

    mov     eax, [col_count]       
    inc     eax                             ; increment the column counter to prepare for next loop
    mov     [col_count], eax
    jmp     inner_loop

end_inner:
    call    print_nl                        ; proceeds to the next row of the table

    mov     eax, [row_count]       
    inc     eax                             ; increment the row counter to prepare for the next loop
    mov     [row_count], eax
    jmp     outer_loop

end_outer:
    call     print_nl
    
    leave
    ret