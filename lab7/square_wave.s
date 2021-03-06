PINSEL1   EQU 0xE002C004
DACR 	  EQU 0xE006C000
setDAC_OP EQU 0x00080000

	AREA OMG, CODE, READONLY
	EXPORT sq_wave
	
sq_wave
	
	LDR R2, =DACR
	LDR R4, =setDAC_OP
	LDR R6, =PINSEL1
	LDR R5, [R6]
	ORR R5, R4, R5
	STR R5, [R6]
	
	; Configure DAC
	
up
	MOV R0, #0
	STR R0, [R2]
	LDR R10, =0x8000

delay1
	SUBS R10, R10, #1
	BNE delay1
		
	LDR R0, =0xFFC0
	STR R0, [R2]
	LDR R10, =0x8000
	
delay2
	SUBS R10, R10, #1
	BNE delay2
	
	B up
	
	END;
