# Sumar numeros hasta que se ingrese 0 y dar promedio

.data
prompt: .asciiz "Ingrese un numero, si desea detener las instrucciones ingrese 0: "
sum_all: .asciiz "La suma de los numeros ingresados es:  "
avr_all: .asciiz "El promedio de los numeros ingresados es:  "
null_char: .asciiz "\n"

.text
.globl main

main:

loop:
li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")
li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
beq		$t0, $zero, exit	# if $t0 == $t1 then exit
add		$t1, $t1, $t0		# 1 = $t1 + $t2
addi	$t3, $t3, 1			# $t0 = $t1 + 0
j loop

exit:
#Mostrar suma
li $v0, 4
la $a0, sum_all
syscall
li $v0, 1
move $a0, $t1
syscall
# / Suma
li $v0, 4
la $a0, null_char
syscall
li $v0, 4
la $a0, avr_all
syscall
li $v0, 1
div		$t3, $t1, $t3		# $t0 / $t1
move $a0, $t3
syscall
li       $v0, 10        # exit
syscall                 # exit