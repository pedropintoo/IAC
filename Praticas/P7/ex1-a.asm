	 .data
prompt1: .asciiz "Introduza um numero: " 
strpar: .asciiz "O numero é par\n" 
strimp: .asciiz "O numero é impar\n" 


##################################################################
 	.text
 	.globl main

main: 	la $a0, prompt1	
	li $v0, 4
	syscall			# Imprime o prompt
	
	li $v0, 5 
	syscall			# Le o valor inteiro de a
	
	move $s0, $v0		# Guarda o valor de a em $s0
	
	andi $s1, $s0, 1
	
if: 	bnez $s1, else
 	
	la $a0, strpar	
	li $v0, 4
	
	syscall			# Imprime o prompt
	j done
else:	
	la $a0, strimp	
	li $v0, 4
	syscall			# Imprime o prompt
done:
 	li $v0, 10 	
 	syscall 		# exit()
	
