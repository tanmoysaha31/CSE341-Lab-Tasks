.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here   
ask db "Enter a letter: $"
result db "My fav letter is: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
