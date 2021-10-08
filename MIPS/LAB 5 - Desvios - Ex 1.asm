# Inicialização dos exercícios
# Arquitetura de Computadores

.data
a:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
b:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26
c:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31

.text
la $s0,a
la $s1,b
la $s2,c

# Adicionando valores imediatos para testar o algoritmo
addi $s3, $zero, 5
addi $s4, $zero, 4

beq $s3, $s4, L2	 # if ( x == y ) jmp L2

lw $t0, 4($s0) 		 # $t0 = a[1]  ----|
lw $t1, 0($s1)		 # $t1 = b         |--> Carregando os valores 
lw $t2, 0($s2)		 # $t2 = c     ----|

sub $t0, $t1, $t2	 # a[1] = b - c
sw $t0, 4($s0)		 # Guardando o valor no endereço a[1]

lw $t3, 8($s0)           # $t3 = a[2]  --> Carregando o valor
add $t1, $t3, $t2        # b = a[2] + c
sw $t1, 8($s0)		 # Guardando o valor no endereço a[2]

lw $t4, 12($s2)	   	 # $t4 = c[3]  --> Carregando o valor                       
add $t2, $t1, $t4        # c = b + c[3]
sw $t2, 12($s0)		 # Guardando o valor no endereço c[3]

j DONE

L2:
	lw $t0, 16($s0)	 	# $t0 = a[4] ----|
	lw $t1, 24($s0)  	# $t1 = a[6]     |--> Carregando os valores
	lw $t2, 20($s0)  	# $t2 = a[5] ----|
	
	add $t0, $t1, $t2 	# a[4] = a[6] + a[5]
	sw $t0, 16($s0) 	# Guardando o valor no endereço a[4]

DONE:
