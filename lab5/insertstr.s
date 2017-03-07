substring RN 0
string RN 1
dest RN 2
count RN 4
str_size EQU 1024
str_pos EQU 6
	AREA MyDATA, DATA, READWRITE
str_dst SPACE str_size


	AREA RESET, CODE, READONLY
	EXPORT killspace
	;Inserts the str at the specified position
killspace

		LDR substring, =str_sub
		LDR dest, =str_dst
		LDR string,=str_src
		MOV count,#str_pos
loop
		LDRB R3,[string],#1
		CMP R3,#0
		BEQ loop_to_substr
		STRB R3,[dest],#1
		SUBS count,count,#1
		BNE loop
loop_to_substr
		LDRB R3,[substring],#1
		CMP R3,#0
		BEQ loop_to_resume
		STRB R3,[dest],#1
		B loop_to_substr
loop_to_resume
		LDRB R3,[string],#1
		CMP R3,#0
		BEQ stop
		STRB R3,[dest],#1
		B loop_to_resume
stop b stop
str_src DCB "vi  shnu",0
str_sub DCB "it",0

	END