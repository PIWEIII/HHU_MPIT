;��ջ�����ڴ洢CX��ǣ����ѭ�����ӳ�ʱ��
STACK SEGMENT
      DW 0,0,0,0,0,0,0,0
STACK ENDS

CODE SEGMENT
ASSUME CS:CODE,SS:STACK
ORG 1000H
START:
  MOV AX,STACK
  MOV SS,AX
  JMP L
;8255A״̬�ֵ�Ϊȫ���
L:
  MOV AL,80H
  MOV DX,0073H
  OUT DX,AL

  
;��ȫ���������ĸ�����������

LL0:
   MOV AL,00000000B
   MOV DX,0072H
   OUT DX,AL
   MOV AL,00000000B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,60000
   LOOP $

;��ȫ��
LL:
   MOV AL,11111111B
   MOV DX,0072H
   OUT DX,AL
   MOV AL,00001111B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,60000
   LOOP $
   
;�������ķ���������ź�ȡ����������ߣ�AL�е����ݲ��̶� 
;DX��ֵȡ���������  
;�ϱ��� ������
L1:
   MOV AL,10011110B
   MOV DX,0072H
   OUT DX,AL
   MOV AL,00000111B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,60000
   CALL DO_LOOP
   MOV AH,0
   
;�ϱ��� ������
L2:MOV AL,01011101B
   MOV DX,0072H
   OUT DX,AL
   MOV AL,00000111B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,6000
   CALL DO_LOOP
   
   MOV AL,11011111B
   MOV DX,0072H
   OUT DX,AL
   ;MOV AL,00001110B
   MOV AL,00000111B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,6000
   CALL DO_LOOP
   
   ; SHINE 3 TIMES
   INC AH
   CMP AH,3
   JNA L2

   ;������ɫ���ϱ���
L3:MOV AL,11110011B
   MOV DX,0072H
   OUT DX,AL
   ;MOV AL,00000011B
   MOV AL,00001100B
   MOV DX,0071H
   OUT DX,AL
   MOV CX,60000
   CALL DO_LOOP
   
   MOV AH,0
   
;�����ƣ��ϱ���
L4:MOV AL,11101011B
   MOV DX,0072H
   OUT DX,AL
   ;MOV AL,00000101B
   MOV AL,00001010B
   MOV DX,0071H
   OUT DX,AL
   CALL DO_LOOP


;�������� �ϱ���
   ;MOV AL,11011111B
   MOV AL,11111011B
   MOV DX,0072H
   OUT DX,AL
   ;MOV AL,00000111B
   MOV AL,00001110B
   MOV DX,0071H
   OUT DX,AL
   CALL DO_LOOP
   ; SHINE 3 TIMES
   INC AH
   CMP AH,3
   JNA L4
   
   JMP L1
   
;ѭ���ӳ���
DO_LOOP PROC NEAR
   PUSH CX
   MOV CX,15
   LOOP $
   POP CX
   LOOP DO_LOOP
   RET
DO_LOOP ENDP
 
CODE ENDS
END START
   
