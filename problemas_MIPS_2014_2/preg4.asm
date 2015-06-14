	#sum dos numeros 8 y 9
	.data
Resultado:
	.asciiz "El resultado de la suma es \n"
	
	.text
	
	#li $t1,1200
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,5
	syscall
	move $t0,$v0
	
	add $t0,$t0,$t1

#Imprime cadena
	li $v0,4
	la $a0,Resultado
	syscall
	
#imprime el valor del resultado
	li $v0,1
	#li $a0,0
	#add $a0,$a0,$t0	# $a0 = $a0 + $t0
	move $a0,$t0
	syscall

	li $v0,10
	syscall