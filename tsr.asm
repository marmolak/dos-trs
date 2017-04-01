BITS 16

SEGMENT .text
org 100h

; resident part
    jmp setup ; will be patched by next line
;    mov ah, 02h
    mov dx, 64;
    int 21h
    mov ax, 4c00h
    int 21h
    iret
; end resident part

setup:
; patch jmp part by mov ah, 02h
    mov word [100h], 0x02b4

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
