section .data
msg db 0xa, "See my stars", 0xa
len equ $ - msg
stars times 12 db "*"

section .text
	global _start
_start:
	mov edx, 12
	mov ecx, stars
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80
