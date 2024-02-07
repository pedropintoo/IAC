	.data
prompt1:.asciiz "Introduza uma string\n"
result:	.asciiz "O número de carateres numéricos é: "
str:	.space 40

#####################################################
	.text
	.globl main

main: 	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 8
	la $a0, str
	li $a1, 40 		
	syscall

	
	la $a0, str		# a0 = &str
	
	li $t0, 0		# i = 0
	li $s1, 0		# n = 0
	
for: 	add $t1, $t0, $a0	# t1 = i*1 + &str 					
	lb $s0, 0($t1)		# $s0 = str[i]
	
	beq $s0, '\0', done
	
	blt $s0, '0', notNum
	bgt $s0, '9', notNum
	
	addi $s1, $s1, 1	# n++ ( apenas se for um número )
	
notNum: addi $t0, $t0, 1	# i++
	j for

done:	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $s1		# a0 = n
	syscall
	
	li $v0, 10
	syscall