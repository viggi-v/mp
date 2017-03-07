 AREA lab3, CODE, READONLY
 EXPORT rotate
 
rotate
start
	MOV R1,#0x0000CB00 ;MSB
	MOV R2,#0x00AB0000 ;LSB
	MOV R3,#19  ;Shift count
	MOV R4,#1
loop	
	MOVS R1, R1, ASR #1
    MOV R2 , R2 ,RRX;  R2, R4
	
	SUBS R3,#1
	BNE loop
stop B stop
 END