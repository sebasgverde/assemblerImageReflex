 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern dprintf
 extern printf
 extern funcion
 extern sumando
 extern llamarSumar
 extern invertir
 extern devStruct

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
        formatoDec: db 'heigth: %d', 0AH,0
        formatoDec2: db 'este es un numero %d y este es otro %d y otro %d y otro %d y otro %d', 0AH,0
        formatoString: db '%s', 0AH,0
        archivoNombre: db 'salida.txt',0AH,0;para intentar poner el output en un archivo con fprintf


segment .bss
        temp:	resq 1
        imagen1: resq 1
        imagen2: resq 1
        imagenStruct: resq 1
  height: resd  1 ; = img->height;
  width: resd  1     ;= img->width;
  step: resd  1      ;= img->widthStep;
  channels: resd  1  ;= img->nChannels;
  data: resq  1   ;q pues es puntero   = (uchar *)img->imageData;

 segment .text

_start: 

mov rbx, [rsp + 16];rsp argc, + 8 path, + 16 arg1 .... 
mov [imagen1], rbx
mov rbx, [rsp + 24]
mov[imagen2],rbx

mov rdi, formatoString
mov rsi, [imagen1]
call printf

mov rdi,[imagen1]
mov rsi,[imagen2]
call devStruct

mov [imagenStruct], rax
mov rax, [imagenStruct];ver imagen disttribucion ipolimage
add rax,40
mov eax, [rax]
mov [height],eax
;mov [widthStep],[rax + 44]
;mov [step], [rax + 96]
;mov [channels],[rax + 8]
;mov data, [rax + 88]

mov rdi, formatoDec
mov rsi, [height]
call printf


mov rdi,[imagen1]
mov rsi,[imagen2]
call invertir

inter:
jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




