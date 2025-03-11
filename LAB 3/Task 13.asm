.MODEL SMALL
.STACK 100H

.DATA
    inpmsg DB "Enter a number (1-7): $"
    satmsg DB "Saturday$"
    sunmsg DB "Sunday$"
    monmsg DB "Monday$"
    tuesmsg DB "Tuesday$"
    wedmsg DB "Wednesday$"
    thursmsg DB "Thursday$"
    frimsg DB "Friday$"

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display input message
    LEA DX, inpmsg
    MOV AH, 9
    INT 21h

    ; Read input
    MOV AH, 1
    INT 21h
    SUB AL, '0'  ; Convert ASCII to number (1-6)
    MOV BL, AL   ; Store input in BL

    ; Check input and print corresponding day
    CMP BL, 1
    JE print_sat
    CMP BL, 2
    JE print_sun
    CMP BL, 3
    JE print_mon
    CMP BL, 4
    JE print_tues
    CMP BL, 5
    JE print_wed
    CMP BL, 6
    JE print_thurs
    CMP BL, 7
    JE print_fri

Done:
    MOV AX, 4C00H
    INT 21H

print_sat:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, satmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_sun:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, sunmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_mon:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, monmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_tues:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, tuesmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_wed:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, wedmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_thurs:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, thursmsg
    MOV AH, 9
    INT 21h
    JMP Done

print_fri:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done
    LEA DX, frimsg
    MOV AH, 9
    INT 21h
    JMP Done

MAIN ENDP
END MAIN
