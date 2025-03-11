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

CMP AL, 'A'
JL NotUpperCase
CMP AL, 'Z'
JG NotUpperCase


MOV DL, AL
MOV AH, 02H
INT 21H

NotUpperCase:
;DO nothing
JMP Done
Done:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN
