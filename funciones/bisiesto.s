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
li $v0, 1
move $a0, $t3
syscall
exit:
li       $v0, 10        # exit
syscall                 # exit



bisiesto_funct:
    li      $s1, 4
    div		$a0, $s1			# $t0 / $s1
    mfhi	$v0				# $t3 = $t0 mod $s1 
    beq		$v0, $zero, fn_true	# if $t0 == $s1 then target
    fn_false:
    li $v0, 0
    j fn_return
    fn_true:
    li $v0, 1
    j fn_return
    fn_return:
    jr		$ra					# jump to $ra
    
