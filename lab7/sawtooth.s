PINSEL1   EQU 0xE002C004
DACR 	  EQU 0xE006C000
setDAC_OP EQU 0x00080000

	AREA vishnu, CODE, READONLY
	EXPORT sawtooth

sawtooth

; Configure DAC

	LDR R2, =DACR
	LDR R4, =setDAC_OP
	LDR R6, =PINSEL1
	LDR R5, [R6]
	ORR R5, R4, R5
	STR R5, [R6]
	
reset_val
	LDR R0, =0xFFC0
descend
	STR R0, [R2]
	SUB R0, R0, #1
	CMP R0, #0x3F
	BEQ reset_val
	B descend
	END