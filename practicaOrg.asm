 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern printf

segment .data
        msgBienv:       db      'Bienvenido a la practica de organizacion de computadores', 0AH

 segment .text

_start: 
mov rdi, msgBienv ; rdi gets the first argument (a pointer)
mov rax, 0 
call printf
inter:
jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H
