; Hello World First Program
; Author: Sherwin Wang

global _start

section .text:
; Instructions to run code

_start:
; kind of like main in C

    mov eax, 0x4
    ; moves the eax register
    ; 0x4 is the syscall, which is to write (unistd_32.h)
    mov ebx, 1
    ; use stdout as the fd
    ; in other words, the standard output as the file descriptor
    mov ecx, message
    ; use the message as the buffer
    mov edx, message_length
    ; and supply the length
    
    int 0x80
    ; int is interrupt, and 0x80 is the syscall to run

    mov eax, 0x1
    ; exits eax register
    mov ebx, 0
    ; specifies the return value
    ; normally 0, since 0 usually means success

    int 0x80
    ; now gracefully exits

    ;NOTE: write syscall is the function
        ;write(int fd, const void *buf, size_t count);



section .data:
; Define variables
        message: db "Hello World!", 0xA
        ; Declare variable
        ; db defines the bites
        ; 0x is the hex, A is the newline character
        message_length equ $-message
        ; nasm understands $-  as finding the length of... 