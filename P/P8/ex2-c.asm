	.data
maius: 	.asciiz "TEXTO EM MAIUSCULAS"
minus: 	.space 20


##################################################################
	.text
	.globl main
main:
	la $a0, maius 		# a0 = &maius[0]
	la $a1, minus		# a1 = &minus[0]

	li $t0, 0		# t0 = 0 		(i)
	
while:	add $t1, $t0, $a0	# t1 = i + &maius[0] 	(endereço maius)
	lb $s0, 0($t1) 		# s0 = maius[0]		
	
	beq $s0, '\0', endWhile	# (s0 == '\0') --> endWhile
	
if:	blt $s0, 'A', else 
	bgt $s0, 'Z', else 	# (s0 < 'A' or s0 > 'Z') --> else
	
	subi $s1, $s0, 'A'	# s1 = s0 - 'A'
	addi $s1, $s1, 'a'	# s1 = s1 + 'a'
	
	j done
else:	move $s1, $s0		# s1 = s0

done:	add $t2, $t0, $a1	# t2 = i + &minus[0]	(endereço minus)  
	sb $s1, 0($t2)
	
	addi $t0, $t0, 1
	
	j while
	
endWhile: 	

	li $v0, 4
	la $a0, minus
	syscall
	
	li $v0, 10
	syscall
	
	
	 
	  
	   
	    
	     
	       