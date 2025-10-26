.data 

prompt : .asciiz "Enter a Number : "
result : .asciiz "Summation Result : "
breakLine: .asciiz "\n"

.text 
main:
    li $t1 , 0
do:
    li $v0, 4
    la $a0 ,prompt
    syscall

    li $v0 ,5
    syscall
    move $t0,$v0

    add $t1 ,$t1 ,$t0 
while:
    bne $t0 , $zero , do

endwhile:
    li $v0 ,4
    la $a0 ,result
    syscall
    li $v0 , 1
    move $a0 , $t1
    syscall

    li $v0 , 10 
    syscall

