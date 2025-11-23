.data 
prompt : .asciiz "Enter number : "
result : .asciiz "Result is : "

.text 

# $a0 =n
# t0 = factorial result
factorial :
    addi $sp , $sp ,-4
    sw $ra ,0($sp)
    li $t0 , 1 

    ble $a0 , $t0 , fact0or1

    addi $sp , $sp ,-4
    sw $a0 ,0($sp)

    sub $a0 , $a0 , 1
    jal factorial 
    
    lw $a0 ,0($sp)
    addi $sp , $sp ,4

    mul $v0 , $v0 , $a0

    j endFactorial

fact0or1 :
    li $v0 , 1

endFactorial :
    lw $ra ,0($sp)
    addi $sp , $sp ,4
    jr $ra

main :
    addi $sp , $sp ,-4
    sw $ra ,0($sp)
    
    li $v0 ,4
    la $a0 ,prompt
    syscall

    li $v0 ,5
    syscall

    move $a0 ,$v0


    jal factorial

    move $s0 , $v0
    li $v0 ,4
    la $a0 ,result
    syscall

    move $a0 , $s0
    li $v0 ,1
    syscall



retyrnMain:
    lw $ra ,0($sp)
    addi $sp , $sp ,4
    jr $ra