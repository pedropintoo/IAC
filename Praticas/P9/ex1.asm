	.data
prompt:	.asciiz		"Introduza um número\n"
result1:	.asciiz 	"O fatorial do número "
result2: 	.asciiz		" é: "
	.text
	.globl main
	

main:	
	li $v0, 5
	la $a0, prompt
	syscall
	
	move $a0, $v0
	move $s0, $v0		# $s0 = n
	
	jal fatorial		# $v0 = fatorial(n)
	
	move $s1, $v0		# $s1 = f
	

	la $a0, result1
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, result2
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	
	li $v0, 10
	syscall
	


##########################################################



fatorial:

	li $t0, 1		# res = 1
	move $t1, $a0		# i = num
	
	
	for:	ble $t1, 0, endFor
		
		
		
		mul $t0, $t0, $t1
		
		subi $t1, $t1, 1
		j for
		
	endFor:
		move $v0, $t0	# return res
	
	jr $ra 
		 
	