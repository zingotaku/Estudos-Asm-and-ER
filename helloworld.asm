; -----------------------
; Hello World, seja bem vindos ao meu primeiro software em assembly.
; Tutorial para compilar:
; $ nasm -f elf64 helloworld.asm
; $ ld -s -o helloworld helloworld.o
; $ ./helloworld
; -----------------------

; linha 9: Imprime a mensagem: "Hello, World"
; linha 10: Define o tamanho da msg.

segment .data
  msg db 'Hello, world!', 0xA, 0xD
  len equ $- msg

segment .text

global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

; saida
  mov eax, 1
  mov ebx, 5
  int 0x80