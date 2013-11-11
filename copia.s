 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern dprintf
 extern printf
 extern funcion

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
        formatoDec: db '%d', 0AH,0
        formatoDec2: db 'este es un numero %d y este es otro %d y otro %d y otro %d y otro %d', 0AH,0
        formatoString: db '%s', 0AH,0
        archivoNombre: db 'salida.txt',0AH,0


segment .bss
        temp:	resq 1

 segment .text

_start: 
mov rdi, msgBienv ; rdi lleva el primer argumento (puntero)
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
		mov rdi, formatoDec 
		mov dword rsi, [arreglo + eax]
		mov eax, 0
		call printf
		pop rbx
		pop rax
		add  rax,4
	jmp ciclo1
	finciclo1:

	;mov rdi, 1
	;mov dword rsi, formatoDec2
	mov rdi, formatoDec2;
	mov dword rsi, [arreglo]
	mov dword rdx, [arreglo + 4]
	mov dword rcx, [arreglo + 8]
	mov dword r8, [arreglo + 12]
	mov dword r9, [arreglo + 16]
	;de necesitar mas se usa la pila
	;call dprintf
	call printf

	call funcion
		mov dword rsi, rax
		mov rdi, formatoDec 
		mov eax, 0
		call printf

	call funcion

		mov dword rsi, rax
		mov rdi, formatoString 
		mov eax, 0
		call printf

inter:

jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




