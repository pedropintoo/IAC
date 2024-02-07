	.data
r1:	.asciiz 	"Exponencial de "
r2    : .asciiz 	" por "
r3    : .asciiz 	" é: "
	
	
#######################################################
	.text
	.globl main

		
main:
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	li $v0, 5
	syscall
	
	move $s1, $v0
	
	
	###### Print dos operandos formatados #######
	la $a0, r1
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, r2
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	la $a0, r3
	li $v0, 4
	syscall
	###############
	
	move $a0, $s0
	move $a1, $s1
	jal x_to_y	# $v0 = resutl
	
	###### Print do resultado #######
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall










x_to_y: 
	bnez $a1, calc		# if (exp == 0) return 1
	
	li $v0, 1
	jr $ra	
	
calc:	
	addi $sp, $sp, -8
	sw $ra, 4($sp)		# store $ra
	sw $a0, 0($sp)		# store $s0
	
	
	subi $a1, $a1, 1
	jal x_to_y
	
	
	lw $a0, 0($sp)		# restore $s0
	lw $ra, 4($sp)		# restore $ra	
	addi $sp, $sp, 8
	
	
	mul $v0, $a0, $v0

	jr $ra
	
	
	
	
	
	
	
	
	

	
	
	
	
	