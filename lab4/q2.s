 AREA LAB3A, CODE , READONLY
 EXPORT ques2

BASE RN R0

 ENTRY
ques2
	MOV BASE, #0x40000000
	
	; Address  #0x40000000,0x4000FFFF
	
	MOV R4,#10;
	
	MOV R5, #0x00CE0000;
	
loop
	
	STR R5, [BASE],#4
	MOV R5, R5, ROR #1; 
	SUBS R4, R4, #1
	BNE loop
	
	MOV BASE, #0x40000000
	
	LDM BASE, {R1-R10}
	MOV R4,#10
	
	ADD R1,R1, #0x000000FF;
	ADD R2,R2, #0x000000FF;
	ADD R3,R3, #0x000000FF;
	ADD R4,R4, #0x000000FF;
	ADD R5,R5, #0x000000FF;
	ADD R6,R6, #0x000000FF;
	ADD R7,R7, #0x000000FF;
	ADD R8,R8, #0x000000FF;
	ADD R9,R9, #0x000000FF;
	ADD R10,R10, #0x000000FF;
	
	STM BASE, {R1-R10}
	
stop B stop
	END