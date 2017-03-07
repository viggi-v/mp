
; The number of occurence of a digit in a number


MyDataSize EQU 128
Number     EQU 0xFFAABBAA
Digit	   EQU 0xA

num	  RN 0
dig   RN 1
count RN 2 
temp  RN 3
looper RN 4

	AREA what,CODE, READONLY
	EXPORT quesFOURB
	
quesFOURB
	
	LDR num ,=Number	; Number is moved
	LDR dig ,=Digit		; Digit 
	MOV looper, #8
loop
	AND temp , num , #0x0000000F
	SUBS temp , temp , dig
	ADDEQ count, count,#1
	MOV num, num,LSR #4
	SUBS looper, looper, #1
	BNE loop
stop B stop
	END