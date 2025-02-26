.MODEL SMALL

.STACK 100H

.DATA

; declare variables here
A DW 22
B DW 29
C DW 90
D DW 36
Dividend DW 2229  
Total DW ?
X DW ?

.CODE
MAIN PROC

; initialize DS
MOV AX, @DATA
MOV DS, AX

;Code 
MOV AX, B
MOV BX, C
MUL BX       
MOV CX, A
ADD AX, CX   
SUB AX, D    
MOV X, AX


MOV DX, 0    
MOV BX, X
MOV AX, Dividend
DIV BX
MOV Total, AX

; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
