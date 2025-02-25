.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
X DB 8
Y DB 4
Z DB 2
R1 DW ?
R2 DW ?
R3 DW ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
; X * Y
MOV AL, X
MUL Y
MOV R1, AX 



; X / Y
MOV AX, 0
MOV AL, X      
DIV Y          
MOV AX, AX
MOV R2, AX


; X * Y / Z
MOV AL, X
MUL Y
MOV AH, 0    
DIV Z
MOV AX, AX   
MOV R3, AX    

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
