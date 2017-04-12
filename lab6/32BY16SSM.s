		
		
	AREA Reset, CODE,READONLY
	EXPORT Reset_Handler
	
Reset_Handler
            LDR R0,=0xF
			LDR R1,=0x3
			MOV R4,#4
			RSB R5,R4,#32
			LSL R0,R0,R5
LOOP		
			LSLS R0,R0,#1
			LSL R3,R3,#1
			ADC R3,R3,#0
			CMP R3,R1
			MOV R2,R2, LSL #1
			SUBGE R3,R3,R1
			ADDGE R2,R2, #1
			SUBS  R4,R4,#1
			BNE LOOP
STOP B STOP
			END