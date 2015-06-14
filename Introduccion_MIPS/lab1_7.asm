#desarrollar un programa que cuente las vocales de la cadena siguiente
#long time ago in a galaxy far away

	.data
texto:	.asciiz "el numero de vocales es :"
str:	.asciiz "long time ago in a far away galaxy"
	.text
	
main:
	la $a0,str
	li $s0,0	#contador de vocales
	move $s1,$a0
otravez:	
	lb $a0,($s1)	## cargo en $a0 el primer byte de lac cadena
	beqz $a0,hecho	#1ero marca el final
	li $v0,0
	beq $a0, 'a',si
	beq $a0, 'e',si
	beq $a0, 'i',si	
	beq $a0, 'o',si
	beq $a0, 'u',si
	b sale
si:	li $v0,1
sale:
	add $s0, $s0,$v0
	add $s1,$s1,1
	b otravez
hecho:
	la $a0,texto
	li $v0,4
	syscall
	
	move $a0,$s0
	li $v0,1
	syscall
	
	li $v0,10
	syscall