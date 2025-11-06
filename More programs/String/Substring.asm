; find a substring in a given string

.MODEL SMALL
.DATA

S DB 'COEPCSE$'
CP DB 'CS$'

.CODE

MOV AX, @DATA
MOV DS, AX
MOV ES, AX
     
LEA SI, S
LEA DI, CP

CLD

NEXT: MOV AL, [SI]
      CMP AL, [DI]
      JNZ MOVNXT ; NO MATCH IN S
      
      MOV DX, SI ; ST POS OF S
      MOV BX, DI
CHECK:
      MOV AL, [SI]
      MOV BL, [DI]
      CMP BL, '$'
      JE FD
      CMP AL, BL
      JNZ NOTF
      INC SI ;FIRST MATCH
      INC DI
      JMP CHECK ;CHECK AGN
      
NOTF:  MOV SI, DX
       INC SI
       LEA DI, CP
       JMP NEXT 
                     ; STOSD: [DI] <- AL
                     ; LODSB: AL <- [SI]
MOVNXT:INC SI
      CMP [SI], '$'
      JE STOP
      JMP NEXT     
      
FD: MOV DL, 24H 
STOP: HLT 
