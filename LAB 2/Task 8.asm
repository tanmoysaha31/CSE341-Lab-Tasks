.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

s db '**********',0DH,0AH,'$'

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, s
mov ah, 9
int 21h
int 21h
int 21h
int 21h
int 21h
int 21h
int 21h
int 21h 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
