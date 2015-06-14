;menu de frecuencias 2hz,12hz,22hz y 32hz
print equ 136h
getbyt equ 11Eh
	org 8000h
	mov TMOD,#21h
	clr p1.0
	lcall print
	db 0dh,0ah,"MENU:",0dh,0ah
	db "---------------------",0dh,0ah
	db "00. 2hz",0dh,0ah
	db "01. 12hz",0dh,0ah
	db "02. 22hz",0dh,0ah
	db "03. 32hz",0dh,0ah
	;db "Seleccione",0dh,0ah,0
	;lcall getbyt	;seleccionamos
	;cjne A,#0,dos_HZ
	;cjne A,#1,doce_HZ
	;cjne A,#2,veintidos_HZ
	;cjne A,#3,treintaidos_HZ
	;lcall print
	db 0dh,0ah,"Adios",0dh,0ah,0
	;ljmp 2f0h	
	
dos_HZ:
	mov R5,4
	mov TH0,#2ch
	mov TL0,#13h
	setb TR0
loop1:
	jnb TF0,$
	clr TF0
	djnz R5,loop1
	cpl p1.0
	sjmp dos_HZ
	
;doce_HZ:
;	mov TH0,#4fh
;	mov TL0,#65h
;	jnb TF0,$
;	clr TF0
;	cpl p1.0
;	sjmp doce_HZ
	
;veintidos_HZ:
;	mov TH0,#9fh
;	mov TL0,#0abh
;	jnb TF0,$
;	clr TF0
;	cpl p1.0
;	sjmp veintidos_HZ
;	
;treintaidos_HZ:
;	mov TH0,#0bdh
;	mov TL0,#0c6h
;	jnb TF0,$
;	clr TF0
;	cpl p1.0
;	sjmp treintaidos_HZ
;	
	end