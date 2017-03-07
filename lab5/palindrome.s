
str_size EQU 1024

	AREA MyDATA, DATA, READWRITE
MyStack SPACE str_size
str_dst SPACE str_size


	AREA RESET, CODE, READONLY
	EXPORT str_rev
	
	;  Checks if the given string is palindrome or not,
	;  And sets R3 as 1 if it is not palindrome, 2 if otherwise.
	
str_rev
	
	LDR R0, =str_src;
	LDR R8, =MyStack
loop
	LDRB R1, [R0],#1
	STRB R1, [R8],#1;
	CMP R1, #0
	BNE loop
	; Done copying
	; pop till the end and check if we get an error
	;SUB R0, R0, #2
	LDR R0, =str_src;
	SUB R8, R8, #2
loop2
	LDRB R1, [R0],#1;
	LDRB R2, [R8],#-1;
	CMP R2, #0
	BEQ palindrome
	CMP R1,R2
	BNE not_palindrome
	B loop2
not_palindrome
	MOV R3, #1
	b stop
palindrome
	MOV R3, #2	
stop b stop
str_src DCB "a",0

	END
