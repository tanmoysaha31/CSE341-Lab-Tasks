.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
s1 db "ENTER A HEX DIGIT: $" 
s2 db "IN DECIMAL IT IS: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

    lea dx, s1
    mov ah, 9
    int 21h
    
    mov ah,1 
    int 21h
    mov bh , al
    
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h
    
    lea dx, s2
    mov ah, 9
    int 21h
    
    mov ah , 2
    mov dl , 31h 
    int 21h
     
    mov ah , 2
    sub bh , 11h
    mov dl , bh
    int 21h    


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
