	.data
numero:	.float 34.567901
	.text 
	li $v0,2	#servicio para imprimir flotante
	lwc1 $f12,numero
	syscall
	
#termina y sale
	li $v0,10
	syscall