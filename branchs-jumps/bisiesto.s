# saber año bisiesto

.data
prompt: .asciiz "Ingrese el año: "
bisiesto_true: .asciiz "El año es bisiesto."
bisiesto_false: .asciiz "El año no es bisiesto. "

.text
.globl main

main:

li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
li       $t1, 4

div		$t0, $t1			# $t0 / $t1
mfhi	$t3					# $t3 = $t0 mod $t1 

beq		$t3, $zero, bisiesto	# if $t0 == $t1 then target
li $v0, 4  #print 
la $a0, bisiesto_false # print mensaje de no bisiesto
syscall #print año no es bisiesto
j exit # jump to exit
bisiesto:
li $v0, 4 # print
la $a0, bisiesto_true # print año es bisiesto
syscall # print
j		exit				# jump to target
exit:
li       $v0, 10        # exit
syscall                 # exit