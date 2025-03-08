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

MOV AH, 1 ; input nicchi  
int 21h
MOV BL, AL

;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h


;line break done kintu next position e show korbe

MOV DL, BL 
MOV AH, 2 ; input dekhacchi  
int 21h
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
