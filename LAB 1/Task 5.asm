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
MOV BX, 5
MOV CX, 3
MOV DX, BX

;Add & Sub Operation
add BX, CX
add CX, DX
sub BX, DX
sub CX, BX

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
