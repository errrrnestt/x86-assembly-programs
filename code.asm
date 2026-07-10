
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; multi-segment executable file template.

data segment
; add your data here!
tabl1 db 1,2,3,4
tabl2 db 1,2,3,4
pkey db "press any key...$"
ends

stack segment
dw   128  dup(0)
ends

code segment
start:
; set segment registers:
mov ax, data
mov ds, ax
mov es, ax

; add your code here
mov tabl2, 0
mov tabl2+1, 0
mov tabl2+2, 0
mov tabl2+3, 0
mov al, tabl1
mov tabl2+3, al
mov al, tabl1+1
mov tabl2+2, al
mov al, tabl1+2
mov tabl2+1, al
mov al, tabl1+3
mov tabl2, al

lea dx, pkey
mov ah, 9
int 21h        ; output string at ds:dx

; wait for any key....
mov ah, 1
int 21h

mov ax, 4c00h ; exit to operating system.
int 21h
ends

end start ; set entry point and stop the assembler.


