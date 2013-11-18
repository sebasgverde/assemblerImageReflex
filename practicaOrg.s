 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern dprintf
 extern printf
 extern funcion
 extern sumando
 extern llamarSumar
 extern invertir

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
        formatoDec: db '%s', 0AH,0
        formatoDec2: db 'este es un numero %d y este es otro %d y otro %d y otro %d y otro %d', 0AH,0
        formatoString: db '%s', 0AH,0
        archivoNombre: db 'salida.txt',0AH,0;para intentar poner el output en un archivo con fprintf


segment .bss
        temp:	resq 1
        imagen1: resq 1
        imagen2: resq 1

 segment .text

_start: 

mov rbx, [rsp + 16];rsp argc, + 8 path, + 16 arg1 .... 
mov [imagen1], rbx
mov rbx, [rsp + 24]
mov[imagen2],rbx

mov rdi, formatoDec
mov rsi, [imagen1]
call printf

mov rdi,[imagen1]
mov rsi,[imagen2]
call invertir

jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




