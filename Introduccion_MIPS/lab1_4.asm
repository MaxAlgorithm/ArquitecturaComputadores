	.data
cadena: .asciiz "El resultado es :"
cadena1:.asciiz "Ingrese el numero 1 :"
cadena2:.asciiz "Ingrese el numero 2 :"

	.text
	
	li $v0,4
	la $a0,cadena1
	syscall
	li $v0,5
	syscall	
	move $t0,$v0 	#recupera el valor ingresado en $t0
			
	li $v0,4
	la $a0,cadena2
	syscall				
	li $v0,5
	syscall
	move $t1,$v0	#recupera el valor ingresado en $t0
	
	add $t2,$t0,$t1	#calcula la suma
	
	li $v0,4
	la $a0,cadena
	syscall
	
	
	li $v0,1
	move $a0,$t2
	syscall

#codigo 10 en syscall para terminar y salir
	li $v0,10
	syscall
		