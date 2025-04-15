.MODEL SMALL
.STACK 100H

.DATA
    newline DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Start from ASCII 80h
    MOV DL, 80H         ; Character to print
    MOV CX, 128         ; Total characters: FFh - 80h + 1 = 128
    MOV SI, 0           ; Counter for 10 chars per line

DISPLAY_LOOP:
    ; Print the character using INT 10h
    MOV AH, 0EH         ; Teletype output
    MOV AL, DL
    INT 10H

    ; Print a space
    MOV AH, 0EH
    MOV AL, ' '
    INT 10H

    ; Increment character
    INC DL

    ; Increment line counter
    INC SI
    CMP SI, 10
    JNE SKIP_NEWLINE

    ; Print newline (CR + LF)
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    MOV SI, 0           ; Reset counter

SKIP_NEWLINE:
    LOOP DISPLAY_LOOP

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
