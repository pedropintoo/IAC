	.data
minus: 	.asciiz "texto em minusculas"
maius: 	.space 20


##################################################################
	.text
	.globl main
main:
	la $a0, minus 		# a0 = &minus[0]
	la $a1, maius		# a1 = &maius[0]

	li $t0, 0		# t0 = 0 		(i)
	
while:	add $t1, $t0, $a0	# t1 = i + &minus[0] 	(endereço minus)
	lb $s0, 0($t1) 		# s0 = minus[0]		
	
	beq $s0, '\0', endWhile	# (s0 == '\0') --> endWhile
	
if:	blt $s0, 'a', else 
	bgt $s0, 'z', else 	# (s0 < 'a' or s0 > 'z') --> else
	
	addi $s1, $s0, 'A'	# s1 = s0 + 'A'
	subi $s1, $s1, 'a'	# s1 = s1 - 'a'
	
	j done
else:	move $s1, $s0		# s1 = s0

done:	add $t2, $t0, $a1	# t2 = i + &maius[0]	(endereço maius)  
	sb $s1, 0($t2)
	
	addi $t0, $t0, 1
	
	j while
	
endWhile: 	

	li $v0, 4
	la $a0, maius
	syscall
	
	li $v0, 10
	syscall
	
	
	 
	  
	   
	    
	     
	       