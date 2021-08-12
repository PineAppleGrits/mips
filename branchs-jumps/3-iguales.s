
.data
ingresar: .asciiz "Ingrese un numero\n" 
true_text: .asciiz "Iguales"
false_text: .asciiz "No iguales"

.text
.globl main
main:
# PRINT 1 
la $a0, ingresar # print ingresar
li $v0, 4 # print string
syscall
li $v0, 5   # read int
syscall  
move $t0, $v0
#Leer segundo numero
la $a0, ingresar # print ingresar
li $v0, 4 # print string
syscall
li $v0, 5   # read int
syscall  
move $t1, $v0
#LEER 3 NUMERO
la $a0, ingresar # print ingresar
li $v0, 4 # print string
syscall
li $v0, 5   # read int
syscall  
move $t2, $v0
#Calculando primer numero
bne		$t0, $t1, falso	# if $t0 != $t1 then target
beq		$t1, $t2, verdadero	# if $t1 == $t1 then target
falso:
li $v0, 4
la $a0, false_text
syscall
j exit
verdadero: 
li $v0, 4
la $a0, true_text
syscall
j exit
exit:
li $v0, 10
syscall