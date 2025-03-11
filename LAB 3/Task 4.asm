.MODEL SMALL
.STACK 100H
.DATA
    ; No data section needed for this task

.CODE
MAIN PROC

; initialize DS
MOV AX, @DATA
MOV DS, AX


MOV AL, 2 ;Value change kore test korte hobe        

; AL == 1 or 3
CMP AL, 1         
JE  DisplayO      
CMP AL, 3         
JE  DisplayO      

; AL ==  2 or 4 (display "e")
CMP AL, 2         
JE  DisplayE      
CMP AL, 4         
JE  DisplayE      

JMP Done          

DisplayO:
MOV DL, 'o'       
MOV AH, 02H       
INT 21H           
JMP Done          

DisplayE:
MOV DL, 'e'       
MOV AH, 02H       
INT 21H           
JMP Done          

Done:
; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
