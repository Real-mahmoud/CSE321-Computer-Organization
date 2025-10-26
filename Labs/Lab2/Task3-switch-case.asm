.data

prompt: .asciiz "Enter Number : "

positive: .asciiz "Positive Number"
negative: .asciiz "Negative Number"
zeroMsg: .asciiz "Zero"


breakLine: .asciiz "\n"
.text 

main:
    # half of score to make conditions on it 
    li $t0 , 50 

    li $v0 , 4
    la $a0 ,prompt
    syscall

    li $v0 , 5
    syscall

    move $t1 ,$v0
  
switch:
    beq $t1 , $zero , default
    blez $t1 ,case1
    bgtz $t1 ,case2

case1:
    la $a0 ,negative
    j endswitch
case2:
    la $a0 ,positive
    j endswitch

default:
    la $a0 ,zeroMsg
    
endswitch:
    li $v0 , 4 
    syscall

Exit:
    # make break line at end 
    li $v0 , 4
    la $a0 , breakLine
    syscall 
    # exit prog
    li $v0 , 10
    syscall 
