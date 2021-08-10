# Sumar todos los numeros hasta 100

.data
prompt: .asciiz "La suma de los numeros del 1 al 100 es: "
null_char: .asciiz "\n"

.text
.globl main

main:

loop:

beq		$t3, 101, exit	# if $t0 == $t1 then exit
add		$t1, $t3, $t1		# 1 = $t1 + $t2
addi	$t3, $t3, 1			# $t0 = $t1 + 0
j loop

exit:
#Mostrar suma
li $v0, 4
la $a0, prompt
syscall
li $v0, 1
move $a0, $t1
syscall

li       $v0, 10        # exit
syscall                 # exit