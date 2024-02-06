	.data
result:	.asciiz "O conteudo da Array é: \n"
comma: .asciiz " , "
lista:  .word 4,3,-2,1,27,45
		
######################################################
	.text
	.globl main
	
main:	li $v0, 4
	la $a0, result
	syscall
	
	
	la $s0, lista		# s0 = &(lista[0])
	li $s1, 0		# i = 0
	
	
for:	bge $s1, 6, done	# (s1 >= 6) --> done
	
	# $s2 = address index
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
	j for
done: 
	 
	   
	
	li $v0, 10 
	syscall 