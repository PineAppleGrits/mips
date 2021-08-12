# valor absoluto de un numero

.data
prompt_1: .asciiz "Ingrese el primer numero: "
prompt_2: .asciiz "Ingrese el segundo numero: "
equal: .asciiz " = "
multiply: .asciiz " x "
plus: .asciiz " + "
.text
.globl main

main:
# PRINT 1 
li       $v0, 4         # print_str code
la       $a0, prompt_1    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
# PRINT 2
li       $v0, 4         # print_str code
la       $a0, prompt_2    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t1, $v0       # t0 es el numero leido
# DIV
div		$t3, $t0, $t1 			# $t0 / $t1
mfhi	$t4					# $t3 = $t0 mod $t1 
# PRINT Dividendo
li $v0, 1
move $a0, $t0
syscall
#print equal
li $v0, 4
la $a0, equal
syscall
# print divisor
li $v0, 1
move $a0, $t3
syscall
#print multiply
li $v0, 4
la $a0, multiply
syscall
# print divisor
li $v0, 1
move $a0, $t1
syscall
# CHECK IF HAS MODULE
beq		$t4, $zero, exit	# if $t0 == $t1 then exit
#print sum
li $v0, 4
la $a0, plus
syscall
# print resto
li $v0, 1
move $a0, $t4
syscall


exit:
li       $v0, 10        # exit
syscall                 # exito