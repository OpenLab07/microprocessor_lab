; display a message to console

DATA SEGMENT
	msg DB "Hello World$"
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
	MOV DS,AX
	LEA DX,msg
	MOV AH,09H
	INT 21H
	MOV AH,4CH
	INT 21H
CODE ENDS
END START
