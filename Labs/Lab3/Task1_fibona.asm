.data 
prompt : .asciiz "Enter number : "
result : .asciiz "fibonacci is : "

.text 

# $a0 = num
# $v0 = sum

fibonacci:
    li $t0 , 0   # num1 (fibo(1))
    li $t1 , 1   # num2 (fibo(2))

    li $t2 , 1   # test num
    li $t3 , 2   # test num
if :    
    bne $a0 , $t2 , elseif
    move $v0 , $t0
elseif:
    bne $a0 , $t3 , else
    move $v0 , $t1
else:

    addi $t3 , $t3 , 1  # counter (i=3)
For :
    bgt $t3 , $a0 , endFor
    add $v0 , $t0 , $t1
    move $t0 , $t1
    move $t1 , $v0
    addi $t3 , $t3 , 1
    j For

endFor :

returnfibonacci:
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