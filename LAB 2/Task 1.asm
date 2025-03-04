.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
msg1 DB "Please Insert a character:$"  

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

LEA DX, msg1   ;Input message showing
MOV AH, 9
int 21H


MOV AH, 1 ; input nicchi  
int 21h
MOV DL, AL




MOV AH, 2 ; input dekhacchi  
int 21h
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
