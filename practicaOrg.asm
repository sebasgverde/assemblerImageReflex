 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern printf

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH
        arreglo:	dd	12,32,34,23,4,234,34,5,345,34,5,34,5
        formatoDec: db '%d', 0AH,0
		format:		db '%d', 0AH,0


segment .bss
        temp:	resq 1

 segment .text

_start: 
mov rdi, msgBienv ; rdi gets the first argument (a pointer)
	mov rax, 0 
	call printf
	

	mov	eax, 0
	mov	ebx, 5
		ciclo1:
	push rax
	push rbx
	cmp	eax,ebx	
	jge finciclo1
		mov dword rsi, rax
		mov rdi, formatoDec 
		mov eax, 0
			inter:
		call printf
		pop rbx
		pop rax
		inc  rax
	jmp ciclo1
	finciclo1:


jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




