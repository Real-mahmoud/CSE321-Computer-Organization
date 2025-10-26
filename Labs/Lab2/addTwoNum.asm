.data

promptFirstNum: .asciiz "Please Enter First number : "
promptSecondNum: .asciiz "Please Enter Second number : "

resultPrompt: .asciiz "The summation is : "
breakLine: .asciiz "\n"

.text 

main:
    # first prompt
    li $v0 , 4
    la $a0 , promptFirstNum
    syscall 

    # enter first number
    li $v0 , 5
    syscall
    
    # move number from $v0 to $t0 
    move $t0,$v0

    # second prompt
    li $v0 , 4
    la $a0 , promptSecondNum
    syscall 

    # enter second number
    li $v0 , 5
    syscall
    
    # move number from $v0 to $t1 
    move $t1,$v0

    # result prompt
    li $v0 , 4
    la $a0 , promptFirstNum
    syscall 

    # add the two numbers
    add $a0,$t1,$t0

    # print addition result 
    li $v0 , 1
    syscall

    # make break line after done 
    li $v0 , 4
    la $a0 , breakLine
    syscall 
    
    # end program
    li $v0 , 10
    syscall 




    