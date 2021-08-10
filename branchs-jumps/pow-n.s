# potencia de un numero

.data
prompt: .asciiz "Ingrese la cantidad de veces a potenciar 2: "
result: .asciiz "\nEl resultado es :  "

null_char: .asciiz "\n"

.text
.globl main

main:
li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")
li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t2, $v0       # t0 es el numero leido
li $t0, 1
loop:
li $t4, 2
beq		$t2, $t3, exit	# if $t0 == $t1 then exit
mult	$t0, $t4		# $t0 * $t1 = Hi and Lo registers
mflo	$t0					# copy Lo to $t2
addi	$t3, $t3, 1			# $t0 = $t1 + 0
j loop

exit:
li $v0, 4
la $a0, result
syscall
li $v0, 1
move $a0, $t0
syscall
# / Suma
li       $v0, 10        # exit
syscall                 # exit