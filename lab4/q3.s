 AREA LAB3A, CODE , READONLY
 EXPORT ques3
ques3
	MOV R4,#7;
	MOV R5, #0x00B80000;
	MOV R0, #0x40000000
loop	
	STR R5, [R0],#4
	MOV R5, R5, ROR #1; 
	SUBS R4, R4, #1
	BNE loop
		MOV R0, #0x40000000
		MOV R1, #0x00CD0000
		MOV R2, #0x0000BB00
		MOV R3, #0x00000077
		MOV R4, #0xFD000000
		MOV R5, #0x00860000
		MOV R6, #0x00000340
		MOV R7, #0x01200000
	MOV R0, #0x40000000
		SWP R1,R1,[R0]
		ADD R0,R0,#4
		SWP R2,R2,[R0]	
		ADD R0,R0,#4
		SWP R3,R3,[R0]
		ADD R0,R0,#4;
		SWP R4,R4,[R0]
		ADD R0,R0,#4;
		SWP R5,R5,[R0]
		ADD R0,R0,#4;	
		SWP R6,R6,[R0]
		ADD R0,R0,#4;
		SWP R7,R7,[R0]
STOP B STOP
		END