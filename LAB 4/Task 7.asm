.MODEL SMALL
.STACK 100H

.DATA
    msg1        DB 'ENTER A STRING OF CAPITAL LETTERS:$'
    msg2        DB 13,10,'THE LONGEST CONSECUTIVELY INCREASING STRING IS:$'
    newline     DB 13,10,'$'
    inputStr    DB 100 DUP('$')
    currLen     DB 1
    maxLen      DB 1
    currStart   DW 0
    maxStart    DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt user
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    ; Input string
    MOV SI, 0

READ_LOOP:
    MOV AH, 01H
    INT 21H
    CMP AL, 13          ; Enter key?
    JE PROCESS_STRING
    MOV inputStr[SI], AL
    INC SI
    JMP READ_LOOP

PROCESS_STRING:
    ; SI contains total characters
    MOV CX, SI          ; CX = total length
    MOV SI, 0           ; SI = current index
    MOV DI, 0           ; DI = current sequence start
    MOV currLen, 1
    MOV maxLen, 1
    MOV currStart, 0
    MOV maxStart, 0

NEXT_CHAR:
    MOV AL, inputStr[SI]
    MOV BL, inputStr[SI+1]
    CMP CX, 1
    JL DONE             ; if only 1 character, skip

    CMP BL, 0
    JE DONE

    MOV AH, 0
    CMP BL, AL
    JZ RESET_SEQ

    ; Check if BL == AL + 1
    MOV DL, AL
    INC DL
    CMP BL, DL
    JE CONTINUE_SEQ

RESET_SEQ:
    ; Reset current sequence
    INC SI
    MOV currLen, 1
    MOV AX, SI
    MOV currStart, AX
    DEC CX
    JMP NEXT_CHAR

CONTINUE_SEQ:
    INC currLen
    ; Check if current sequence is longest
    MOV AL, currLen
    CMP AL, maxLen
    JLE SKIP_UPDATE
    MOV maxLen, AL
    MOV AX, currStart
    MOV maxStart, AX

SKIP_UPDATE:
    INC SI
    DEC CX
    JMP NEXT_CHAR

DONE:
    ; Print result
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    ; Set SI = maxStart, CX = maxLen
    MOV SI, maxStart
    MOV CL, maxLen

PRINT_LOOP:
    MOV DL, inputStr[SI]
    MOV AH, 02H
    INT 21H
    INC SI
    DEC CL
    JNZ PRINT_LOOP

    ; Exit
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
