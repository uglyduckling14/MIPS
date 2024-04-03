	.text

	.globl	main
main:
        # put 3 and 4 on the stack using the register $sp
	li $t0, 3               # Load 3 into register $t0
    	sw $t0, 0($sp)         # Store 3 on the stack
    	li $t1, 4               # Load 4 into register $t1
    	sw $t1, -4($sp)         # Store 4 on the stack
    
    	jal fee                
        # call fee. You'll probably want to use the jal instruction to
        # store the current address in $ra

	# load results from stack to registers
	lw $a0, 0($sp)
	# print result
	li $v0, 1
	syscall
        # exit
        li $v0,10
	syscall

fee:
        # copy a and b from stack to local registers
        lw $t2, 0($sp)          # Load parameter a from stack
    	lw $t3, -4($sp)          # Load parameter b from stack

	# add a and b
	add $t4, $t2, $t3       # Add a and b, store result in $t4
        # place result on stack
	sw $t4, 0($sp)          
        # return using jr instruction
	jr $ra
# Start .data segment (data!)
	.data
