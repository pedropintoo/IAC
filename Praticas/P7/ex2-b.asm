	 .data
prompt1: .asciiz "Introduza um numero: " 
result:  .asciiz "\nO numero em hexadecimal é: "


##################################################################
 	.text
 	.globl main

main: 	la $a0, prompt1	
	li $v0, 4
	syscall			# Imprime o prompt
	
	li $v0, 5 
	syscall			# Le o valor inteiro de num
	
	move $s0, $v0
	
	la $a0, result	
	li $v0, 4
	syscall			# Imprime o result
	
	
	
	li $t0, 0		# n = 0
	
	li $t2, 8		# c = 8
	
for: 	ble $t2, $t0, done
 	
 	andi $t1, $s0, 0xF0000000	# temp = num & 0xF0000000
 	srl $t1, $t1, 28	# temp = temp >> 28
 	
 	move $a0, $t1		
	li $v0, 34
	syscall			# Imprime o temp
	
	li $a0, ' '
	li $v0, 11
	syscall			# Imprime o espaco
 	
 	sll $s0, $s0, 4		# num = num << 4


	addi $t0, $t0, 1 	# increment
	
	j for
done:
	
 	li $v0, 10 	
 	syscall 		# exit()
	
