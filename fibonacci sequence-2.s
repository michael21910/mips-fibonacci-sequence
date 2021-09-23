	.data
array:	.space 41

	.text
main:
	li $v0, 5			
	syscall			#cin >> n;
	move $t0, $v0		#int t0 = v0;
	la $s0, array		#int *s0 = array[0]
	sw $t0, ($s0)		#array[0] = t0;
	
	li $t1, 1
	li $t2, 2
	beq $t0, $t1, one	#if t0 == 1 one();
	beq $t0, $t2, two	#if t0 == 2 two();
	
	li $t1, 1
	beq $t0, $t1, exit
	
	li $t3, 0			#prev = 0
	li $t4, 1			#curr = 1
	li $t5, 0			#next = 0
	
	#if the input is larger than 1
	addi $s0, $s0, 4
	sw $t3, ($s0)
	addi $s0, $s0, 4
	sw $t1, ($s0)
	addi $t0, $t0, -3
	move $a0, $t0
	jal fib			#fib(a0)

one:
	addi $s0, $s0, 4
	sw $t3, ($s0)
	jal exit
	
two:
	addi $s0, $s0, 4
	sw $t3, ($s0)
	addi $s0, $s0, 4
	sw $t1, ($s0)
	jal exit
	
fib:
	add $t5, $t3, $t4	#next = prev + curr
	addi $s0, $s0, 4
	sw $t5, ($s0)
	
	move $t3, $t4		#prev = curr
	move $t4, $t5		#curr = next
	
	slt $t7, $t6, $t0
	beq $t7, $0, exit
	
	addi $t6, $t6, 1

	jal fib
	
exit:
	li $v0, 10
	syscall
