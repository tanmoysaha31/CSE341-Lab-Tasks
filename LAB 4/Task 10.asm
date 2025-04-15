.MODEL SMALL

.STACK 100H

.DATA
    prompt db "Enter four single-character inputs representing a year:", 10, "$"
    invalidInputMsg db "Invalid input. Please enter a single digit.", 10, "$"
    leapYearMsg db "Leap year", 10, "$"
    notLeapYearMsg db "Not leap year", 10, "$"
    inputPrompt db "Enter character: $"
    newline db 10, "$"

    year dw 0                      ; Variable to store the final year (4-digit integer)
    temp db 0                      ; Temporary variable for input processing

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    LEA DX, prompt
    MOV AH, 09H
    INT 21H

    ; Initialize year to 0
    XOR BX, BX                     ; BX will hold the final year value

    ; Loop to read 4 characters
    MOV CX, 4                      ; Set loop counter to 4
ReadLoop:
    ; Prompt user to enter a character
    LEA DX, inputPrompt
    MOV AH, 09H
    INT 21H

    ; Read a single character from the user
    MOV AH, 01H                    ; DOS function to read a character
    INT 21H

    ; Check if the input is a valid digit ('0'-'9')
    CMP AL, '0'
    JB InvalidInput                ; Jump if below '0'
    CMP AL, '9'
    JA InvalidInput                ; Jump if above '9'

    ; Valid input: Convert ASCII to numeric value
    SUB AL, '0'                    ; Convert ASCII to integer (e.g., '5' -> 5)

    ; Multiply current year by 10 and add the new digit
    MOV temp, AL                   ; Store the digit in temp
    MOV AX, BX                     ; Move current year into AX
    MOV DX, 10                     ; Prepare to multiply by 10
    MUL DX                         ; AX = BX * 10

    ; Zero-extend temp (8-bit) to AX (16-bit)
    XOR AH, AH                     ; Clear AH to zero-extend AL
    MOV AL, temp                   ; Load temp into AL
    ADD AX, BX                     ; Add the new digit to AX

    MOV BX, AX                     ; Update BX with the new year value

    ; Continue loop
    LOOP ReadLoop

    ; Check if the year is a leap year
    MOV AX, BX                     ; Move year into AX for calculations
    XOR DX, DX                     ; Clear DX for division
    MOV CX, 400                    ; Check divisibility by 400
    DIV CX
    CMP DX, 0                      ; If remainder is 0, it's divisible by 400
    JE LeapYear

    ; Check divisibility by 4 but not by 100
    MOV AX, BX                     ; Reload year into AX
    XOR DX, DX                     ; Clear DX for division
    MOV CX, 4                      ; Check divisibility by 4
    DIV CX
    CMP DX, 0                      ; If remainder is 0, it's divisible by 4
    JNE NotLeapYear                ; If not divisible by 4, it's not a leap year

    MOV AX, BX                     ; Reload year into AX
    XOR DX, DX                     ; Clear DX for division
    MOV CX, 100                    ; Check divisibility by 100
    DIV CX
    CMP DX, 0                      ; If remainder is 0, it's divisible by 100
    JE NotLeapYear                 ; Divisible by 100 but not 400 -> not a leap year

    ; If divisible by 4 but not by 100, it's a leap year
    JMP LeapYear

LeapYear:
    ; Display "Leap year" message
    LEA DX, leapYearMsg
    MOV AH, 09H
    INT 21H
    JMP ExitProgram

NotLeapYear:
    ; Display "Not leap year" message
    LEA DX, notLeapYearMsg
    MOV AH, 09H
    INT 21H
    JMP ExitProgram

InvalidInput:
    ; Display "Invalid input" message
    LEA DX, invalidInputMsg        ; Use renamed variable to avoid conflict
    MOV AH, 09H
    INT 21H
    JMP ExitProgram

ExitProgram:
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN                           ; Corrected entry point