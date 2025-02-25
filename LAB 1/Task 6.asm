.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A DB 3
B DB 6
C DB ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
; A = B - A
MOV AL, B
sub AL, A
MOV A, AL

;A =-(A+1) 
MOV AL, A
ADD AL, 1
NEG AL
MOV A, AL

;C = A + (B + 1); use inc
MOV AL, B
INC AL
MOV BL, A
ADD AL, BL
MOV C, AL


;A = B - (A - 1); use dec
MOV AL, B
MOV BL, A
DEC Bl 
SUB AL, BL
MOV AL, AL 



;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
