.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here   
str db "ENTER THREE INITIALS: $"

.CODE
MAIN PROC


; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, str
    mov ah, 9
    int 21h
    
    mov ah,1 
    int 21h
    mov bh , al
    
    mov ah,1 
    int 21h
    mov bl , al
    
    mov ah,1 
    int 21h
    mov cl, al
    
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h 
    
    mov dl,bh
    mov ah,2
    int 21h
    
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h 
    
    mov dl,bl
    mov ah,2
    int 21h 
    
    mov dl, 0AH
    mov ah , 2
    int 21h
    mov dL,0DH 
    int 21h 
    mov dL,0AH 
    int 21h 
    
    mov dl,cl
    mov ah,2
    int 21h




 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
