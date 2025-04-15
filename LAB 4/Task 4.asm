.MODEL SMALL
.STACK 100H

.DATA
    M       DW 5       ; First number (multiplicand)
    N       DW 4       ; Second number (multiplier)
    product DW 0       ; Result will be stored here

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Load M and N
    MOV AX, 0          ; Initialize AX as the accumulator for 'product'
    MOV CX, N          ; CX will be used as the loop counter

REPEAT_LOOP:
    ADD AX, M          ; Add M to AX
    DEC CX             ; Decrement counter
    JNZ REPEAT_LOOP    ; Repeat until CX == 0

    ; Store result into product variable
    MOV product, AX

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
