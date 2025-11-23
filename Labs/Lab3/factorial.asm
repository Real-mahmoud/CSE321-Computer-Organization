.data 
prompt : .asciiz "Enter number : "
result : .asciiz "Result is : "

.text 
factorial :
# $a0 =n
li $t0 , 1  # t0 = factorial result
li $t1 , 1  # t1= counter (i)
for:
    bgt $t1 ,$a0 , endFor 
    mul $t0,$t0 ,$t1
    addi $t1 ,$t1 ,1
    j for
endFor :
    move $v0 , $t0

endFactorial :
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