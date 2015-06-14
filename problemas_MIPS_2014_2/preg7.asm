	.data
	
texto:
	.asciiz "La cantidad de vocales es : "
frase:
	.asciiz "long time ago in a galaxy far away"
nueva_linea:
	.asciiz "\n"
	
	.text
	
	la $a0,frase
	li $s0,0		#contador de vocales
	move $s1,$a0		#direccion de la cadena
siguiente_caracter:
	lb $a0,($s1)		#consigo cada caracter de la cadena
	beqz $a0,Termina	#si $a0 = 0,salta a Termina
	li $t0,0
	beq $a0,'a',Si_es_vocal
	beq $a0,'e',Si_es_vocal
	beq $a0,'i',Si_es_vocal
	beq $a0,'o',Si_es_vocal
	beq $a0,'u',Si_es_vocal	
	b sale
	
Si_es_vocal:
	li $t0,1
sale:
	add $s0,$s0,$t0		#incrementa el contador
	add $s1,$s1,1		#se mueve a lo largo de la cadena
	b siguiente_caracter

Termina:
	li $v0,4
	la $a0,texto
	syscall
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,10
	syscall
