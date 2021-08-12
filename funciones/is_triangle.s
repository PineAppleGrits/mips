
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
# preparing function
move $a0, $t0
move $a1, $t1
move $a2, $t2
jal is_triangle
move $t3, $v0
li $v0, 1
move $a0, $t3
syscall
j exit
exit:
li $v0, 10
syscall


is_triangle:
#Calculando primer numero
    add		$s3, $a0, $a1		# $t0 = $t1 + $t2
    bge		$s3, $a2, fn_false	# if $t3 >= $t2 then falso
    add		$s3, $a1, $a2		# $t3 = $t1 + $t2
    bge     $s3, $a0, fn_false
    add     $s3, $a0, $a2
    bge		$s3, $a1, fn_false	# if $t3 >= $t1 then falso
    li $v0, 1
    j fn_return
    fn_false:
    li $v0, 0
    j fn_return
    fn_return:
    jr		$ra					# jump to $ra
    