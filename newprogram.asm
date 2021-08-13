; ------------------------------

; Programa para entrada de dados
; Aplicação feita com NeoVim
; Tutorial para compilar:
; $ nasm -f elf64 newprogram.asm
; $ ld -s -o newprogram newprogram.o
; $ ./newprogram

; ------------------------------

SYS_EXIT  equ 1
RET_EXIT  equ 5
SYS_READ  equ 3
SYS_WRITE equ 4
STD_IN    equ 0
STD_OUT   equ 1
MAX_IN    equ 10

segment .data:
    msg db "Entre com seu nome: ", 0xA, 0xD
    len equ $- msg

segment .bss
    nome resb 2

segment .text:
    
global _start:
    

_start:
    ; ax = acumulador de operações numericas
    ; bx = acumulador de registro base
    ; cx = registro de contas realizados com operações string
    ; dx = nosso registro de dados
    ; geralmente usamos a letra e junto com eles, logo, eax, ebx, e etc...
    ; em asm64x podemos usar a letra r também
    mov eax, SYS_WRITE
    mov edx, STD_OUT
    mov ecx, msg
    mov edx, len
    int 0x80
    
    ; entrada de dados

    mov eax, SYS_READ
    mov edx, STD_IN
    mov ecx, nome
    mov edx, MAX_IN
    int 0x80

exit:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT ; xor ebx, ebx
    int 0x80
