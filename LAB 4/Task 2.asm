.MODEL SMALL
.STACK 100H
.DATA
    sum DW 0   ; to store result of Task 02b

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ---------- Task 02a ----------
    MOV AX, 0      ; AX will store the sum
    MOV BX, 1      ; BX will store current term (starts at 1)

SUM_LOOP1:
    ADD AX, BX     ; Add current term to AX
    ADD BX, 3      ; Go to next term
    CMP BX, 149    ; If BX > 148, stop
    JLE SUM_LOOP1
    ; AX now has result of Task 02a

    ; ---------- Task 02b ----------
    MOV SI, 100        ; current term
    MOV DX, 0          ; temporary sum storage

SUM_LOOP2:
    ADD DX, SI         ; DX += current term
    SUB SI, 5          ; decrement by 5
    CMP SI, 4          ; if current < 5, stop
    JG SUM_LOOP2

    MOV sum, DX        ; store result in variable 'sum'

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

