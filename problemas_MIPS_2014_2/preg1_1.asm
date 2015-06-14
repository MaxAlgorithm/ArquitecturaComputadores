	.data 
str:
	.ascii  "Hola a todos \n"
	.ascii	"Bienvenidos a MIPS \n"
	.asciiz	"Un procesador de 36 bits"
	.text
main:
	li $v0,4	#servicio para imprimir una cadena
	la $a0,str
	syscall
	
	li $v0,10
	syscall