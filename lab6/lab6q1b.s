num1 RN 0
num2 RN 1
prodMSB RN 2
prodLSB RN 3
ans	RN 4
number1 EQU 0xDECADE
number2 EQU 0xBADBAD
	AREA MyData, DATA, READWRITE
MySpace SPACE 0x8
	AREA RESET, CODE, READONLY
	EXPORT RESET_HANDLER
	
	; Signed Multiplication of two 32 bit numbers

RESET_HANDLER
	LDR num1, =number1
	LDR num2, =number2
	LDR ans, =MySpace
	SMULL prodLSB, prodMSB, num1, num2
	STR prodMSB, [ans],#4
	STR prodLSB, [ans]
stop B stop
	END