	.data
str:
	.ascii "Hello World \n"
	.asciiz " \"Hola mundo que tal\" " 
	.text
main: 	li $v0, 4 	# llamada al sistema para print_str
	la $a0, str 	# dirección del string a imprimir
	syscall 	# imprime el string
	li $v0, 10 	# llamada al sistema para terminar
	syscall 	# termina
	