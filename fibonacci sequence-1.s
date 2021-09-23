	.data
space:		.asciiz " "
specialOne:	.asciiz "1"

	.text
main:
	li $v0, 5			
	syscall			#cin >> n;
	move $t0, $v0		#int t0 = v0;
	
	li $t1, 1
	li $t2, 2
	beq $t0, $t1, one	#if t0 == 1 one();
	beq $t0, $t2, two	#if t0 == 2 two();
	
	li $t1, 40
	beq $t0, $t1, exit
	
	li $t3, 0			#prev = 0
	li $t4, 1			#curr = 1
	li $t5, 0			#next = 0
	
	#if the input is larger than 1
	move $v0, $0
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	la $a0, specialOne
	li $v0, 4
	syscall
	
	addi $t0, $t0, -3
	move $a0, $t0
	jal fib			#fib(a0)

one:
	move $v0, $0
	li $v0, 1
	syscall
	jal exit
	
two:
	move $v0, $0
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	la $a0, specialOne
	li $v0, 4
	syscall
	jal exit
	
fib:
	add $t5, $t3, $t4	#next = prev + curr
	
	la $a0, space
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	move $t3, $t4		#prev = curr
	move $t4, $t5		#curr = next
	
	slt $t7, $t6, $t0
	beq $t7, $0, exit
	
	addi $t6, $t6, 1

	jal fib
	
exit:
	li $v0, 10
	syscall
