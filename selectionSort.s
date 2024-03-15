.data
v: .word 65, 23, 66, 2, 4
s: .asciiz " "
.text
.globl main
.ent main
main:
	la $t0, v
	and $t9, $0, $0
	move $s0, $t0
	and $t1, $0, $0
	and $t2, $0, $0
sortE:	beq $t1, 4, print
	lw $t5, ($t0)
	move $t7, $t0
	and $t2, $0, $0
	addi $t2, $t1, 1
	addi $t4, $t0, 4
sortI:	beq $t2, 5, endE
	lw $t6, ($t4)
	blt $t6, $t5, swap
endI: 	addi $t2, $t2, 1
	addi $t4, $t4, 4
	j sortI
endE:	lw $t8, ($t0)
	sw $t5, ($t0)
	sw $t8, ($t7)
	addi $t1, $t1, 1
	addi $t0, $t0, 4
	j sortE
swap:  	move $t5, $t6
	move $t7, $t4
	j endI
print: 	addi $t9, $t9, 1
	li $v0, 1
	lw $a0,($s0)
	syscall
	li $v0, 4
	la $a0, s
	syscall
	addi $s0, $s0, 4
	bne $t9, 5, print
	li $v0, 10
syscall
.end main
