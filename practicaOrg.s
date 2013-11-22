 sys_Exit       equ     1 ;id codigos del sistema

 global _start
 extern dprintf
 extern printf
 extern funcion
 extern sumando
 extern llamarSumar
 extern invertir
 extern devStruct
 extern dibujar

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
        formatoDec: db 'Processing a %dx%d image with %d channels with step %d', 0AH,0
        formatoDec2: db '%d', 0AH,0
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
call devStruct

mov [imagenStruct], rax
mov rax, [imagenStruct];ver imagen disttribucion ipolimage
add rax,44
mov eax, [rax]
mov [height],eax

;mov [step], [rax + 96]
;mov [channels],[rax + 8]
;mov data, [rax + 88]

mov rax, [imagenStruct]
add rax,40
mov eax, [rax]
mov [width],eax

mov rax, [imagenStruct]
add rax,96
mov eax, [rax]
mov [step],eax


mov rax, [imagenStruct]
add rax,8
mov eax, [rax]
mov [channels],eax

mov rax, [imagenStruct]
add rax,88
mov rax, [rax]
mov [data],rax


mov rdi, formatoDec
mov rsi, [height]
mov rdx, [width]
mov rcx, [channels]
mov r8, [step]
inter:

call printf

mov rdi, formatoDec2
mov rsi, [data]
call printf

mov rdi, [height]
mov rsi, [width]
mov rdx, [channels]
mov rcx, [step]
mov r8, [data]
;mov rdi , [imagenStruct]
call invertir



mov rdi,[imagen2]
mov rsi,[imagenStruct]
call dibujar


jmp Exit


 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




