.data 
prompt : .asciiz "Enter number : "
result : .asciiz "fibonacci is : "

.text 

fibonacci:
    li $t0 , 1
    li $t1, 2

    addi $sp , $sp , -12
    sw $ra , 8($sp)
    sw $a0 , 4($sp)
    sw $s0 , 0($sp)
    li $t0, 1

    beq $a0, $t0, fib1 
    beq $a0, $t1, fib2 

    # fib(n-1)
    addi $a0 , $a0 , -1
    jal fibonacci
    move $s0 , $v0     

    # fib(n-2)
    lw $a0 , 4($sp)
    addi $a0 , $a0 , -2
    jal fibonacci  

    # fib(n) = fib(n-1) + fib(n-2)
    add $v0 , $s0 , $v0

    j returnfibo

fib1:
    li $v0, 0
    j returnfibo

fib2:
    li $v0, 1
    j returnfibo

returnfibo :
    lw $s0 , 0($sp)
    lw $a0 , 4($sp)
    lw $ra , 8($sp)
    addi $sp , $sp , 12
    jr $ra

main :
    addi $sp , $sp , -4
    sw $ra , 0($sp)

    # ask user to enter num to give him fibo 
    li $v0 ,4
    la $a0 ,prompt
    syscall

    li $v0 ,5
    syscall

    move $a0 ,$v0

    jal fibonacci
    
    # move v0 to s0 to use as result prompt will change v0
    move $s0 , $v0
    # result 

    li $v0 ,4
    la $a0 ,result
    syscall

    move $a0 , $s0
    li $v0 ,1
    syscall


returnMain:
    lw $ra , 0($sp)
    addi $sp , $sp , 4
    jr $ra