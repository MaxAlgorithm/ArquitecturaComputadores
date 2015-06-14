.text 
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,5
	syscall
	move $t1,$v0
	
	blt $t0,$t1,t0_lower
	move $t2,$t1
	b endif
t0_lower:
	move $t2,$t0
endif:
	move $a0,$t2
	li $v0,1
	syscall
	
	li $v0,10
	syscall