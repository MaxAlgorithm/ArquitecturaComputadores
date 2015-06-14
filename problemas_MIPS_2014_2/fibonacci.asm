#Programa que imprime los 22 primeros terminos
#de la serie de Fibonacci
#
#a=1, b=1 para n<=2
	.data 
nombre:
	.asciiz "La serie de fibonacci es: "
coma:
	.asciiz ","
primero_serie:
	.byte 1
segundo_serie:
	.byte 1
	
	.text 	
	li $v0,4
	la $a0,nombre
	syscall
	li $v0,1		#servicio para imprimir enteros
	la $t0,primero_serie	#muevo la direccion en $to
	lb $a0,($t0)		#muevo el contenido de la direccion en el registro 
	syscall 
	li $v0,4		#servicio para imprimir caracteres
	la $a0,coma		#muevo a $a0 la direccion	
	syscall
	li $v0,1
	la $t0,segundo_serie
	lb $a0,($t0)
	syscall
	li $t0,1
	li $t1,1
	li $t5,30
	
denuevo:
	li $v0,4		
	la $a0,coma
	syscall
	add $t3,$t0,$t1		#St3 hace las veces de c=a + b
	add $t0,$t1,0		#a=b	$t0 = $t1 + 0
	add $t1,$t3,0		#b=c	$t1 = $t3 + 0
	li $v0,1
	add $a0,$t3,0
	syscall
	subi $t5,$t5,1		#es un Dec R0 del 8051, djnz
	bgtz $t5,denuevo
	
#Salida
	li $v0,10
	syscall