# valor absoluto de un numero

.data
prompt: .asciiz "Ingrese el numero: "
absoluto_text: .asciiz "El valor absoluto es: "

.text
.globl main

main:

li       $v0, 4         # print_str code
la       $a0, prompt    #
syscall                 # printf("Ingrese un numero: ")

li       $v0, 5         # read_int code
syscall                 # scanf("%d", &n)
move     $t0, $v0       # t0 es el numero leido
move $a0, $t0
jal		absolute_fn				# jump to absolute_fn and save position to $ra
move $t0, $v0
li $v0, 1
move $a0, $t0
syscall
exit:
li       $v0, 10        # exit
syscall                 # exit

absolute_fn:
    abs $v0, $a0
    jr		$ra					# jump to $ra
    