substring RN 0
string RN 1
str_size EQU 1024

	AREA MyDATA, DATA, READWRITE
str_dst SPACE str_size

	AREA RESET, CODE, READONLY
	EXPORT substr

substr
	; Check for substring occurrence
	; Sets R8 as 1 if found
	LDR string, =str_src
outerloop
		LDR substring, =str_sub
		LDRB R3, [substring],#1;
		LDRB R4, [string],#1;
		CMP R4,#0
		BEQ stop;
		CMP R3,R4
		BNE outerloop
innerloop
		LDRB R3, [substring],#1
		LDRB R4, [string],#1;
		CMP R3,#0
		BEQ found
		CMP R3,R4
		BEQ innerloop
		BNE outerloop
found
		MOV R8,#1
	
stop b stop
str_src DCB "harshitha",0
str_sub DCB "shit",0
	END