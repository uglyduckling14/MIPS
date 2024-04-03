	.data

	.text
main:
# Load the values 3 and 4 into registers
    li $t0, 3               # Load 3 into register $t0
    li $t1, 4               # Load 4 into register $t1

    # Add the values
    add $t2, $t0, $t1       # Add values in $t0 and $t1, store result in $t2

    # Print the result
    li $v0, 1               # System call code for printing an integer
    move $a0, $t2           # Move the result to $a0 (argument register)
    syscall                 # Perform system call to print the integer

	# Add code here

	li	$v0,10
	syscall
