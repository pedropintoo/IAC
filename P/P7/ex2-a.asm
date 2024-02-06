	 .data
prompt1: .asciiz "Introduza um numero: " 
result:  .asciiz "A soma dos positivos é: "


##################################################################
 	.text
 	.globl main

main: 	
	
	
	li $t1, 0		# soma = 0
	
	li $t0, 5		# i = 5
	
for: 	ble $t0, $0, done
 	
 	la $a0, prompt1	
	li $v0, 4
	syscall			# Imprime o prompt1
	
	li $v0, 5 
	syscall			# Le o valor inteiro de n
	
if:	blt $v0, $0, neg	
	add $t1, $t1, $v0
neg:

	subi $t0, $t0, 1
	
	j for
done:
	la $a0, result	
	li $v0, 4
	syscall			# Imprime o result
	
	move $a0, $t1	
	li $v0, 1
	syscall			# Imprime o soma
	
 	li $v0, 10 	
 	syscall 		# exit()
	
