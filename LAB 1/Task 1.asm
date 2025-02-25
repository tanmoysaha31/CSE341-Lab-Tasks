.MODEL SMALL
.STACK 100H

.DATA
; declare variables here

.CODE
MAIN PROC

; initialize DS
MOV AX,@DATA
MOV DS,AX

; move the value from AX to BX
MOV BX, AX

; exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
