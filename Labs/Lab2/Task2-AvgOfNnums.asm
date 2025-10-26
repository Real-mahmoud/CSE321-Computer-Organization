.data 

promptOfN: .asciiz "Enter the count of number u need to get avg : "

promptInput: .asciiz "Enter A number :"
dot: .asciiz "."
result: .asciiz "The Average = "
breakLine: .asciiz "\n"
.text 

main:
    # prompt get n from user
    li $v0 , 4
    la $a0 , promptOfN
    syscall 

    # input n
    li $v0 ,5
    syscall
    move $t0, $v0

    # sum =0
    li $t1 ,0
    # index of for loop
    li $t2 ,0

for:
    
    # prompt get num from user
    li $v0 , 4
    la $a0 , promptInput
    syscall 

    # input number
    li $v0 ,5
    syscall

    move $t3 , $v0

    add $t1 ,$t1 , $t3

    addi $t2 ,$t2 , 1
    bne $t2 , $t0 ,for

endfor:

    # result
    li $v0 , 4
    la $a0 , result
    syscall 

    div $t1 , $t0

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

   
Exit:
    # make break line at end 
    li $v0 , 4
    la $a0 , breakLine
    syscall 
    # exit prog
    li $v0 , 10
    syscall 