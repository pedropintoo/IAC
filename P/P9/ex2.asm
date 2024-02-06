	.data
f1:	.asciiz	"\nInsira a frase1: "
f2:	.asciiz	"\nInsira a frase2: "
lenf1:  .asciiz "\n O numero de caracteres da frase1 é: "
lenf2:  .asciiz "\n O numero de caracteres da frase1 é: "
result: .asciiz "\nA frase concatenada é: "
frase1: .space 20
frase2: .space 20
frase3: .space 40
	.text
	.globl main


main:
	li $v0, 4
	la $a0, f1
	syscall
	
	li $v0, 8
	la $a0, frase1		# read_string(frase1,20)
	la $a1, 20
	syscall
	
	li $v0, 4
	la $a0, f2
	syscall
	
	li $v0, 8
	la $a0, frase2		# read_string(frase2,20)
	la $a1, 20
	syscall
	
	
	li $v0, 4
	la $a0, lenf1
	syscall
	
	la $a0, frase1
	jal strlen	
	move $s0, $v0		# n = strlen( frase1 );
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	
	la $a0, frase3
	la $a1, frase1
	jal strcopy
	
	la $a0, frase3
	la $a1, frase2
	jal strcat
	
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 4
	la $a0, frase3
	syscall
	


	li $v0, 10
	syscall
	

###########################################################

strlen:
	move $t0, $a0			# $t0 = &(str[0])
	
	li $t1, 0			# n = 0
	li $t2, 0			# i = 0
	
while:	
	add $t3, $t0, $t2	# $t3 = &(str[i])
	lb $t4, 0($t3) 		# $t4 = str[i]
	addi $t2, $t2, 1	# i++
	beq $t4, '\0', endWhile 
	beq $t4, '\n', endWhile 
		
		
		addi $t1, $t1, 1	# n++
		j while
		
endWhile:

	move $v0, $t1
	jr $ra

###########################################################

strcopy:
	move $t0, $a0			# $t0 = &(dst[0])
	move $t1, $a1			# $t1 = &(src[0])
	
	li $t2, 0			# i = 0
	
	
while2:
	add $t3, $t1, $t2	# $t3 = &(src[0]) + i
	add $t5, $t0, $t2	# $t5 = &(dst[0]) + i
	lb $t4, 0($t3)		# $t4 = src[i]	
	beq $t4, '\0', endWhile2
		
		
		sb $t4, 0($t5)		# dst[i] = src[i]
		
		addi $t2, $t2, 1
		j while2
		
endWhile2:
	li $t6, '\0'
	sb $t6, 0($t5)
	
	move $v0, $t0
	jr $ra
		
###########################################################	
	
		
strcat:
	addi $sp, $sp, -8
	
	sw $ra, 4($sp)			# store $ra
	sw $s0, 0($sp)			# store $s0


	move $s0, $a0			# aux = $t0

		
while3: lb $t0, 0($a0)			# $s1 = dst[ponteiro]
	beq $t0, '\0', endWhile3
	beq $t0, '\n', endWhile3
	
	addi $a0, $a0, 1
	j while3
	
endWhile3:
		
			
	jal strcopy
	
	move $v0, $s3
	
	lw $ra, 4($sp)			# store $ra
	lw $s0, 0($sp)			# store $s0
	addi $sp, $sp, 8
	
	
	jr $ra
					
