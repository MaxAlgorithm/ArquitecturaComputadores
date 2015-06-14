	.data
arreglo:
	.byte 53,9,77,66,12,115,18,26,44,14,19,78,8,12,13
texto1:
	.asciiz "El Mayor es : "
texto2:
	.asciiz "El Menor es : "
nuevalinea:
	.asciiz "\n"
	
	.text
	
	la  $a0,arreglo
	move $s1,$a0	#guarda la direccion del array
	li $s2,0	# $s2 hace de mayor
	li $s3,10000	# $s3 hace de menor
	li $s4,0	#contador
otravez:
	lb $a0,($s1)	#carga un numero del array
	blt $a0,$s2,continua1
	move $s2,$a0
continua1:
	bgt $a0,$s3,continua2
	move $s3,$a0
continua2:
	addi $s4,$s4,1	#incrementa contador
	addi $s1,$s1,1	#se mueve en el arreglo
	ble  $s4,15,otravez
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
	