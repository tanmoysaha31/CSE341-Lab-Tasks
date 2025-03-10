.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
inpmsg DB "Please input a character: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
LEA DX, inpmsg
MOV AH, 9
INT 21h

MOV AH, 1
Int 21h

CMP AL, 'y'
JE printkoro
CMP AL, 'Y'
JE printkoro

JMP Done

printkoro:
MOV DL, AL
MOV AH, 02H
INT 21H
JMP Done




Done:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN
