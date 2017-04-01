BITS 16

SEGMENT .text
org 100h

; resident part
    jmp setup ; will be patched
    mov cx, 10
    mov ah, 02h
    mov dx, 64;
    int 21h
    mov ax, 4c00h
    int 21h
    iret
; end resident part

setup:
; patch jmp part by nops
    mov word [100h], 9090h

; clean cpu cache
    wbinvd

; install handler
    mov ax, 2500h
    mov dx, 100h
    int 21h

; TSR
    mov ax, 3100h
    mov dx, 32h
    int 21h
