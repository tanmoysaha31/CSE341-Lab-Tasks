.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, 1
MOV BX, 2
MOV CX, 3
MOV DX, 5

ADD AX, BX
MOV DI, AX

SUB CX, AX
MOV SI, CX

MUL SI

ADD DX, CX
ADD DX, BX

MUL AX

SUB DX, AX



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
