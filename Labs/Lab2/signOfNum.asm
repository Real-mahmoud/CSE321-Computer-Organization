.data 

prompt: .asciiz "Enter a Number : "
zeroMsg: .asciiz "Zero \n"
positive: .asciiz "Positive \n"
negative: .asciiz "Negative \n"

.text 

main:

    li $v0 , 4 
    la $a0, prompt
    syscall

    li $v0 , 5
    syscall
    move $t0 ,$v0
if:
    bne $t0 , $zero , elseif
    la $a0 ,zeroMsg
    j endif
elseif:
    blez $t0 , else
    la $a0 ,positive
    j endif
else:
    la $a0 ,negative

endif:
    li $v0 , 4 
    syscall
Exit:
    li $v0 , 10 
    syscall