section .data
strs times 25 db "*"        ; Largura máxima da árvore [ desenho ]
maxlenstrs equ $-strs + 1   ; Largura máxima da árvore [ número ] + 1
gap times $-strs db " "     ; Largura máxima do gap [ desenho ]
line db 0xa                 ; Quebra de linha

section .text
    global _start
_start:
    ; O tamaho máximo do gap será a metade da largura máxima da árvore
    mov eax, maxlenstrs
    mov ecx, 2
    idiv ecx
    
    ; Passando parâmetros p/ _print_strs função _print_strs
    push ebp
    mov ebp, esp
    sub esp, 64
    mov dword[ebp-32], 1    ; Parâmetro 2: largura inicial da árvore
    mov dword[ebp-64], eax  ; Parâmetro 1: Largura inicial do gap [eax = resultado da divisão]
    
    call _print_strs        ; Chamada da função _print_strs
    
    ; Liberando memória usada por ebp
    mov esp, ebp
    pop ebp
    
    mov eax, 1
    int 0x80
        
_print_strs:

    ; Desenhando o gap
    mov edx, [ebp-64]
    mov ecx, gap
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Desenhando estrelas
    mov edx, [ebp-32]
    mov ecx, strs
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    ; pulando linha
    mov edx, 1
    mov ecx, line
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    add dword[ebp-32], 2            ; largura da árvore + 2
    sub dword[ebp-64], 1            ; largura do gap - 1
    
    ; Se a largura da árvore atingiu tamanho máximo: retorne
    ; Senão: repita as instruções de _print_strs
    cmp dword[ebp-32], maxlenstrs
    jl _print_strs
    
    ret
    
