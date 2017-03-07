 AREA lab3, CODE, READONLY
 EXPORT subtract_signed
 
subtract_signed
	;	Any negative number is converted into 2's complement
	
	MOV R8,#0xFFFFFFFF;
	MOV R9,#0x7FFFFFFF;
	
	MOV    R2 , #3			 ; Number 1 LSB
	MOVS   R1 , #0x00000000  ; Number 1 MSB
	
	
	
	BPL no_conversion_needed

	EOR  R2 ,  R8            ; Complement
	EOR  R1 ,  R9            ; Complement
	
	ADDS R2 , R2 , #1
	ADCS R1 , R2 , #0 

no_conversion_needed

	MOV    R4 , #4          ; Number 2 LSB
	MOVS   R3 , #0x80000000 ; Number 2 MSB
	
	BPL no_conversion_needed_2
	
	EOR  R4 , R8 ; Complement
	EOR  R3 , R9 ; Complement
	
	ADDS R4 , R4 , #1
	ADCS R3 , R3 , #0
	
	
no_conversion_needed_2
	; Addition
	SUBS   R6 , R2 , R4 ; Result LSB
	SBCS   R5 , R1 , R3 ; Result MSB
	
	BPL stop
	
	SUBS R6 , R6 , #1
	SBCS R5 , R5 , #0
	
	EOR  R6 , R8 ; Complement
	EOR  R5 , R9 ; Complement
	
	
	
stop b stop
 END