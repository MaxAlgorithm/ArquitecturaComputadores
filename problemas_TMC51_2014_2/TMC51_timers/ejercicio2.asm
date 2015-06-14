;parpadear 1 segundo con timer
;1s = 1 000 000 us
;X = 1085069
;65536 
;x/17 = 63828
;65536-63828 = 1708 equivale a 06AC h
	org 8000h
	mov TMOD,#01h
repite:
	mov TH0,#06h
	mov TL0,#0ACh
	setb TR0
	mov R3,#17
loop:
	jnb TF0,$
	clr TF0
	djnz R3,loop
	setb p1.0
	mov TMOD,#01h
	mov TH0,#06h
	mov TL0,#0ACh
	setb TR0
	mov R3,#17
loop2:
	jnb TF0,$
	clr TF0
	djnz R3,loop2
	clr p1.0
	sjmp repite
	end