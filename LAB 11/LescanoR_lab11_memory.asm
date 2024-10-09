; file: lab11.asm file
; Laboratory Exercise #11 for the Assembly course.
; This program illustrates how to use the string instructions

global asm_copy, asm_strlen

segment .text
; function asm_copy
; copies blocks of memory
; C prototype
; void asm_copy( void * dest, const void * src, unsigned sz);
; parameters:
;   dest - pointer to buffer to copy to
;   src  - pointer to buffer to copy from
;   sz   - number of bytes to copy

; next, some helpful symbols are defined

%define dest [ebp + 8]
%define src  [ebp + 12]
%define sz   [ebp + 16]
asm_copy:
        enter   0, 0
        push    esi
        push    edi

        mov     esi, src         ; esi = address of buffer to copy from
        mov     edi, dest        ; edi = address of buffer to copy to
        mov     ecx, sz          ; ecx = number of bytes to copy

        cld                     ; clear direction flag 
        rep     movsb           ; execute movsb ECX times

        pop     edi
        pop     esi
        leave
        ret



; function asm_strlen
; returns the size of a string
; unsigned asm_strlen( const char * );
; parameter:
;   src - pointer to string
; return value:
;   number of chars in string (not counting, ending 0) (in EAX)

%define src [ebp + 8]
asm_strlen:
        enter   0,0
        push    edi

        mov     edi, src        ; edi = pointer to string
        mov     ecx, 0FFFFFFFFh ; use largest possible ECX
        xor     al,al           ; al = 0
        cld

        repnz   scasb           ; scan for terminating 0

;
; repnz will go one step too far, so length is FFFFFFFE - ECX,
; not FFFFFFFF - ECX
;
        mov     eax,0FFFFFFFEh
        sub     eax, ecx          ; length = 0FFFFFFFEh - ecx

        pop     edi
        leave
        ret