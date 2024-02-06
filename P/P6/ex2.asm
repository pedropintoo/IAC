
##################################################################
 	.text
 	.globl main

main: 	and	$t2, $t0, $t1	# soma e guardo em $t2

	
	sll 	$t1, $t0, 1
	srl 	$t2, $t0, 1
	sra 	$t3, $t0, 1
	
 	li 	$v0, 10 	#
 	syscall 		# exit()
	