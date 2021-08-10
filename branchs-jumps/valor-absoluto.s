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
abs $t0, $t0            # absolute value

li $v0, 4
la $a0, absoluto_text
syscall
li $v0, 1
move $a0, $t0
syscall
j exit
exit:
li       $v0, 10        # exit
syscall                 # exit