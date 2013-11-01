 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern printf

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
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
	mov dword rsi, [arreglo + eax]
	mov	ebx, [tamArreglo]
		ciclo1:
	push rax
	push rbx
	cmp	eax,ebx	
	jge finciclo1
		mov dword rsi, [arreglo + eax]
		mov rdi, formatoDec 
		mov eax, 0
			inter:
		call printf
		pop rbx
		pop rax
		add  rax,4
	jmp ciclo1
	finciclo1:


jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




