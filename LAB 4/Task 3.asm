.MODEL SMALL
.STACK 100H

.DATA
    CR EQU 0DH      ; Carriage return (used to move cursor to line start)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -------- Read 5 characters (no storing) --------
    MOV CX, 5            ; loop 5 times
READ_LOOP:
    MOV AH, 01H          ; function to read a character (with echo)
    INT 21H
    LOOP READ_LOOP

    ; -------- Carriage return to go back to start of line --------
    MOV DL, CR
    MOV AH, 02H
    INT 21H

    ; -------- Print 5 Xs to mask input --------
    MOV CX, 5
    MOV DL, 'X'
PRINT_XS:
    MOV AH, 02H
    INT 21H
    LOOP PRINT_XS

    ; -------- Exit to DOS --------
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
