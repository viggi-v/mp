MyDataSize EQU 128
MyNumber   EQU 31
	AREA myData,DATA,NOINIT, READWRITE
myDataStart SPACE MyDataSize

	AREA RESET, CODE, READWRITE
	EXPORT quesFOUR
quesFOUR
	LDR R0, =myDataStart ; Base Address Stored
	
	LDR R1, =MyNumber	 ; Reading the number
	
	MOVS R1, R1,LSR #1
	
	MOV R2, #1
	
	BCS stop
	
	MOV R2, #0xF
		
stop B stop
	END
	