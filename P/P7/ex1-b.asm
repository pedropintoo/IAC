	 .data
prompt1: .asciiz "Introduza um numero: " 


##################################################################
 	.text
 	.globl main

main: 	la $a0, prompt1	
	li $v0, 4
	syscall			# Imprime o prompt1
	
	li $v0, 5 
	syscall			# Le o valor inteiro de a
	
	move $s0, $v0		# Guarda o valor de a em $s0
	
	li $t0, 0
	
for: 	ble $s0, $t0, done
 	
 	la $a0, '-'	
	li $v0, 11
	syscall			# Imprime o '-'
 	
	addi $t0, $t0, 1
	
	j for
done:
 	li $v0, 10 	
 	syscall 		# exit()
	
