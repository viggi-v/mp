 AREA LAB3A, CODE , READONLY
 EXPORT ques1
 
ques1
	; Address range 0x40000000,0x4000FFFF

	MOV R1, #0x40000000 
	MOV R2, #3
	STR R2, [R1]
	MOV R2, #4
	STR R2, [R1,#4]
	
	; Loading the data into registers R5,R6
	LDR R5, [R1]
	LDR R6, [R1 , #4]
	
	EOR R5, R5,R6
	EOR R6, R5,R6
	EOR R5, R5,R6
	
	STR R5, [R1]
	STR R6, [R1,#4]
	
	
stop B stop
	END