# Desarrolle un programa que calcule el área de un círculo. Ingrese
# desde el teclado el “radio” y muestre el resultado con el siguiente
# mensaje: “El área del circulo es: ”
	.data
	
resultado:
	.asciiz "El valor del area del circulo seria: "
const0:
	.double 3.14159265358979323846	
	.text

main:	 
	li $v0,7		# ingresamos el valor desde el teclado en Fahrenheit
	syscall

	jal calculo	
	
	li $v0,10		# termina el programa
	syscall
	
calculo:	
	la $a2,const0
	l.d $f10,0($a2)		# $f10=0.5555555555555555555555555556
	mul.d $f12,$f0,$f0
	mul.d $f12,$f12,$f10	# $f12=0.5555555555555555555555555556x($f0-$f12(32))
	
	
	li $v0,4		# imprime el mensaje
	la $a0,resultado
	syscall
	
	li $v0,3		# imprime double
	syscall			# imrpime $f12
	
	li $v0,10		# termina el programa
	syscall
	jr $ra