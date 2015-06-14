	.data
texto:
	.asciiz "Ingrese numero de datos : "	
texto1:
	.asciiz "El Mayor es : "
texto2:
	.asciiz "El Menor es : "
texto3:
	.asciiz "Ingrese numero : "
nuevalinea:
	.asciiz "\n"
	
	.text
	li $v0,4
	la $a0,texto
	syscall
	
	li $v0,5	#se ingresa numero total por teclado
	syscall
	
	move $s0,$v0	#guarda el numero total de numeros
	li $s2,0	# $s2 hace de mayor
	li $s3,10000	# $s3 hace de menor
	li $s4,0	#contador
otravez:
	li $v0,4
	la $a0,texto3
	syscall
	li $v0,5	#ingresa numero por teclado
	syscall
	blt $v0,$s2,continua1
	move $s2,$v0
continua1:
	bgt $v0,$s3,continua2
	move $s3,$v0
continua2:
	addi $s4,$s4,1	#incrementa contador
	blt   $s4,$s0,otravez
#Imprime
	li $v0,4
	la $a0,texto1
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	
	li $v0,4
	la $a0,nuevalinea
	syscall
	
	li $v0,4
	la $a0,texto2
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	li $v0,10
	syscall
	