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

;36DF * AF    ;Fatal Error Needed to modify the 2nd number
MOV AX, 36DFH
MOV BX, 0AFH ; Have Overflow Not Possible
mul BX

; F4D5 / C9A5
MOV DX, 0000H
MOV AX, 0F4D5H
MOV BX, 0C9A5H
DIV BX  ; Not possible error in the number had to modify the numbers to make it work


; CA92 * BAF9
MOV AX, 0CA92h
MOV BX, 0BAF9h
MUL BX


;C2A2 * ABCD / BED
MOV AX, 0C2A2H
MOV BX, 0ABCDH
MUL BX
MOV CX, 0BEDH 
DIV CX
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
