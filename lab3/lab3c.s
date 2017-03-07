 AREA lab3, CODE, READONLY
 EXPORT compare
 
compare
start
	MOV R1 , #0xFFFFFFFF
	MOV R2 , #0xCBFFFFFF
	
	SUBS R3 , R1 , R2
 
	BPL stop
	
	SUB R3, R2, R1
	
stop b stop
 END