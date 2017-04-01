bits 16

; invoke division by zero int
mov ax, 4000h
mov bl, 2
div bl

mov ax, 4c00h
int 21h
