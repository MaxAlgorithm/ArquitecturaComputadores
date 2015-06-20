# Desarrolle un programa de suma de dos números 84129.1085 +
# 41566.1894. Ingresar los dos números desde el teclado e
# imprimir el resultado con el siguiente mensaje: “El resultado de
# la suma de punto flotante es: ”

	.data
resultado:
	.asciiz "El resultado de la suma de putno flotante es: "
	.text
main:
	li $v0,7
	syscall
	add.d $f12,$f12,$f0	# el valor 1
	
	li $v0,7
	syscall
	add.d $f12,$f12,$f0	# el valor 2
	
	li $v0,4		# imprime el mensaje
	la $a0,resultado
	syscall
	
	li $v0,3		# imprime double
	syscall			# imrpime $f12
	
	li $v0,10		# termina el programa
	syscall
	
		