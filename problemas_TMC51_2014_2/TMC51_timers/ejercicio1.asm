;hacer un timer de 10Hz
;Perido = 100 000
;t/2= 50 000
;x*0.9216= 50000
;x= 54253
;con timer de 16 bits (modo 1)
;65536 - 39410 = 11283 equivale a 2C13 h
;TH = 2C y TL = 13
	org 8000h
	mov TMOD,#01h	;modo 1 de 16 bits
repite:
	mov TH0,#0h
	mov TL0,#01h
	setb TR0	;inicia timer0
	jnb TF0,$
	setb p1.0
	clr TF0
	mov TH0,#0h
	mov TL0,#01h
	setb TR0	;inicia timer0
	jnb TF0,$
	clr p1.0
	clr TF0
	sjmp repite
	end