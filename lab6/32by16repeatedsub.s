
		AREA RESET, CODE,READONLY
		EXPORT Reset_Handler
Reset_Handler
         LDR R0,=0xFFFFFFFF
		 LDR R1,=0xFFFD
LOOP
	SUBCS R0,R0,R1
	CMP R0,#0
	ADDCS R2,R2,#1
	BCS LOOP
STOP B STOP
         END
		 