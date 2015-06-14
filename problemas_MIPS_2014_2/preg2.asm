	.text
# (1) Imprime un entero
	li $v0,1	#servicio para imprimir entero
	li $a0,25
	syscall		#imprime valor 25