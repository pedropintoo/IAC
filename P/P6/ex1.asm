
##################################################################
 	.text
 	.globl main

main: 	and	$t2, $t0, $t1	# soma e guardo em $t2

	or	$t3, $t0, $t1	# soma e guardo em $a0
	
	nor	$t4, $t0, $t1	# soma e guardo em $a0
	
	xor	$t5, $t0, $t1	# soma e guardo em $a0
	
	not 	$t6, $t0	# not (Bitwise)
	
 	li 	$v0, 10 	#
 	syscall 		# exit()
