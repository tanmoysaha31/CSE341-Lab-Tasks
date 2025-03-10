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
MOV AX, 0
CMP AX, 0

;if AX < 0 Means negative
JL Negative

;if AX == 0 
JE Equal

;if AX > 0
JG Greater

Greater:
MOV BX, 1
JMP Done

Negative:
MOV BX, -1
JMP Done

Equal:
MOV BX, 0
JMP Done 

Done:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
