; find the length of a string

.MODEL SMALL
.DATA    

S DB 'COEP-CSE$' 

.CODE    
MOV AX, @DATA
MOV DS, AX

LEA SI, S
MOV CL, 0

NEXT: MOV AL, [SI]
      CMP AL, '$'
      JE HERE ;DONE
      INC CL
      INC SI
      JMP NEXT
     

HERE: HLT