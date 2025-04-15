.MODEL SMALL

.STACK 100H

.DATA
    prompt DB 'Enter the number of rows: $'      ; Prompt message
    newline DB 0DH, 0AH, '$'                     ; Newline characters
    num_rows DB ?                                ; Variable to store number of rows (single digit)
    temp DB ?                                    ; Temporary variable for calculations

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    LEA DX, prompt
    MOV AH, 09H
    INT 21H

    ; Read number of rows (single digit)
    MOV AH, 01H
    INT 21H
    SUB AL, '0'                                  ; Convert ASCII to integer
    MOV num_rows, AL                             ; Store the number of rows

    ; Outer loop initialization
    XOR CX, CX                                   ; CX = 0 (row counter)
    MOV CL, 1                                    ; Start from row 1

OUTER_LOOP:
    PUSH CX                                      ; Save outer loop counter
    XOR BX, BX                                   ; BX = 0 (inner loop counter)

INNER_LOOP:
    INC BX                                       ; Increment inner loop counter
    MOV AX, BX                                   ; Move current number into AX
    ADD AX, '0'                                  ; Convert integer to ASCII
    MOV DL, AL                                   ; Move ASCII value to DL
    MOV AH, 02H                                  ; Print character
    INT 21H

    ; Print space after the number
    MOV DL, ' '
    MOV AH, 02H
    INT 21H

    ; Check if inner loop should continue
    CMP BX, CX                                   ; Compare inner counter with current row
    JB INNER_LOOP                                ; Jump back if BX < CX

    ; Print newline after each row
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    ; Restore outer loop counter
    POP CX
    INC CX                                       ; Increment row counter
    CMP CL, num_rows                             ; Compare current row with total rows
    JBE OUTER_LOOP                               ; Jump back if CX <= num_rows

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN