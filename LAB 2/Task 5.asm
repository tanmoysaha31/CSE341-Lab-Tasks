.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
str1 db "THE SUM OF $"
str2 db " AND $"
str3 db " IS $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

    MOV DL, 03FH       
    mov ah , 2
    INT 21h   

    mov ah,1
    int 21h
    mov cl , al
    mov bl, cl 
    
    mov ah,1
    int 21h
    mov ch , al

    mov dl , cl
    add cl, ch
    sub cl, 030h
    
    mov dl, 0AH
    mov ah , 2
    int 21h 
    
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h 
    
    lea dx, str1
    mov ah, 9
    int 21h
   
    mov dl,bl
    mov ah,2
    int 21h
    
    lea dx, str2
    mov ah, 9
    int 21h
    
    mov dl,ch
    mov ah,2
    int 21h 
    
    lea dx, str3
    mov ah, 9
    int 21h
    
    mov dl,cl
    mov ah,2
    int 21h   


 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
