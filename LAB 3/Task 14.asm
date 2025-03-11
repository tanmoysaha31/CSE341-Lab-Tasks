.MODEL SMALL
.STACK 100H

.DATA
    inpmsg DB "Enter a number (00-10): $"
    num DW ?  ; Variable to store input number

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display input prompt
    LEA DX, inpmsg
    MOV AH, 9
    INT 21h

    ; Read first digit
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV BL, AL

    ; Read second digit
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV BH, AL

    ; Combine digits into number
    MOV AX, 0
    MOV AL, BL
    MOV CX, 10
    MUL CX
    ADD AL, BH
    MOV num, AX

    ; Add line break
    MOV DL, 0AH
    MOV AH, 2
    INT 21h
    MOV DL, 13
    INT 21h

    ; Determine output character using only allowed jumps
    MOV AX, num
    
    ; Check for 0-3
    CMP AX, 3
    JLE PRINT_I
    
    ; Check for 4-6
    CMP AX, 6
    JLE PRINT_K
    
    ; Check for 7-9
    CMP AX, 9
    JLE PRINT_L
    
    ; Check for 10
    CMP AX, 10
    JE PRINT_M


EXIT:
    MOV AX, 4C00H
    INT 21H

PRINT_I:
    MOV DL, 'i'
    JMP DISPLAY

PRINT_K:
    MOV DL, 'k'
    JMP DISPLAY

PRINT_L:
    MOV DL, 'l'
    JMP DISPLAY

PRINT_M:
    MOV DL, 'm'

DISPLAY:
    MOV AH, 2
    INT 21h
    JMP EXIT

MAIN ENDP
END MAIN