ini:	Mov p0,#00h
	Mov P1,#0ffh
	mov p3,#00h
	mov r2,#00h
	mov r3,#00h
alem:   MOV A,r1
ali:	clr c
	da a
	mov r1,a
	mov p2,a
	inc a
	lcall atr10ms
A4:   	jnb p1.0,A4
	cjne a,#5ah,ali
	mov r1,#00h
	mov P2,r1
	inc r2
	Mov a,r2
	clr c
	da a
	mov r2,a
	mov P0,r2
	
	cjne a,#60h,alem
	
	mov r2,#00h
	mov P0,r2
	inc r3
	Mov a,r3
	clr c
	da a
	mov r3,a
	mov P3,r3
	cjne a,#03h,alem
fica:	jb p1.7,fica
cont:	jnb p1.7,cont
	ljmp ini


atr10ms: 
VALOR EQU 10000
MSB EQU ((65536 - VALOR) / 256)
LSB EQU ((65536 - VALOR) & 0FFH)
    MOV TMOD, #01h
    SETB TR0
A0: MOV TH0 , #MSB
    MOV TL0 , #LSB
A1: JNB TF0 , A1
    CLR TR0
    CLR TF0
    RET

        END
