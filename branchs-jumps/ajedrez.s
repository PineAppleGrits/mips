# Ajedrez.
.data
ingresar: .asciiz "Ingrese un numero\n" 
true_text: .asciiz "Verdadero"
false_text: .asciiz "Falso"
new_line: .asciiz "\n"
asterisk: .asciiz "*"
space: .asciiz " "
row_text: .asciiz "row"
column_text: .asciiz "column"
.text
.globl main
main:
# PRINT 1 
la $a0, ingresar # print ingresar
li $v0, 4 # print string
syscall
li $v0, 5   # read int
syscall  
# n = $t0
move $t0, $v0
li $t1, 1
# i = $t1
row: 


bgt		$t1, $t0, exit	# if $t1 >= $t0 then target
li $v0, 4
la $a0, new_line
syscall
    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    li $t2, 1
    # j = $t2
    column: 
    li $v0, 4
    la $a0, asterisk
    syscall
    li $v0, 4
    la $a0, space
    syscall
    addi	$t2, $t2, 1			# $t2 = $t2 + 1
    bgt		$t2, $t0, row	# if $t2 > t01 then rowarget
    j column

exit:
li $v0, 10
syscall