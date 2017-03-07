 AREA MyFirst, CODE, READONLY
 EXPORT lab2b
 
lab2b
start
	; two 64 bit numbers
	MOV R1,#0x00000004; MSB |
	MOV R2,#0x90000009; LSB | Number 1
	
	MOV R3,#0x00000001; MSB |
	MOV R4,#0x80000009; LSB | Number 2
	
	;The SUB
	
	SUBS  R6, R4, R2; Result |
	SBC   R5, R1, R3;
STOP B STOP
 END