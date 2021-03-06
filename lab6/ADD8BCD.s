

	AREA Reset, CODE,READONLY
	EXPORT Reset_Handler
	
Reset_Handler
		LDR R0,N1
		LDR R1,N2
		
LOOP
	AND R2,R0,#0xF
	AND R3,R1,#0xF
	LSR R0,R0,#4
	LSR R1,R1,#4
	MOV R4,#0
	MOV R5,#0
	ADD R4,R2,R3
	CMP R4,#9
	ADDGTS R4,R4,#6
	AND R5,R4,#0xF0
	AND R4,R4,#0xF
	ADD R0,R0,R5, LSR #4
	ADD R6,R6,R4, LSL R7
	ADD R7,R7,#4
	CMP R0,#0
	CMPEQ R1,#0
	BNE LOOP
STOP B STOP

N1 DCD 0x46847777
N2 DCD 0x35219876
	END