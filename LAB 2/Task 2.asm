.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
first db "Enter the first number:$"
second db "Enter the second number:$" 
sum db "Summation:$"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

LEA DX, first   ;first input er message dekhacche 
MOV AH, 9
int 21h

MOV AH, 1
int 21h
SUB AL, 30H
MOV BH, AL

;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h

;line break done 

LEA DX, second   ;second input er message dekhacche 
MOV AH, 9
int 21h

MOV AH, 1
int 21h
SUB AL, 30H
MOV BL, AL

; eikhane add korlam 
add BH, BL
ADD BH, 30H
 
;line break dibo aro ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
        
;output 
LEA DX, sum
MOV Ah, 9
int 21h

MOV DL, BH
MOV AH, 2
int 21h
        
        

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
