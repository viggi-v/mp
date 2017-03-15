num1MSB RN 0
num1LSB RN 1
num2MSB RN 2
num2LSB RN 3

ansByte3 RN 4
ansByte2 RN 5
ansByte1 RN 6
ansByte0 RN 7

loc RN 8

number1msb EQU 0x0
number1lsb EQU 0x1000
number2msb EQU 0xABABABAB
number2lsb EQU 0xABABABAB
	AREA MyData, DATA, READWRITE
MySpace SPACE 0x128
	AREA RESET, CODE, READONLY
	EXPORT RESET_HANDLER
	; Unsigned Multiplication of two 64 bit numbers
RESET_HANDLER
	
	LDR num1MSB, =number1msb
	LDR num1LSB, =number1lsb
	LDR num2MSB, =number2msb
	LDR num2LSB, =number2lsb
	
	LDR loc , =MySpace
	
	UMULL ansByte0, ansByte1, num1LSB, num2LSB
	
	UMLAL ansByte1, ansByte2, num1LSB, num2MSB
	
	UMLAL ansByte1, ansByte2, num2LSB, num1MSB
	
	UMLAL ansByte2, ansByte3, num1MSB, num2MSB
	
	
	STR ansByte3, [loc],#4
	STR ansByte2, [loc],#4
	STR ansByte1, [loc],#4
	STR ansByte0, [loc]
stop B stop
	END