	 .data
prompt1: .asciiz "Introduza um numero: " 
result:  .asciiz "O fatorial do numero inserido é: "


##################################################################
 	.text
 	.globl main

main: 	la $a0, prompt1	
	li $v0, 4
	syscall			# Imprime o prompt1
	
	li $v0, 5 
	syscall			# Le o valor inteiro de n
	
	move $s0, $v0		# Guarda o valor de n em $s0
	
	li $t1, 1		# f = 1
	
	move $t0, $s0		# i = n
	
for: 	ble $t0, $0, done
 	
 	mul $t1, $t1, $t0
 	
	subi $t0, $t0, 1
	
	j for
done:
	la $a0, result	
	li $v0, 4
	syscall			# Imprime o result
	
	move $a0, $t1	
	li $v0, 1
	syscall			# Imprime o f
	
 	li $v0, 10 	
 	syscall 		# exit()
	
