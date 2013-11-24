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
 extern dividir
 extern imprimirBit
 extern scanf

segment .data
        msgBienv:	db	'Bienvenido a la practica de organizacion de computadores, ingrese el comando de la operacion deseada', 0AH, ' 1: espejo a lado izquierdo', 0AH, ' 2: espejo a lado derecho', 0AH, ' 3: inversion total de la imagen', 0AH, ' 4: inversion de color', 0AH,0
        arreglo:	dd	185113,32,34,23,4,234,34,5,345,34,5,34,5
        tamArreglo: dd 	52;13*4
        formatoDec: db 'Processing in asm a %dx%d image with %d channels with step %d', 0AH,0
        formatoDec2: db '%d', 0AH,0
        formatoString: db '%s', 0AH,0
        formatoByte: db '%b',0AH,0
        formatoComando: db '%d',0 
        otroFormato: db 'i %d j %d k %d',0AH,0
        archivoNombre: db 'salida.txt',0AH,0;para intentar poner el output en un archivo con fprintf
        dos: dd 2


segment .bss
        imagen1: resq 1
        imagen2: resq 1
        imagenStruct: resq 1
        height: resd  1 ; = img->height;
        width: resd  1     ;= img->width;
        widthMedios: resd 1
        step: resd  1      ;= img->widthStep;
        channels: resd  1  ;= img->nChannels;
        data: resq  1   ;q pues es puntero   = (uchar *)img->imageData;
        i:  resd  1
        j:  resd  1
        k:  resd  1
        temp: resd 1
        pos1: resq  1
        pos2: resq  1
        comando: resd 1


 segment .text

_start: 

mov rdi, msgBienv
call  printf

mov rdi, formatoComando
mov rsi, comando
call scanf

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

      mov rdi, [width]
      call dividir
mov [widthMedios],eax 


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
call printf



mov rdi, formatoDec2
mov rsi, [data]
          

call printf


mov dword [i],0
cicloi:
mov eax,[i]
mov ebx, [height]
cmp eax,ebx
jge fincicloi
  mov dword [j],0
  cicloj:
  mov eax,[j]
  mov ebx,[widthMedios]
  cmp eax,ebx
  jge fincicloj
    mov dword [k],0
    ciclok:
    mov eax,[k]
    mov ebx, [channels]
    cmp eax,ebx
    jge finciclok
      mov rdi, otroFormato
      mov rsi, [i]
      mov rdx, [j]
      mov rcx, [k]
      ;call printf

      ;---cambio-----

      mov rax, [data]
      mov qword [pos1], 0
      mov qword [pos2], 0

      mov edx,0
      mov eax, [i]
      mul dword [step]
      add eax, [k]

      add [pos1], eax
      add [pos2], eax

      mov edx,0
      mov eax, [j]
      mul dword [channels]
      mov edi, eax

      add [pos1], edi

      mov eax,[step]
      sub eax, edi

      add [pos2], eax

      mov rax, [data]
      add [pos1], rax
      add [pos2], rax
  

        ;----------casos-----------

        mov eax, [comando]
        mov ebx, 1
        cmp eax,ebx
        je izq
          mov eax, [comando]
          mov ebx, 2
          cmp eax,ebx
          je der
            je izq
            mov eax, [comando]
            mov ebx, 3
            cmp eax,ebx
            je inv
              je izq
              mov eax, [comando]
              mov ebx, 4
              cmp eax,ebx
              je col
              jmp fincicloi              

        izq: call espejoAIzq
        jmp finCasos
        der: call espejoADer
        jmp finCasos
        inv: call inversionCompletaAsm
        jmp finCasos
        col: call invertirColor
        jmp fincicloi

        finCasos:
      ;--------------

      inc dword [k]
    jmp ciclok
    finciclok:
          inc dword [j]
  jmp cicloj
  fincicloj:
        inc dword [i]
jmp cicloi
fincicloi:



mov rdi,[imagen2]
mov rsi,[imagenStruct]
call dibujar


jmp Exit



espejoAIzq:

    mov rdi,[pos1]
    mov rsi,[pos2]
    mov rdi, [rdi]
    mov [rsi],rdi

    ret

espejoADer:

    mov rdi,[pos1]
    mov rsi,[pos2]
    mov rsi, [rsi]
    mov [rdi],rsi

    ret

inversionCompletaAsm:

    mov rdi,[pos1]
    mov r8, [rdi]

    mov rdi,[pos1]
    mov rsi,[pos2]
    mov rsi,[rsi]
    mov [rdi],rsi
    
    mov rsi,[pos2]
    mov [rsi],r8

    ret

invertirColor:

    mov rdi,[pos1]
    mov rsi,[pos2]

    mov al, 255
    sub al, [rsi]
    mov [rsi],al

    mov al, 255
    sub al, [rdi]
    mov [rdi],al

    ret


inversionCompletaC:
  mov rdi, [height]
  mov rsi, [width]
  mov rdx, [channels]
  mov rcx, [step]
  mov r8, [data]
  mov rdi , [imagenStruct]
  call invertir
  ret

 Exit: 
        mov     eax, sys_Exit
        mov     ebx, 0
        int     80H




