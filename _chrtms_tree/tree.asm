section .data
strs times 11 db "*"
line db 0xa

section .text
    global _start
_start:
    push ebp
    mov ebp, 1
    call _print_strs
    pop ebp
    
    mov eax, 1
    int 0x80
        
_print_strs:
    mov edx, ebp
    mov ecx, strs
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov edx, 1
    mov ecx, line
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    add ebp, 2
    cmp ebp, 12
    jl _print_strs
    ret