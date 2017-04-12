
mydatasize EQU 1024
		AREA MyData, DATA,NOINIT,READWRITE
mydatastart SPACE mydatasize
	    AREA Reset, CODE,READONLY
	    EXPORT Reset_Handler


Reset_Handler
		LDR R0,=mydatastart
		LDR R1,[R0]
		LDR R2,[R0,#4]
		LDR R3,[R0,#8]
		MOV R4,#0
		
LOOP
	MOV R5,#0
	CMP R3,#0
	ADDGT R5,R5,#1
	CMP R2,R1
	ADDHS R5,R5,#1
	CMP R5,#0
	BEQ CLOSE
	SUBS R2,R2,R1
	SBC R3,R3,#0
	ADD R4,R4,#1
	BAL LOOP
	
CLOSE
	STR R4,[R0,#12]
	STR R2,[R0,#16]
STOP B STOP
		END
	
	
	