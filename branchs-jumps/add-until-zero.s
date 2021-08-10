# Sumar numeros hasta que se ingrese 0,

.data
prompt: .asciiz "Ingrese un numero, si desea detener las instrucciones ingrese 0: "
sum_all: .asciiz "La suma de los numeros ingresados es:  "

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
j loop

exit:
li $v0, 4
la $a0, sum_all
syscall
li $v0, 1
move $a0, $t1
syscall
li       $v0, 10        # exit
syscall                 # exit