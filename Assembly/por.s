.data #here we declare variables
endl:  .asciiz "\n"
str: .asciiz  "ABC"

.text 

next_permutaion:
	bne $t0 , $0 , end
		syscall
		j exit
	end:
	lb $t1 , ($t0)
	la $t2 , ($t0)
	li $s0 , 1
	loop:
	
	beq $t2 , $0 , exit 
		lb $t3 , ($t2)
		sb $t3 , ($t0)
		sb $t1 , ($t2)
		add $t0 , $t0 , $s0

		addi $sp, $sp, -4
		sw $ra, ($sp)
		addi $sp, $sp, -4
		sw $ra, ($sp)
		addi $sp, $sp, -4
		sw $ra, ($sp)
		
		jal next_permutaion
		lw $s2, ($sp)
		addi $sp, $sp, 4
		lw $s2, ($sp)
		addi $sp, $sp, 4
	
		lw $s2, ($sp)
		addi $sp, $sp, 4

		sub $t0 , $t0 , $s0
		sb $t3 , ($t2)
		j loop
	sb $t1 , ($t0)
exit:
jr $ra


.globl main
main:
	la $a0 , str
	
	li $v0 , 8
	syscall
	li $v0 , 4
	
	la $t0 , ($a0)
	jal next_permutaion
		
	
	li $v0, 10
	syscall
.end main
