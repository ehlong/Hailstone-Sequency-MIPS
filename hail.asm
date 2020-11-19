#Elliott Long
#Hailstone Sequence

.data

prompt: .asciiz "Please select an integer: "
ending: .asciiz "Total iterations: "
nl: .asciiz "\n"
sp: .asciiz " "

.text

	la	$a0, prompt		#loads address of prompt for syscall
	li	$v0, 4			#sets syscall to print prompt
	syscall
	li	$v0, 5			#sets syscall to read integer, store in v0
	syscall
	add 	$s0, $v0, $0		#stores stored int into s0
	sll	$s1, $v0, 31		#figure to test for odd or even
	addi	$s2, $s2, -2147483648	#comparison value
	beqz	$s1, even		#branch to even if even int
	beq	$s1, $s2, odd		#branch to odd if odd int
	

end:	
	li 	$v0, 1			#loads to print int with syscall
	la 	$a0, ($s0)		#stores s0 into a0
	syscall
	la	$a0, nl			#loads nl
	li	$v0, 4			#sets to print string
	syscall
	la	$a0, ending		#loads ending
	syscall
	la	$a0, ($s7)		#loads increment total
	li	$v0, 1			#sets to print int
	syscall	
	li 	$v0, 10
	syscall				#terminates program

odd:
	li	$v0, 1			#loads to print int with syscall
	la 	$a0, ($s0)		#stores s0 into a0
	syscall
	la	$a0, sp			#loads address of sp for syscall
	li	$v0, 4			#sets syscall to print prompt
	syscall
	add 	$t0, $s0, $s0		#stores 2x int into t0
	add 	$t0, $t0, $s0		#makes t0 into 3x int
	add 	$s0, $t0, $0		#makes s0 into 3x int
	addi 	$s0, $s0, 1		#adds one into s0
	addi 	$s7, $s7, 1		#increment s7
	j even				#jumps to even

even:
	li 	$v0, 1			#loads to print int with syscall
	la 	$a0, ($s0)		#stores s0 into a0
	syscall
	la	$a0, sp			#loads address of sp for syscall
	li	$v0, 4			#sets syscall to print prompt
	syscall
	add 	$t0, $s0, $0		#loads t0 with s0
	srl 	$t0, $t0, 1		#divides t0 by 2
	add 	$s0, $t0, $0		#updates s0
	addi 	$s7, $s7, 1		#increments s7
	beq 	$s0, 1, end		#jumps to end of program
	add 	$s1, $s0, $0		#s0 into s1
	sll 	$s1, $s1, 31		#shifts for testing
	beqz 	$s1, even		#redoes even if even
	beq 	$s1, $s2, odd		#jumps to odd if odd
	
	
	
	
	
	
	
	
	
	
	