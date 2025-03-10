.MODEL SMALL
.STACK 100H

.DATA
    

.CODE
MAIN PROC

; initialize DS
MOV AX, @DATA
MOV DS, AX


MOV AL, 67      ; 'A' in ASCII
MOV BL, 66      ; 'B' in ASCII

CMP AL, BL     
JC  ALIsSmaller ; If AL < BL

;BL is smaller 
MOV DL, BL      
MOV AH, 02H     
INT 21H         
JMP Done        

ALIsSmaller:
MOV DL, AL      
MOV AH, 02H     
INT 21H    

Done:
; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
