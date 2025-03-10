.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
inpmsg DB "Please input a character: $"
vmsg DB "The character is a vowel$"
cmsg DB "The character is a consonant$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

LEA DX, inpmsg
MOV AH, 9
INT 21h

MOV AH, 1
Int 21h

CMP AL, 'a'
JE vowel
CMP AL, 'e'
JE vowel
CMP AL, 'i'
JE vowel
CMP AL, 'o'
JE vowel
CMP AL, 'u'
JE vowel 
CMP AL, 'A'
JE vowel
CMP AL, 'E'
JE vowel
CMP AL, 'I'
JE vowel
CMP AL, 'O'
JE vowel
CMP AL, 'U'
JE vowel

;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done

;consonant er jonno kono checking laagbe na direct print
LEA DX, cmsg
MOV AH, 09H
INT 21H
JMP Done


vowel:
;line break dibo ekta 
MOV DL, 0AH
MOV AH, 2
INT 21h

MOV DL, 13
int 21h
; Line break done

LEA DX, vmsg
MOV AH, 09H
INT 21H
JMP Done
 

;exit to DOS
Done:              
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
