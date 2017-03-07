str_size EQU 1024
string RN 0
dest RN 1


	AREA RESET, CODE, READONLY
	EXPORT remove_space
	;Removes blank spaces in a str
remove_space
	LDR string, =str_src
	LDR dest, =str_dst
loop
	LDRB R2,[string],#1;
	CMP R2,#0x20
	BEQ loop
	STRB R2,[dest],#1	
	B loop
stop b stop
str_src DCB "a bb c",0
	
	AREA MyDATA, DATA, READWRITE
str_dst SPACE str_size	
	END
