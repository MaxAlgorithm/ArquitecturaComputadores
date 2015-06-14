;Frecuencia 25 Hz
;periodo 1/25 = 0.04 s = 40 000 us
;Frecuencia de reloj = 11,0592 MHz

;La mitad del periodo es: 20 000 us

;20 000 x 12/11,0592 = 20 000 x 1,085 = 21 700

;X * 0,9216 = 20 000

; X = 21 700
; 8192 * x = 21 700
; X = 21700 / 8192 = 2.6 = 2 + 0.6
setintvec equ 145h
sndchr equ 148h
delay equ 118h
	org 8000h
	mov TMOD,#20h	;modo 0 del timer 0
			;para que no interfiera con la comunicacion serial
	mov a,#1		;Timer 0 es la fuente de interrupcion
	mov dptr,#IntTimer0	;IntTimer0 es la direccion inicial del ISR
	lcall setintvec		;posibilita tener el ISR enn RAM
	setb TR0		;inicia el timer 0
	setb ET0		;habilita inerrupcion del timer0
	setb EA			;habilita interrupcion global
	mov R6,#2	
repite:
	mov R4,#10
	mov R2,#0
loop:
	mov A,R2
	add A,#30h
	lcall sndchr
	mov A,#0dh
	lcall sndchr
	mov A,#250
	lcall delay
	inc R2
	djnz R4,loop
	sjmp repite
	
IntTimer0:
	djnz R6,sale
	mov R6,#2	;X
	clr TF0
	clr TR0
	mov TH0,#10h
	mov TL0,#0h
	setb TR0
 no_overflow:
 	jnb TF0,no_overflow
 	clr TF0
	cpl P1.0
 sale:
 	clr TF0
	reti
	end