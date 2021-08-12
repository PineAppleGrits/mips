
.data
ingresar: .asciiz "Ingrese un numero\n" 
true_text: .asciiz "Verdadero"
false_text: .asciiz "Falso"

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
add		$t3, $t0, $t1		# $t0 = $t1 + $t2
bge		$t3, $t2, falso	# if $t3 >= $t2 then falso
add		$t3, $t1, $t2		# $t3 = $t1 + $t2
bge     $t3, $t0, falso
add     $t3, $t0, $t2
bge		$t3, $t1, falso	# if $t3 >= $t1 then falso
j verdadero
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