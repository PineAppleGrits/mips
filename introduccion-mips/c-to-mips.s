#f = g + (h - 5);

.data

example: .asciiz "f = g + (h - 5)\n" 
prompt_1: .asciiz "Ingrese g: " # G to t0
prompt_2: .asciiz "Ingrese h: " # h to t1
equal: .asciiz " = "
multiply: .asciiz " x "
plus: .asciiz " + "
subs: .asciiz " - "
bracket_l: .asciiz "("
bracket_r: .asciiz ")"

.text
.globl main

main:
# print example
li $v0, 4
la      $a0, example
syscall
# PRINT 1 
li       $v0, 4         # print_str code
la       $a0, prompt_1    #
syscall                 # printf("Ingrese un g: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
# PRINT 2
li       $v0, 4         # print_str code
la       $a0, prompt_2    #
syscall                 # printf("Ingrese un h: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t1, $v0       # t0 es el numero leido
# Substract h -5 
sub		$t2, $t1, 5		# $t0 = $t1 - $t2
add		$t3, $t0, $t1		# $t0 = $t1 + $t2
# PRINT Dividendo
li $v0, 1
move $a0, $t3
syscall
#print equal
li $v0, 4
la $a0, equal
syscall
# print G
li $v0, 1
move $a0, $t0
syscall
#print sum
li $v0, 4
la $a0, subs
syscall
#print bracket_l
li $v0, 4
la $a0, bracket_l
syscall
# print h
li $v0, 1
move $a0, $t1
syscall
#print equal
li $v0, 4
la $a0, bracket_r
syscall



exit:
li       $v0, 10        # exit
syscall                 # exito