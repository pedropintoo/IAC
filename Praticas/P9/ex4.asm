	.data
list:	.word 	7, -23, 0, -912, -23, 1234, 123, -1
	.eqv	LISTSIZE 8
	.eqv	DATASIZE 4
#########################################
	.text
	.globl main
	
	
	
main:	
	
	la $a0, list
	li $a1, LISTSIZE
	jal bubble_sort
	
	
	li $v0, 10
	syscall		# exit()

	
	
######################## FUNCOES #################################

bubble_sort:

	# $t1 --> 0 = FALSE, 1 = TRUE	
	mul $a1, $a1, DATASIZE		# n = n*4 --> são inteiros
	 	
do:
	li $t0, 0	# houveTroca = FALSE	
	
	move $t1, $a0	# p_aux = array
	
	for:	add $t2, $a0, $a1
		subi $t2, $t2, DATASIZE		# $t2 = array + (n*4) - 4 
		bge $t1, $t2, done
		
		if: 	lw $t3, 0($t1)		# $t3 = *p_aux
			addi $t4, $t1, DATASIZE	# $t4 = p_aux + 4
			lw $t5, 0($t4)		# $t4 = *(p_aux + 4)
			ble $t3, $t5, endIf
			
			move $t6, $t3		# $t6 = aux = *p_aux
			sw $t5, 0($t1)		# *p_aux = *(p_aux + 4)
			sw $t6, 0($t4)		# *(p_aux + 4) = aux
			
			li $t0, 1		# houveTroca = TRUE
		
	endIf:	
		addi $t1, $t1, DATASIZE		# p_aux = p_aux + 4
		j for	
	
done:
	bnez $t0, do
	jr $ra
		
		
		
		