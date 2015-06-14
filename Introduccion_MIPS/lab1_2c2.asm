#(2)
	.text
#imprimie un caracter	
	li $v0,11
	li $t1,'U'	
	move $a0,$t1
	#li $a0,10	#imprime linea feed
	syscall
	
#llamada al sistema para terminar y salir
	li $v0, 10	#cargo servicio "10" en el registro $v0
	syscall		#realiza la accion