PINSEL1   EQU 0xE002C004
DACR 	  EQU 0xE006C000
setDAC_OP EQU 0x00080000

lookUpTable RN 3
temp RN 11
cycle RN 1

	AREA viggi, CODE, READONLY
	EXPORT sine
sine

; Configure DAC
	LDR lookUpTable, sineValues
	LDR R2, =DACR
	LDR R4, =setDAC_OP
	LDR R6, =PINSEL1
	LDR R5, [R6]
	ORR R5, R4, R5
	STR R5, [R6]
	LDR R0, =0xFFC0
	MOV cycle, #0x1 ; 1  means positive cycle
reset_data
	ADD R9, R9, #1;
	LDR lookUpTable, =sineValues
	CMP cycle, #0x1
	MOVEQ cycle, #0x0
	MOVNE cycle, #0x1
sine_cycle
	
	LDR temp, [lookUpTable], #4
	CMP cycle, #0x1
	ADDEQ temp, temp, #0x200
	RSBNE temp, temp, #0x200
	MOV temp, temp ,LSL #6
	STR temp, [R2]
	
	LDR R10, =0x8000

delay1
	SUBS R10, R10, #1
	BNE delay1
	
	
	CMP temp,#0x8000
	BEQ reset_data
	B sine_cycle
	
sineValues DCD 158, 301, 414, 487, 511, 487, 414, 301, 158, 0

	END
	