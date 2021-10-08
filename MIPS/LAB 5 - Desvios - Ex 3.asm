.data
	a: .word 2,3,5,7,11,13,17,19,23,29	# a = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];

.text
	la $s0, a	# $s0 = a; // Lembrando que 'a' � um endere�o de mem�ria (ponteiro). 
	li $s1, 0	# $s1 = b;
	li $s2, 0	# $s2 = sa�da;
	li $t0, 40	# $t0 = 40; // Tamanho da array em bytes.
	li $t2, 0	# vari�vel para guardar o endere�o de 'a' a ser trabalhado.
	li $t3, 10	# Tamanho da array em n�mero de �ndices.
for:	slt $t1, $s1, $t0	# $t1 = b < 40;
	beq $t1, $0, done	# if ( $t1 == 0 ) jmp done
	add $t2, $s0, $s1	# $t2 = &a[b]
	lw $t4, 0($t2)		# $t4 = a[b];
	add $s2, $s2, $t4	# saida = saida + a[b];
	addi $s1, $s1, 4	# b = b + 4
	j for
done:
	div $s2, $t3		# saida /= 10;
	mflo $s2		# sa�da = saida // 10; Pegando o quociente da divis�o (inteiro)
	sw $s2, 0($s0)		# Colocando este resultado em a[0].