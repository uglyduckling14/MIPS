	.text

	.globl	main
main:
	# add code here
	# Set up the stack pointer ($sp)
    li $sp, 0x7FFFFFEC    # Set stack pointer to the top of the stack

    # Allocate space for the dope vector on the stack
    sub $sp, $sp, 8       # Reserve space for 2 words (8 bytes) on the stack

    # Store the address of the array in the dope vector
    la $t0, arr           # Load the address of the array into $t0
    sw $t0, 0($sp)        # Store the address of the array in the dope vector
    move $a1, $sp	  # Move address of dope vector to $a1

    # Store the length of the array in the dope vector
    li $t1, 3             # Length of the array is 3
    sw $t1, 4($sp)        # Store the length of the array in the dope vector

    # Call the fee function
    jal fee

    # Print the result
    li $v0, 1             # System call code for printing an integer
    move $a0, $v1         # Move the result to $a0 for printing
    syscall

    # Exit
    li $v0, 10            # System call code for exit
    syscall

fee:
    # Set up the loop variables
    li $t2, 0             # Initialize i = 0
    li $t3, 0             # Initialize sum = 0

loop:
    # Check loop condition: i < length(arr)
    lw $t1, 4($a1)        # Load the length of the array from the dope vector
    bge $t2, $t1, endloop # Exit loop if i >= length(arr)

    # Load arr[i]
    lw $t0, 0($a1)        # Load the address of the array from the dope vector
    li $t4, 4             # Size of each array element
    mul $t4, $t2, $t4     # Calculate the offset (i * 4) for indexing
    add $t0, $t0, $t4     # Add the offset to the base address of the array
    lw $t4, 0($t0)        # Load arr[i] into $t4

    # Add arr[i] to sum
    add $t3, $t3, $t4     # Add arr[i] to sum

    # Increment loop variable: i++
    addi $t2, $t2, 1      # Increment i

    # Repeat the loop
    j loop

endloop:
    # Return sum
    move $v1, $t3         # Move the sum to $v0 for returning
    jr $ra                # Return using jr instruction

# Start .data segment (data!)
	.data
	arr: .word 1, 3, 5
        
