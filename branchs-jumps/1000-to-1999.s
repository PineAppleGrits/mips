# Sumar todos los numeros hasta 1999

.data
prompt: .asciiz "La suma de los numeros del 1000 al 1999 es: "
null_char: .asciiz "\n"
space_char: .asciiz " "

.text
.globl main

main:
li $t1, 1000
li $t0, 1
loop:
beq		$t1, 1999, exit	# if $t1 == 1999 then exit
beq		$t0, 6, null_jump	# if $t0 == 6 then null_jump
addi	$t1, $t1, 1			# $t1 = $t1 + 1
addi    $t0, $t0, 1
#print 
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, space_char
syscall
j loop

null_jump:
li $t0, 1
li $v0, 4
la $a0, null_char
syscall
j loop
exit:
li       $v0, 10        # exit
syscall                 # exit