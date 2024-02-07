	.data
oper1: 	.word -217

oper2: 	.byte 48

	.text

main:	
	la $s0, oper2
	lb $s1, 0($s0)
	
	li $t0, 10
	li $t1, 123

	
add2:	addi $t0, $t0, 2

	addi $t0, $t0, 3
do:	

	bgt $t0, $t1, add2
	li $v0, 10
	syscall
	