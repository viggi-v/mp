NUMBER EQU 21
MyDataSize EQU 1024
number RN 2
num1   RN 0
num2   RN 1
res	   RN 3
temp   RN 4


	AREA RESET, CODE, READONLY
	EXPORT fibcheck_code
fibcheck_code
	LDR number, =NUMBER
	MOV num1 , #0
	MOV num2 , #1
loop
	MOV num1, num2
	MOV num2, res
	ADD res, num1, num2
	CMP res, number
	ADDEQ R5, R5, #1
	BLO loop
stop b stop
	END