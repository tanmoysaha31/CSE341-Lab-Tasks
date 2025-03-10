.MODEL SMALL
.STACK 100H

.DATA
    prompt DB "Enter a number: $"
    even_msg DB "The number is even.$"
    odd_msg DB "The number is odd.$"

.CODE
MAIN PROC
; Initialize DS
MOV AX, @DATA
MOV DS, AX

; Display prompt message
LEA DX, prompt
MOV AH, 09H
INT 21H

; Read input number
MOV AH, 01H        
INT 21H            
SUB AL, '0'        


MOV AH, 0         
MOV BL, 2          ; AL k 2 diye divide korte hobe 
DIV BL             ; AH e remainder thakbe 

; If AH ==  0
CMP AH, 0       
JZ even            

odd:
; otherwise
LEA DX, odd_msg
MOV AH, 09H
INT 21H
JMP Done

even:
LEA DX, even_msg
MOV AH, 09H
INT 21H

Done:
; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
