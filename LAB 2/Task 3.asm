.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
; 3 (a)
MOV AH, 1 ; input nicchi  
int 21h
MOV DL, AL

MOV AH, 2 ; input dekhacchi  
int 21h

;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h

;line break done
       
; 3(b)
;32 plus korte hobe 
MOV AH, 1 ; input nicchi  
int 21h
MOV BL, AL

ADD BL, 32
MOV DL, BL
MOV AH, 2
int 21h       

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
