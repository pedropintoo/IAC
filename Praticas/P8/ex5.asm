	.data
result:	.asciiz " Insira 6 números \n"
lista:	.space 24				# 6 * 4
print:	.asciiz " O conteudo da Array é: \n"
comma:  .asciiz " , "

	
#######################################################
	.text
	.globl main

main: 	la $s0, lista		# $s0 = &(lista[0])
	li $s1, 0		# $s1 = 0
	
	li $v0, 4
	la $a0, result
	syscall
	
for:	bge $s1, 6, done	# if (i>=6) done

	sll $s2, $s1, 2		# $s2 = i * 4
	add $s2, $s2, $s0	# $s2 = i*4 + &(lista[0]) = &(lista[i]) 
	
	li $v0, 5
	syscall			
	
	
	sw $v0, 0($s2)		# lista[i] = read_int()	 

	addi $s1, $s1, 1	# i++
	j for
	
done:  	
	li $v0, 4
	la $a0, print
	syscall
	
	li $s1, 0		# i = 0
	
forpri:	bge $s1, 6, end	# (s1 >= 6) --> done
	
	# $s2 = &(lista[i])
	sll $s2, $s1, 2		# s2 = i * 4
	add $s2, $s2, $s0	# s2 = i * 4 + &(lista[0])
	
	lw $s3, 0($s2)		# s3 = lista[t1]

	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, comma
	syscall
	
	
	addi $s1, $s1, 1
	j forpri
end: 
	

	li $v0, 10
	syscall