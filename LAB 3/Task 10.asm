.MODEL SMALL
.STACK 100H

.DATA
    inpmsg DB "Enter three numbers: $"
    maxmsg DB "Maximum number is: $"
    minmsg DB "Minimum number is: $"
    num1 DB ? 
    num2 DB ? 
    num3 DB ? 
    maxnum DB ? 
    minnum DB ? 

.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display input message
    LEA DX, inpmsg
    MOV AH, 9
    INT 21h

    ; Take first number input
    MOV AH, 1
    INT 21h
    SUB AL, '0'  
    MOV num1, AL

    ; Take second number input
    MOV AH, 1
    INT 21h
    SUB AL, '0'  
    MOV num2, AL

    ; Take third number input
    MOV AH, 1
    INT 21h
    SUB AL, '0'  
    MOV num3, AL

    ; Initialize maxnum and minnum
    MOV AL, num1
    MOV maxnum, AL
    MOV minnum, AL

    ; Compare second number for max
    MOV AL, num2
    CMP AL, maxnum
    JLE check_min2
    MOV maxnum, AL

check_min2:
    CMP AL, minnum
    JGE check_third
    MOV minnum, AL

check_third:
    MOV AL, num3
    CMP AL, maxnum
    JLE check_min3
    MOV maxnum, AL

check_min3:
    CMP AL, minnum
    JGE print_results
    MOV minnum, AL

print_results:
    ; New line
    MOV DL, 0AH
    MOV AH, 2
    INT 21h

    MOV DL, 13
    INT 21h

    ; Print max message
    LEA DX, maxmsg
    MOV AH, 9
    INT 21h

    ; Print maxnum
    MOV DL, maxnum
    ADD DL, '0'
    MOV AH, 2
    INT 21h

    ; New line
    MOV DL, 0AH
    MOV AH, 2
    INT 21h

    MOV DL, 13
    INT 21h

    ; Print min message
    LEA DX, minmsg
    MOV AH, 9
    INT 21h

    ; Print minnum
    MOV DL, minnum
    ADD DL, '0'
    MOV AH, 2
    INT 21h

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
