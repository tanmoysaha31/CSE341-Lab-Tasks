.MODEL SMALL
.STACK 100H

.DATA
    inpmsg DB "Enter three sides: $"
    yesmsg DB "Y$"
    nomsg DB "N$"
    a DB ?
    b DB ?
    c DB ?

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display input message
    LEA DX, inpmsg
    MOV AH, 9
    INT 21h

    ; Read first side
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV a, AL

    ; Read second side
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV b, AL

    ; Read third side
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV c, AL

    ; Check a + b > c
    MOV AL, a
    ADD AL, b
    CMP AL, c
    JLE print_no

    ; Check b + c > a
    MOV AL, b
    ADD AL, c
    CMP AL, a
    JLE print_no

    ; Check a + c > b
    MOV AL, a
    ADD AL, c
    CMP AL, b
    JLE print_no

    ; Print "Y" if all conditions are met
    ;line break dibo ekta 
    MOV DL, 0AH
    MOV AH, 2
    INT 21h

    MOV DL, 13
    int 21h
    ; Line break done

    LEA DX, yesmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_no:
    ; Print "N" if any condition fails
    ;line break dibo ekta 
    MOV DL, 0AH
    MOV AH, 2
    INT 21h

    MOV DL, 13
    int 21h
    ; Line break done
    LEA DX, nomsg
    MOV AH, 9
    INT 21h

Done:
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
