num1MSB  RN 0
num1LSB  RN 1
num2MSB  RN 2
num2LSB  RN 3

ansByte3 RN 4
ansByte2 RN 5
ansByte1 RN 6
ansByte0 RN 7

loc  RN  8
temp RN  9
flag RN 10

number1msb EQU 0x0
number1lsb EQU 0x1
number2msb EQU 0x80000000
number2lsb EQU 0xF
	AREA MyData, DATA, READWRITE
MySpace SPACE 0x128
	AREA RESET, CODE, READONLY
	EXPORT signed_multiply
	; Signed Multiplication of two 64 bit numbers
signed_multiply

	LDR num1MSB, =number1msb
	LDR num1LSB, =number1lsb
	LDR num2MSB, =number2msb
	LDR num2LSB, =number2lsb
	
	LDR loc , =MySpace
	
	
	MOVS   temp    , num1MSB
	EORMI  flag    , flag    , #0x1
	MVNMI  num1LSB , num1LSB
	MVNMI  num1MSB , num1MSB
	ADDMIS num1LSB , num1LSB  , #1
	ADC    num1MSB , num1MSB  , #0
	
	MOVS   temp    , num2MSB
	EORMI  flag    , flag    , #0x1
	MVNMI  num2LSB , num2LSB
	MVNMI  num2MSB , num2MSB
	ADDMIS num2LSB , num2LSB , #1
	ADC    num2MSB , num2MSB , #0
	
		
	UMULL ansByte0, ansByte1, num1LSB, num2LSB
	
	
	
	;SMLALMI ansByte1, ansByte2, num1LSB, num2MSB
	UMLAL ansByte1, ansByte2, num1LSB, num2MSB
	
	;MOVS temp, num1MSB
	
	;SMLALMI ansByte1, ansByte2, num2LSB, num1MSB
	UMLAL ansByte1, ansByte2, num2LSB, num1MSB
	
	UMLAL ansByte2, ansByte3, num1MSB, num2MSB
	
	CMP flag,#0
	;2's if not equal
	
	SUBNES ansByte0 , ansByte0 , #1
	SBCS   ansByte1 , ansByte1 , #0
	SBCS   ansByte2 , ansByte2 , #0
	SBCS   ansByte3 , ansByte3 , #0
	
	CMP flag,#0
	
	MVNNE ansByte0, ansByte0
	MVNNE ansByte1, ansByte1
	MVNNE ansByte2, ansByte2
	MVNNE ansByte3, ansByte3
	
	STR ansByte3, [loc],#4
	STR ansByte2, [loc],#4
	STR ansByte1, [loc],#4
	STR ansByte0, [loc]
stop B stop
	END