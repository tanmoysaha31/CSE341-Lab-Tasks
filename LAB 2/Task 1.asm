.MODEL SMALL
.STACK 100H

.DATA

ask db "Please insert a character: $"  ; Prompt message
result db "My fav letter is: $"        ; Output message
char db ?                              ; Variable to store user input

.CODE
MAIN PROC

; Initialize DS
MOV AX, @DATA
MOV DS, AX

; Display the prompt message
MOV DX, OFFSET ask
MOV AH, 09H
INT 21H

; Take character input
MOV AH, 01H   ; Function to take single character input
INT 21H
MOV char, AL  ; Store the input character

; Newline for better formatting
MOV DL, 0DH   ; Carriage return
MOV AH, 02H
INT 21H
MOV DL, 0AH   ; Line feed
INT 21H

; Display the output message
MOV DX, OFFSET result
MOV AH, 09H
INT 21H

; Display the input character
MOV DL, char
MOV AH, 02H
INT 21H

; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
