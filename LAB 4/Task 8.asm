.MODEL SMALL
.STACK 100H

.DATA
    last_digit  DB 7            ; <-- Replace with your student ID's last non-zero digit
    M           DW 0
    N           DW 0
    temp        DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 1                  ; Start loop from 1

LOOP_START:
    CMP CX, 101
    JGE DONE

    ; Store CX in AX to divide
    MOV AX, CX
    MOV BL, last_digit
    DIV BL                     ; AX / BL ? AL = Quotient, AH = Remainder

    CMP AH, 0
    JZ ADD_TO_M

    ; Not divisible ? add to N
    MOV AX, N
    ADD AX, CX
    MOV N, AX
    JMP NEXT_NUM

ADD_TO_M:
    MOV AX, M
    ADD AX, CX
    MOV M, AX

NEXT_NUM:
    INC CX
    JMP LOOP_START

DONE:
    ; Program exit
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
