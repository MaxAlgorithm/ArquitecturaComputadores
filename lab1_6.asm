#desarrollo un programa que imrpima # el minimo y maximo
#de los elementos del arreglo:
#53, 9,77,66,12,115,18,26,44,14,15,78,8,12,13
	
	.data
array:	.word 53,9,77,66,12,115,18,26,44,14,15,78,8,12,13
count:	.word 15
end1:	.asciiz "\n"
ans1:	.asciiz "min= "
ans2:	.asciiz "\nmax= "

#Inicializar el min y el max a a[0]
#t0 aputa a los elementos del arreglo
#t1 contiene la cantidad de elementos
#t2 contiene el minimo
#t3 contiene el maximo
#t4 cada palabra del arreglo
	.text
	
main:	
	la $t0,array
	lw $t1,count
	lw $t2,($t0)
	lw $t3,($t0)
	add $t0, $t0, 4	# este es un puntero que apunta a a[1]
	add $t1,$t1,-1
	
loop:	
	lw $t4,($t0)
	bge $t4,$t2,notMin
	move $t2,$t4
notMin:
	ble $t4,$t3,notMax
	move $t3,$t4
notMax:
	add $t1,$t1,-1
	add $t0,$t0,4	# para apuntar al siguenete elemento del arreglo
	bnez $t1,loop
	
	la $a0, ans1
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	
	la $a0, ans2
	li $v0,4
	syscall
	
	move $a0,$t3
	li $v0,1
	syscall
	
	la $a0,end1
	li $v0,4
	syscall
	li $v0,10
	syscall
	
