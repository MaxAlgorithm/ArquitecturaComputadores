# programa para que muestre el mayor de 2 numeros ingresados por teclado
main:
## consigue el primer numero desde el usuario y lo pone en $t0
	li $v0, 5	# carga el modo lectura de syscall en $v0
	syscall		# hace la accion	
	move $t0, $v0	# muevo el numero leido en $t0
## consigue el segundo numero desde el usuario y lo pone en $t1
	li $v0, 5	# carga el modo lectura de syscall en $v0
	syscall		# hace la accion
	move $t1,$v0	# muevo el numero leido en $t1
	
## pone el mas grande en $t0 y $t1 en $t2
	bgt $t0, $t1, t0_bigger	# si $t0 > $t1, santa a t0_bigger,
	move $t2, $t1		# de otro modo, copia
	b endif			# y luego salta a endif
t0_bigger:
	move $t2, $t0		# copia $t0 a $t2
endif:
## imprime $t2
	move $a0, $t2
# muevo el numero a imprimir en $a0
	li $v0, 1
# carga el modo de impresion de un entero en $v0
	syscall			# hace el syscall
	li $v0 10		# salida
	syscall			# hace el syscall
