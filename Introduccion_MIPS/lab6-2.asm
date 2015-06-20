# Realice un programa de conversión de temperatura en grados
# Fahrenheit a grados Celsius. Ingresar la temperatura desde el
# teclado e imprimir el resultado con el siguiente mensaje: “La
# temperatura en grados Celsius es: ”

	.data
resultado:
	.asciiz "La temperatura en grados Celsius es: "

const0:
	.double 0.555555555555555555555555555555555555555555556
const1:
	.double 32
	
	.text

main:	 
	li $v0,7		# ingresamos el valor desde el teclado en Fahrenheit
	syscall
	
	la $a2,const1
	l.d $f12,0($a2)		# $f12=32
	sub.d $f12,$f0,$f12	# $f12=$f0-$f12(32)
	
	la $a2,const0
	l.d $f10,0($a2)		# $f10=0.5555555555555555555555555556
	mul.d $f12,$f12,$f10	# $f12=0.5555555555555555555555555556x($f0-$f12(32))
	
	
	li $v0,4		# imprime el mensaje
	la $a0,resultado
	syscall
	
	li $v0,3		# imprime double
	syscall			# imrpime $f12
	
	li $v0,10		# termina el programa
	syscall