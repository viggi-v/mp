Number EQU 0xABCDEFAB

num    RN 0
looper RN 1
answer RN 2
temp   RN 3

	AREA reverse, CODE, READONLY
	EXPORT reverse_code
	
reverse_code
	LDR num, =Number
	MOV looper, #8
loop
	AND temp, num, #0x0000000F
	MOV answer, answer, LSL #4
	ORR answer, answer, temp
	MOV num, num , LSR #4
	SUBS looper, looper, #1
	BNE loop
	
stop B stop
	END