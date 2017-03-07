 AREA lab3, CODE, READONLY
 EXPORT count_of_ones
 
count_of_ones
start
	MOV R0 , #0xFFFFFFFF
	
loop
	MOVS R0, R0,LSL #1
	ADC R4,R4,#0
	BNE loop
	
stop B stop
 END