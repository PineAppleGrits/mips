.data
ingresar: .asciiz "Ingrese un numero\n" 
fact_0: .asciiz "El factorial de 0 es 1\n"
fact_print: .asciiz "El factorial de \n" 

.text
.globl main
main:
li $t1, 1
la $a0, ingresar # print ingresar
li $v0, 4 # print string
syscall
li $v0, 5   # read int
syscall  
move $t0, $v0     # Valor leido pasa a t0
beq $t0, $zero, fact_zero   #Si t0 es 0, ir a fact_zero

fact: # Calculo de factor
beq $t0, $zero, final
mul $t1, $t1, $t0   #multiplicar t1 = t1 * t0,      factor = factor * valor leido
addi $t0, $t0, -1        # valor leido -1  
j fact
final:
move $a0, $t1
li $v0, 1
syscall
j exit
fact_zero: # SI t0 es zero mostrar mensaje y salir
la $a0, fact_0
li $v0, 4
syscall
j exit
exit:
li $v0, 10
syscall