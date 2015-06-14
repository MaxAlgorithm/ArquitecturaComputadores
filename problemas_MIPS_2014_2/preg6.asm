	.data
arreglo:
	.byte 	10,5,12,9,22,17,9,15,9
resultado:
	.asciiz "El promedio es : \n"
	
	.text
	la $a0,arreglo
	li $s0,0		#$s0 hara de la suma de los numeros
	move $s1,$a0		#guarda la direccion del arreglo
	li $s2,9		#$s2 guarda la cantidad de numeros a promediar
	li $s3,0		#contador
lazo:
	lb $a0,($s1)		#consigo cada numero del array
	add $s0,$s0,$a0 	#$s0 = $s0+$a0
	add $s1,$s1,1		#se mueve a lo largo de array
	add $s3,$s3,1		#aumenta contador
	blt $s3,$s2,lazo
#termina lazo	
	div $s0,$s2		#$s0 = $s0/$s2	Se guarda el promedio total
	mflo $t1
#imprime
	li $v0,4
	la $a0,resultado
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall