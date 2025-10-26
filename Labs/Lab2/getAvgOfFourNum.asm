.data

promptFirstNum: .asciiz "Please Enter First number : "
promptSecondNum: .asciiz "Please Enter Second number : "
promptThirdNum: .asciiz "Please Enter Third number : "
promptFourthNum: .asciiz "Please Enter Fourth number : "
dot: .asciiz "."
resultPrompt: .asciiz "The Average is : "
breakLine: .asciiz "\n"

.text 
main:
    # prompt 1
    li $v0 , 4
    la $a0 , promptFirstNum
    syscall 
    # read num 1
    li $v0 , 5
    syscall
    
    move $t0,$v0

    # prompt 2
    li $v0 , 4
    la $a0 , promptSecondNum
    syscall 

    # read num 2
    li $v0 , 5
    syscall
    
    move $t1,$v0
    
    # prompt 3
    li $v0 , 4
    la $a0 , promptThirdNum
    syscall 
    # read num 3
    li $v0 , 5
    syscall
    
    move $t2,$v0

    # prompt 4
    li $v0 , 4
    la $a0 , promptFourthNum
    syscall 
    # read num 4
    li $v0 , 5
    syscall
    
    move $t3,$v0

    # result prompt
    li $v0 , 4
    la $a0 , resultPrompt
    syscall

    # make the addition of four nums
    add $s0 ,$t0 ,$t1
    add $s1 ,$t2 ,$t3
    add $s2 ,$s0 ,$s1

    # set the count of numbers to $s3
    li $s3 , 4

    # calc avg
    div $s2 ,$s3

    # set dominant to $a0 and display it 
    mflo $a0

    li $v0 ,1 
    syscall 

    # dot to be between dominant and remainder
    li $v0 , 4
    la $a0 , dot
    syscall

    # set remainder to $a0 and display it 
    mfhi $a0

    li $v0 ,1 
    syscall
    

    # make break line at end 
    li $v0 , 4
    la $a0 , breakLine
    syscall 
    # exit prog
    li $v0 , 10
    syscall 