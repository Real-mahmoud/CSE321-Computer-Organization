.data 

name: .asciiz "Name : Mahmoud Khaled \n"
id: .asciiz "ID : 12345678910 \n"
course: .asciiz "Course : CSE321 : Computer Organization \n"

.text 
main:
    li $v0,4
    la $a0,name
    syscall
    li $v0,4
    la $a0,id
    syscall
    li $v0,4
    la $a0,course
    syscall
    li $v0,10
    syscall
