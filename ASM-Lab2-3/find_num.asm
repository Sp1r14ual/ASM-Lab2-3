.386
.MODEL FLAT
.DATA
BUF  dd ? ; ��������� �� �������� ������ 
BUF2 dd ? ; ��������� �� ������
NLEN dd ? ; ����� ���������
SYM DD ? ; ��� ������ ������ �� ������� ������ �����

.CODE
@find_num@12 PROC ; ���������� fastcall
PUSH EBP ; ������� ebp � ����
MOV EBP, ESP

;�.�. fastcall, �� �������� ���������� ����� ecx � edx, ��������� ��������� ����� ����(nlen = [ebp] + 8)
MOV BUF,EDX ; ��������� �� �������� ������
MOV BUF2,ECX ; ��������� �� ������
MOV EAX, [EBP]+8
MOV NLEN, EAX ; ����� ���������

CLD ; DF = 0, ���� � ������ �����������

MOV ESI, BUF
LODSB [ESI] ; �� ������� buf �������� ������� � eax (lods �������� ������ � esi, � edi �� ��������)
MOV SYM, EAX ; ������ �� ������� ������ �����
MOV ECX, NLEN ; � ������� ����� ������
MOV ESI, BUF2 ; � esi ��������� �� ��������� ������
MOV EDI, BUF ; � edi ��������� �� ����� ������, ��� �����=�������� ������
START:
	
	LODSB [ESI] ; ��������� � eax ������ �� ��������� ������
	STOSB [EDI] ; �������� ���� ������ � ����� ������ (stoss �������� ������ � edi, � esi �� ��������)
	; ������� ���� ������ ����� ��� ���
	CMP EAX, 47 ; 48 - ascii ��� 0, 57 - 9
	JA NEXT
	JMP EXIT
	NEXT:
	CMP EAX, 58
	JAE EXIT
	MOV EAX, SYM ; ���� �����, �� ������ �� ��������� �������
	DEC EDI
	STOSB [EDI]
	EXIT:
LOOP START ; ���� �������� ���� ������� ecx > 0

POP EBP ; ���������� �������� �� �����
RET 4 ; ������� � ����� ������ �������, �������� 4, �.�. ����� ���� 1 �������� �������
@find_num@12 ENDP
END
