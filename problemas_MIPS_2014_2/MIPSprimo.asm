	.data
titulo:
	.asciiz "Numeros primos meores de 100\n"
coma:
	.asciiz ", "
saltolinea:
	.asciiz "\n"
cantidad:
	.asciiz "\n nunero de primos es: "
	.text
	
	li $v0,4
	la $a0,titulo
	syscall
	li $v0,1
	li $a0,2
	syscall
	li $v0,4
	la $a0,coma
	syscall
	li $t2,2	#t2 hace las veces de X
	li $t0,1000
	li $t5,0	# nro de valores primos
	li $t1,3	
	li $t6,0
divide:
	div $t1,$t2	#$t1/$t2
	mfhi $t4	#se carga el resto
	beqz $t4,otro_numero
	add $t2,$t2,1
	blt $t2,$t1,divide
	b sies_primo
otro_numero:
	li $t2,2
	add $t1,$t1,1
	blt $t1,$t0,divide
	b termina
sies_primo:
	li $v0,1
	move $a0,$t1
	syscall
	li $v0,4
	la $a0,coma
	syscall
	add $t5,$t5,1
	bne $t6,20,sigue1
	li $v0,4
	la $a0,saltolinea
	syscall
	li $t6,0
sigue1:
	add $t6,$t6,1
	j otro_numero

termina:
	li $v0,4
	la $a0,cantidad
	syscall
	li $v0,1
	move $a0,$t5
	add $a0,$a0,1
	syscall
#sale
	li $v0,10
	syscall
	
