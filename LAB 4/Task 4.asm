.MODEL SMALL
.STACK 100H

.DATA
    M       DW 5       ; Multiplicand
    N       DW 4       ; Multiplier
    product DW 0       ; Product = M * N
    NEWLINE DB 0AH, 0DH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize AX to store product
    MOV AX, 0          
    MOV CX, N          

REPEAT_LOOP:
    ADD AX, M          ; Add M to AX (repeated addition)
    DEC CX             
    JNZ REPEAT_LOOP    

    MOV product, AX    ; Store result in memory

    ; Print newline
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H

    ; Move product to AX for printing
    MOV AX, product    
    CALL PrintNumber   ; Call procedure to print number

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

;----------------------------------------------------------
; PrintNumber: Converts AX to ASCII and prints it
;----------------------------------------------------------
PrintNumber PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX, CX          ; Digit count = 0
    MOV BX, 10          ; Divisor for base 10

REVERSE_LOOP:
    XOR DX, DX          ; Clear remainder
    DIV BX              ; AX / 10 -> quotient in AX, remainder in DX
    PUSH DX             ; Save remainder (digit)
    INC CX              ; Count digits
    CMP AX, 0
    JNZ REVERSE_LOOP    ; Repeat until AX becomes 0

PRINT_LOOP:
    POP DX              ; Get digit
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PrintNumber ENDP

END MAIN
