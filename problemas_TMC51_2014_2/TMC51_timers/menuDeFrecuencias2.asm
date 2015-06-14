;Selecciona frecuencias diferentes para generar
;como 2 hertz, 12 hertz, 22 hertz y 32 hertz.
;32Hz:
;Perido 1/32 s = 0.032 s = 31 250 us
;Mitad del periodo:
;15 625 us
;X * 0.9216 = 15 525
;X = 16 954
;65 536 - 16 954 = 48 582
;48 582 equivale a:
;		   0BDC6h

print   equ 136h
getbyt  equ 11Eh
sndchr  equ 148h
	org 8000h
	mov   TMOD, #21h    ;
otra:
	clr TR0
	lcall     print   ;PRINT es una subrutina grabado en el FLASH ROM
                            ;se usa para imprimir mensajes en el terminal.
          db        0dh,0ah," M E N U  D E  F R E C U E N C I A S"
          db        0dh,0ah,"====================================",0dh,0ah
          db        0dh,0ah," HECHO POR: Cesar Martin Cruz Salazar",0dh,0ah
          db        0dh,0ah," 00)  2 hertz"
          db        0dh,0ah," 01) 10 hertz"
          db        0dh,0ah," 02) 22 hertz"          
          db        0dh,0ah," 03) 32 hertz"     
          db        0dh,0ah," Seleccione una de las opciones, ingresando o 00 o 01 o 02 o 03 : ",0
	lcall     getbyt
	cjne A,#0,otraFrec0
	
cinco_Hertz:
	mov R7,#0
	lcall print
	db 0dh,0ah,"Seleccionado: 5 Hertz",0dh,0ah,0
repite0:
	mov TH0,#0h 
 	mov TL0,#0h
 	setb TR0 ;arranca el timer 0
no_overflow0:
        jnb P3.2,sale0
        jnb P3.3,termina0
 	jnb TF0,no_overflow0
 	clr TF0
 	mov TH0,#60h 
 	mov TL0,#54h
no_overflow0_:
        jnb P3.2,sale0
        jnb P3.3,termina0
 	jnb TF0,no_overflow0_	
 	clr TR0	;detiene el timer 0
 	cpl P1.0 ;se genera 5 hz
 	inc R7
 	jnb P1.0,bajo
 	mov A,R7
 	cjne A,#20,va
 	sjmp regresa
va:
 	lcall print
 	db "--",0
 	sjmp salta
otraFrec0:
	sjmp otraFrec00
bajo:
	mov A,R7
	cjne A,#20,va1
	sjmp regresa
va1:
	lcall print
	db "__",0
	sjmp salta
regresa:
	mov R7,#0
	mov A,#0dh
	lcall sndchr
salta:	
 	clr TF0
	sjmp repite0
termina0:
	lcall print
	db 0dh,0Ah,"TERMINA. HASTA PRONTO.",0
	setb P1.0
	ljmp 2f0h
sale0:
	ljmp sale
otraFrec00:
	cjne A,#1,otraFrec
Diez_Hertz:
	lcall print
	db 0dh,0ah,"Seleccionado: 10 Hertz",0dh,0ah,0
	mov TH0,#3Ch ;inicializa el timer 1 con “3CB0” 
	mov TL0,#0B0h ;
repite1:
 	setb TR0 ;arranca el timer 0
no_overflow1:
        jnb P3.2,sale1
        jnb P3.3,termina1
 	jnb TF0,no_overflow1
 	clr TR0
 	cpl P1.0 ;se genera 10 hz
 	jnb P1.0,bajo1
 	lcall print
 	db "--",0
 	sjmp salta1
bajo1:
	lcall print
	db "__",0
salta1:	
 	clr TF0
 	mov TH0,#3Ch 
 	mov TL0,#0B0h
	sjmp repite1
termina1:
	lcall print
	db 0dh,0Ah,"TERMINA. HASTA PRONTO.",0
	setb P1.0
	ljmp 2f0h
sale1:
	ljmp sale
otraFrec:
        cjne A,#2,otraFrec2
Veintidos_Hertz:
	lcall print
	db 0dh,0ah,"Seleccionado: 15 Hertz",0dh,0ah,0
	mov TH0,#0AEh ;inicializa el timer 1 con “AE2D”
	mov TL0,#2Dh ;
repite2:
 	setb TR0 ;arranca el timer 0
no_overflow2:
	jnb P3.2,sale2
	jnb P3.3,termina2
 	jnb TF0,no_overflow2
 	clr TR0
 	cpl P1.0 ;se genera 15 hz
 	jnb P1.0,bajo2
 	lcall print
 	db "--",0
 	sjmp salta2
bajo2:
	lcall print
	db "__",0
salta2:	
 	clr TF0
 	mov TH0,#87h 
 	mov TL0,#0FEh
 	sjmp repite2
termina2:
	lcall print
	db 0dh,0Ah,"TERMINA. HASTA PRONTO.",0
	setb P1.0
	ljmp 2f0h
sale2:
	ljmp sale
otraFrec2:
	cjne A,#3,sale
TreintaYDos_Hertz:
	lcall print
	db 0dh,0ah,"Seleccionado: 20 Hertz",0dh,0ah,0
	mov TH0,#0BDh ;inicializa el timer 1 con “A5FE” 
	mov TL0,#0C6h ;
repite3:
 	setb TR0 ;arranca el timer 0
no_overflow3:
	jnb P3.2,sale
	jnb P3.3,termina3
 	jnb TF0,no_overflow3
 	clr TR0
 	cpl P1.0 ;se genera 32 hz
 	jnb P1.0,bajo3
 	lcall print
 	db "--",0
 	sjmp salta3
bajo3:
	lcall print
	db "__",0
salta3:	
 	clr TF0
 	mov TH0,#0BDh 
 	mov TL0,#0C6h
 	sjmp repite3
termina3:
	lcall print
	db 0dh,0Ah,"TERMINA. HASTA PRONTO.",0
	setb P1.0
	ljmp 2f0h
sale:
	ljmp otra
 	end