	.data
	.eqv SIZE 6

lista:	.space SIZE
	.space SIZE
	.space SIZE
	.space SIZE
result: .asciiz "O conteudo do Array é: \n"
comma:  .asciiz " , "


############################################
	.text
	.globl main
	
	
main:
	la $s0, lista		# $s0 = &(lista[0])
	li $s1, 0		# $s1 = 0
	
rFor:	bge $s1, SIZE, doWhile	
	
	li $v0, 5
	syscall			# $v0 = read_int()
	
	sll $s2, $s1, 2		# $s2 = i * 4
	add $s2, $s2, $s0	# &(lista[i]) = i * 4 + &(lista[0])
	
	sw $v0, 0($s2)		# lista[i] = read_int()

	addi $s1, $s1, 1	# i++
	j rFor

############################################
############### BUBBLE SORT ################
############################################	
	
doWhile:	
	li $s3, 0		# houveTroca = FALSE
	
	li $s4, SIZE 		# $s4 = SIZE 
	subi $s4, $s4, 1	# $s4 = SIZE - 1
	
	li $s1, 0		# $s1 = 0
	
	
	
	dFor:	bge $s1, $s4, ddone	# if (i >= SIZE - 1) ddone
		
		sll $s2, $s1, 2		# $s2 = i * 4
		add $s2, $s2, $s0	# &(lista[i]) = i * 4 + &(lista[0])
		
		add $s5, $s2, 4		# &(lista[i+1]) = i * 4 + &(lista[0]) + 4
	
		lw $s6, 0($s2)		# $s6 = lista[i]
		lw $s7, 0($s5)		# $s7 = lista[i+1]
	
		
		if:	ble $s6, $s7, lessEq	# if (lista[i] <= lista[i+1]) lessEq
	
			move $t0, $s6		# aux = lista[i]
	
			sw $s7, 0($s2)		# lista[i]   = lista[i+1]
			sw $t0, 0($s5)		# lista[i+1] = aux
	
			li $s3, 1		# houveTroca = TRUE
			
	
		
	lessEq: 	
		addi $s1, $s1, 1	# i++
		j dFor
	
	
	
ddone: beq $s3, 1, doWhile		# if (houveTroca == TRUE) doWhile


############################################
############################################
############################################


end:
	
	li $s1, 0		# i = 0

pFor:	bge $s1, SIZE, pdone
	
	sll $s2, $s1, 2		# $s2 = i * 4
	add $s2, $s2, $s0	# $s2 = i * 4 + &(lista[0])
	
	li $v0, 1
	lw $a0, 0($s2)		# $a0 = lista[i]
	syscall
	
	iflast: beq $s1, $s4, last	# if (i == SIZE - 1) last	
		li $v0, 4
		la $a0, comma
		syscall
	last:
	
	addi $s1, $s1, 1	# i++
	j pFor
pdone:
	

	li $v0, 10
	syscall		# exit()
