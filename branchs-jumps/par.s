# saber numero par

.data
prompt: .asciiz "Ingrese el numero: "
par_true: .asciiz "El numero es par."
par_false: .asciiz "El numero no es par."

.text
.globl main

main:

li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
li       $t1, 2

div		$t0, $t1			# $t0 / $t1
mfhi	$t3					# $t3 = $t0 mod $t1 

beq		$t3, $zero, par	# if $t0 == $t1 then target
li $v0, 4  #print 
la $a0, par_false # print mensaje de no par
syscall #print numero no es par
j exit # jump to exit
par:
li $v0, 4 # print
la $a0, par_true # print numero es par
syscall # print
j		exit				# jump to target
exit:
li       $v0, 10        # exit
syscall                 # exit