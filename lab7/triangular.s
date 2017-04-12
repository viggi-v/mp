PINSEL1   EQU 0xE002C004
DACR 	  EQU 0xE006C000
setDAC_OP EQU 0x00080000

direction RN 1
max		  RN 10
	AREA vishal, CODE, READONLY
	EXPORT triangular

triangular

; Configure DAC

	LDR R2, =DACR
	LDR R4, =setDAC_OP
	LDR R6, =PINSEL1
	LDR R5, [R6]
	ORR R5, R4, R5
	STR R5, [R6]
	LDR R0, =0xFFC0
	LDR max, =0xFFC0
go_down
	LDR direction, =0xFFFFFFFF
	B descend
go_up
	LDR direction, =0x1
descend
	STR R0, [R2]
	ADD R0, R0, direction
	CMP R0, #0x3F
	BEQ go_up
	CMP R0, max
	BEQ go_down
	B descend
	END