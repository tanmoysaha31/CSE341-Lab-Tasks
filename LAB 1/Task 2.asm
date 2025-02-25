.MODEL SMALL

.STACK 100H

.DATA
; declare variables here (optional for storage)

.CODE
MAIN PROC

; initialize DS
MOV AX, @DATA
MOV DS, AX

; Assign values to BX and CX
MOV BX, 5        ; BX = 5
MOV CX, 7        ; CX = 7

; Swap the values of BX and CX using AX as a temporary register
MOV AX, BX       
MOV BX, CX       
MOV CX, AX       

;exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
