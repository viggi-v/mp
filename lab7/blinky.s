IO1DIR EQU 	0xE0028018
IO1SET EQU	0xE0028014
IO1CLR EQU 	0xE002801C

	AREA BlinkyTest,CODE,READONLY
	EXPORT blinky
	
blinky	LDR R1,=IO1DIR
		LDR R0,=0x00FF0000
		
		STR R0,[R1]
		
		LDR R2,=IO1SET
		LDR R3,=IO1CLR
		
repeat  LDR R4,=0x10000
next	STR R4,[R2]

		LDR R5,=0xFF0000

delay	SUBS R5,R5,#1
		BNE delay
		
		STR R4,[R3]
		
		;MOV R4,R4,LSL #1
		ADD R4, R4, #0x10000
		CMP R4,#0xFF0000
		BNE	next
		B repeat