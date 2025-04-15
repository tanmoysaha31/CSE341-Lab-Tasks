.MODEL SMALL

.STACK 100H

.DATA
    STAR DB '*'   ; ASCII character for asterisk

.CODE
MAIN PROC

    ; initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; set counter for loop (80 times)
    MOV CX, 80

    ; set the character to display
    MOV DL, STAR

PRINT_STAR:
    ; output the character in DL
    MOV AH, 02H
    INT 21H

    ; loop 80 times
    LOOP PRINT_STAR

    ; exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN

