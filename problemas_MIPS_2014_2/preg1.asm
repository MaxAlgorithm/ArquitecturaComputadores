	.data 
str:
	.asciiz "Hola Mundo"
	
	.text
main:
	li $v0,4
	la $a0,str
	syscall
	
	li $v0,10
	syscall