#Inicialização dos exercícios
# Arquitetura de Computadores
# Prof. Wilian F. Costa

.data
a:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

b:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26

c:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31

.text
la $s0,a
la $s1,b
la $s2,c

# i: i.	a = b[12] + c;

lw $t0, 48($s1)
lw $t1, 0($s2)
add $t2, $t0, $t1
sw $t2, 0($s0)
