BITS 16

SEGMENT .text
org 100h

; resident part
    jmp setup ; such a waste of bytes!
    mystring: db 'Hello darkness my old friend...$'
tsr:
    push ds
    push cs
    pop ds
    mov ah, 09h
    mov dx, mystring
    int 21h
    mov ax, 4c00h
    int 21h
    pop ds
    iret
; end resident part

setup:
; install handler
    mov ax, 2500h
    mov dx, tsr
    int 21h

; TSR
    mov ax, 3100h
    mov dx, 32h
    int 21h
