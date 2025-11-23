add_func:

    add $v0 ,$a0 ,$a1

    jr  $ra


main: 
    addi $sp ,$sp , -4
    sw $ra ,0($sp)

    li $a0 , 7
    li $a1 , 13

    jal add_func

    move $a0 ,$v0 
    li $v0 , 1
    syscall


endmain:
    lw $ra , 0($sp)
    addi $sp ,$sp , 4
    jr $ra

