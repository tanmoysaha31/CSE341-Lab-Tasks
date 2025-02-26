.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
S DW 2229
B DW 6
Total DW ? 
YearlySalary DW ?
BonusAmount DW ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, S 
MOV BX, 12
MUL BX
MOV YearlySalary, AX


MOV AX, YearlySalary  
MOV DX, 0        
MOV CX, B        
MUL CX           
MOV BX, 100      
DIV BX           
MOV BonusAmount, AX  


ADD AX, YearlySalary  
MOV Total, AX        

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
