NUMBER EQU 25
MyDataSize EQU 1024
number RN 2
num1   RN 0
num2   RN 1
res	   RN 3
temp   RN 4

	; Generates Fib Series
	AREA RESET, CODE, READONLY
	EXPORT reset
reset
	LDR number, =NUMBER
	MOV num1 , #0
	MOV num2 , #1
loop
	MOV res, temp
	MOV num1, num2
	MOV num2, res
	ADD temp, num1, num2
	CMP temp, number
	BLO loop
stop b stop
	END