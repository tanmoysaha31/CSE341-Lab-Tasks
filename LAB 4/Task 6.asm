.MODEL SMALL
.STACK 100H

.DATA
    prompt1 DB 'ENTER A HEX DIGIT: $'
    invalid_msg DB 13, 10, 'INVALID INPUT. TRY AGAIN.', 13, 10, '$'
    result_msg DB 13, 10, 'IN DECIMAL IT IS $'
    again_msg DB 13, 10, 13, 10, 'DO YOU WANT TO DO IT AGAIN? $'
    newline DB 13, 10, '$'
    input_char DB ?
    continue_flag DB 'Y'
    digit_value DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START:
    ; Prompt for input
    LEA DX, prompt1
    MOV AH, 09H
    INT 21H

    ; Read character
    MOV AH, 01H
    INT 21H
    MOV input_char, AL

    ; Validate input
    ; Check if between '0' and '9'
    CMP AL, '0'
    JL INVALID_INPUT
    CMP AL, '9'
    JLE CONVERT_DIGIT

    ; Check if between 'A' and 'F'
    CMP AL, 'A'
    JL INVALID_INPUT
    CMP AL, 'F'
    JLE CONVERT_ALPHA

    ; Invalid
    JMP INVALID_INPUT

CONVERT_DIGIT:
    SUB AL, '0'        ; Convert ASCII '0'-'9' to 0-9
    MOV digit_value, AL
    JMP DISPLAY_RESULT

CONVERT_ALPHA:
    SUB AL, 'A'
    ADD AL, 10         ; A = 10, B = 11, ..., F = 15
    MOV digit_value, AL
    JMP DISPLAY_RESULT

INVALID_INPUT:
    LEA DX, invalid_msg
    MOV AH, 09H
    INT 21H
    JMP START

DISPLAY_RESULT:
    ; Show "IN DECIMAL IT IS "
    LEA DX, result_msg
    MOV AH, 09H
    INT 21H

    ; Convert digit_value to ASCII and display
    MOV AL, digit_value
    CALL PrintDecimal

ASK_AGAIN:
    ; Ask if want to continue
    LEA DX, again_msg
    MOV AH, 09H
    INT 21H

    ; Read input
    MOV AH, 01H
    INT 21H

    ; Check for 'y' or 'Y'
    CMP AL, 'y'
    JE START
    CMP AL, 'Y'
    JE START

    ; Exit
    MOV AX, 4C00H
    INT 21H

MAIN ENDP

; Helper: print decimal number in AL (0–255)
PrintDecimal PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    XOR AH, AH        ; clear upper byte of AX
    MOV CX, 0         ; digit counter

    MOV BX, 10        ; divisor

    ; Store digits in reverse order
    .NEXT:
        XOR DX, DX
        DIV BX         ; AX / 10
        PUSH DX        ; remainder (digit)
        INC CX
        TEST AX, AX
        JNZ .NEXT

    ; Pop and print digits
    .PRINT:
        POP DX
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        LOOP .PRINT

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PrintDecimal ENDP

END MAIN
