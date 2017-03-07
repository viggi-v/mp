 AREA MyFirst, CODE, READONLY
 EXPORT lab2c
 
lab2c
start
	MOV  R1 , #7;
	MOV  R2 , #9;
	
	TSTS R1 , R2;
	TEQS  R1 , R2;
	RSB   R3 , R1 , R2;
	RSC   R4 , R1 , R2;
	MOV   R5 , R1 , ROR #1;
    MOV   R6 , R1 , RRX ;
	MOV  R1 , #3;
	MOV  R2 , #3;
	ORR  R10 , R2 , R1;
	AND  R11 , R2 ,R1;
	EOR  R12 ,R2 , R1;
	BIC  R13 ,R2 ,R1;
stop b stop
 END