.data
ingresar: .asciiz "Ingrese un numero\n" 
true_text: .asciiz "Verdadero"
false_text: .asciiz "Falso"

.text
.globl main
main:
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
div		$t0, $t1			# $t0 / $t1
mfhi	$t3				# $t3 = $t0 mod $t1 
beq $t3, $zero, verdadero
j falso
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