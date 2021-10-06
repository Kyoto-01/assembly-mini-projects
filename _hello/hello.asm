section .text		; seção de código
	global _start	; para que o linker(ld) saiba por onde começar a linkar
_start:			; label inicial, por onde o linker começa a linkar
	mov edx, len	; tamanho de msg vai p/ edx
	mov ecx, msg	; msg vai p/ ecx
	mov ebx, 1	; file descriptor (stdout)
	mov eax, 4	; codigo da chamada de sistema sys_write vai p/ eax
	int 0x80	; faz uma chamada do kernel
	mov eax, 1      ; codigo da chamada de sistema sys_exit vai p/ eax
	int 0x80	; chamada do kernel

section .data				; seção de constantes de memória
	msg db "Hello world", 0xa	; string que vai ser imprimida (0xa é equivalente a \n em linguagens de alto nível)
	len equ $ - msg			; tamanho da string
