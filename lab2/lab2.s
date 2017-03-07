 AREA MyFirst, CODE, READONLY
 EXPORT Reset_Handler
 
Reset_Handler
start
	;ADD two 64 bit numbers
	MOV R1,#0x00000004; MSB |
	MOV R2,#0x90000009; LSB | Number 1
	
	MOV R3,#0x00000001; MSB |
	MOV R4,#0x80000008; LSB | Number 2
	
	;The addition
	
	ADDS  R6, R2, R4; Result | LSB of SUM
	ADCS  R5, R3, R1;

	
stop b stop
 END