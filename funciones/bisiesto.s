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
syscall                 # printf("Ingrese el año: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $a0, $v0       # t0 es el numero leido
jal		bisiesto_funct				# jump to bisiesto_funct and save position to $ra
move $t3, $v0
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



bisiesto_funct:
    li      $t1, 4
    div		$a0, $t1			# $t0 / $t1
    mfhi	$v0					# $t3 = $t0 mod $t1 
    jr		$ra					# jump to $ra
    
