setintvec equ 145h
print equ 136h
	org 8000h
;=================================================================
;	mov TMOD,#0h	;modo 0 del timer 0
;	mov A,#1	;timer 0 es la fuente de la interrupcion
;	mov dptr,#IntTimer0	;IntTimer0 es la direccion inicial del ISR
;	lcall stintvec	;Posibilita tener el ISR en RAM
;	setb TR0	;inicia timer 0
;	setb ET0	;habilita interrupcion del timer 0
;	setb EA		;habilita interrupcion general
;=================================================================
	mov TMOD,#21h	;modo 0 del timer 0
			;para que no interfiera con la comunicacion serial
	mov a,#1		;Timer 0 es la fuente de interrupcion
	mov dptr,#IntTimer0	;IntTimer0 es la direccion inicial del ISR
	lcall setintvec		;posibilita tener el ISR enn RAM
	setb TR0		;inicia el timer 0
	setb ET0		;habilita inerrupcion del timer0
	
	setb IT0	;fija la interrupcion externa sensible en el 
			;flanco de bajada
	setb IT1	;fija la int. ext. 1 en el flanco de bajada
	
	mov A,#0	;fuente de interrupcion externa 0
	mov dptr,#ISR0	;fija dptr con la direccion de inicio
			;de la interrupcion externa 0 para llamar a setintvec
	lcall setintvec	;fija el ISR para INT0
	mov A,#2	;fuente de int. ext. 1
	mov dptr,#ISR1	;fija dptr con la direccion
	lcall setintvec
	setb EX0	;habilita interrupcion externa 0 en el registro IE
	setb EX1
	setb EA
	setb p3.2	;fija el pin p3.2 como entrada boton conectado
	setb p3.3
	setb EA	
;==================================================================
	sjmp $
IntTimer0:
	djnz R6,sale
	mov R6,#17	;X
	clr TF0
	clr TR0
	mov TH0,#06h
	mov TL0,#0ach
	setb TR0
 	jnb TF0,$
 	clr TF0
	cpl P1.0
 sale:
 	clr TF0
	reti
	
ISR0:
	lcall print
	db 0dh,0ah,"me interrumpes Nino rata >:V p3.2",0dh,0ah,0
	reti
ISR1:
	lcall print
	db 0dh,0ah,"me interrumpes p3.3",0dh,0ah,0
	reti
	
	END