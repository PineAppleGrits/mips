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
move     $a0, $v0       # t0 es el numero leido
jal par_fn
move $t3, $v0
li $v0, 1
move $a0, $t3
syscall
exit:
li       $v0, 10        # exit
syscall                 # exit

par_fn:
    li      $s1, 2
    div		$a0, $s1			# $t0 / $t1
    mfhi	$s3					# $t3 = $t0 mod $t1 
    beq		$s3, $zero, fn_true	# if $t0 == $t1 then target
    fn_false:
    li $v0, 0
    j fn_return
    fn_true:
    li $v0, 1
    j fn_return
    fn_return:
    jr		$ra					# jump to $ra
    