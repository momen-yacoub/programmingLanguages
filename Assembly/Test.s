.data

endl: .asciiz "/n"
str: .asciiz "ABCD"

.text

next_permutaion:

addi $t1, $s0, 0
lb $t0, 1($t1)
lb $s1, ($s0)

bnez $t0, ret
syscall
jr $ra
ret:

beqz $t0, exit
		
lb $t0, ($t1)
lb $s1, ($s0)

sb $s1, ($t1)
sb $t0, ($s0)

addi $sp, $sp, -12
sw $ra, ($sp)
addi $sp, $sp, -12
sw $s0, ($sp)
addi $sp, $sp, -12
sw $t1, ($sp)
addi $s0, $s0, 1
		
jal next_permutaion

lw $t1, ($sp)
addi $sp, $sp, 12
lw $s0, ($sp)
addi $sp, $sp, 12
lw $ra, ($sp)
addi $sp, $sp, 12
		
lb $t0, ($t1)
lb $s1, ($s0)	

sb $s1, ($t1)
sb $t0, ($s0)

addi $t1, $t1, 1
lb $t0, 1($t1)
j ret

exit:
jr $ra



.globl main
main:
la $a0, str
li $v0, 8
syscall

la $s0, str
li $v0,4

jal next_permutaion

li $v0, 10
syscall
.end main



