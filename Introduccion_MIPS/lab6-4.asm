# Hacer un programa que compare el número ingresado por el
# teclado con un número por ejemplo 2500.1234. Muestre el
# resultado: “El número ingresado es igual a 2500.1234” o “El
# número ingresado no es igual a 2500.1234”.
	.data
msg:
	.asciiz "Ingrese un numero: "
string1:
	.asciiz "El numero ingresado "
string2:
	.asciiz " mayor que "
string3:
	.asciiz " igual a "
string4:
	.asciiz " menor que "
const:
	.double 2500.1234
	.text
main:
	l.d $f2,const		# es el numero que voy a comparar
	
	li $v0,4
	la $a0,msg
	syscall

	li $v0,7
	syscall
	
	li $v0,4		# imprimo el mensaje que dice; el numero ingresado es:
	la $a0,string1
	syscall
	
	li $v0,3		# imprimo el valro del numero ingresado
	mov.d $f12,$f0
	syscall
	
	li $v0,4
	
	c.lt.d $f0,$f2
	bc1t less
	c.eq.d $f0,$f2
	bc1t equal
greater:
	la $a0,string2
	b last
equal:
	la $a0,string3
	b last
less:
	la $a0,string4
	
last:
	syscall
	
	li  $v0,3
	mov.d $f12,$f2
	syscall
	
	li $v0,10
	syscall			#termino del programa