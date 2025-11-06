; check if a string is palindrome or not

.MODEL SMALL
.DATA    

S DB 'RACECAR$' 

.CODE    
MOV AX, @DATA
MOV DS, AX

LEA SI, S
MOV CX, 00H

NEXT: MOV AL, [SI]
      CMP AL, '$'
      JE HERE ;FOUND LEN
      INC CX
      INC SI
      JMP NEXT
     

HERE: MOV BX, CX
      DEC BX ; LAST IND
 
      LEA SI, S
      LEA DI, S ; OR LEA DI, SI
      ADD DI, BX ; GO TO LAST (USING LENGTH)
      
           
CHK: CMP SI, DI
     JAE FND ; if SI>DI all characters matched = PALINDROME
     
     MOV AL, [SI]
     MOV BL, [DI]
     CMP AL, BL
     JNZ NOPE ;NOT PALINDROME 
     
     INC SI
     DEC DI
     JMP CHK

FND:  MOV AX, 2424H 
      HLT
NOPE: MOV AX, 1234H
      HLT
