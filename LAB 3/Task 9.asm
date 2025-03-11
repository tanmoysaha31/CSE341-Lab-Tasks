.MODEL SMALL
.STACK 100H
.DATA

; declare variables here
inpmsg DB "Input a number: $"
m DB 10
notmsg DB "NOT Divisible$"
yesmsg DB "Divisible by both!$"
num DW ?  ; Change from DB to DW to store a 16-bit number


.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX
 
; enter your code 
LEA DX, inpmsg
MOV AH, 9
INT 21h  ; message dekhano done

MOV AH, 1  ; first number      
INT 21h          
SUB AL, '0'
MOV BL, AL 
MOV AX, BX
MUL m
MOV DX, AX  

MOV AH, 1    ; second number 
INT 21h    
SUB AL, '0'
MOV AH, 0   
ADD DX, AX  

MOV num, DX  ; Storing the final number correctly in memory


;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done

;The number is divisible by 5 and 11 or not.
;First checking if it's divisible by 5 or not
MOV AX, num  ; Load the number from the variable       
MOV DX, 0        
MOV BX, 5        ; Check divisibility by 5
DIV BX           
CMP DX, 0
JE checkagain

LEA DX, notmsg
MOV AH, 9
INT 21H
JMP Done

checkagain:
MOV AX, num       ; Restore the number again from variable
MOV DX, 0        ; Clear DX

MOV BX, 11       ; Check divisibility by 11
DIV BX           ; AX / 11, remainder in DX
CMP DX, 0        
JE print_yesmsg

LEA DX, notmsg
MOV AH, 9
INT 21H
JMP Done

print_yesmsg:
LEA DX, yesmsg
MOV AH, 9
INT 21H
JMP Done
  

Done:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
