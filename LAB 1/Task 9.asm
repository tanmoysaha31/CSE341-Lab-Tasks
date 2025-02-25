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

;GENERAL REGISTERS:
     MOV AX,AX
     MOV AX,BX

     MOV CS,AX
     MOV DS,BX

     MOV SI,AX
     MOV DI,BX

;SEGMENT REGISTER:
     MOV AX,CS
     MOV BX,DS

     MOV SI,CS
     MOV DI,DS

;MEMORY LOCATION:
     MOV AX,DI
     MOV BX,SI

     MOV CS,DI
     MOV DS,SI



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
