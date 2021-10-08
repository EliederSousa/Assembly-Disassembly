.data
	a: 		.float 2.3, 4.5, 5.7, 6.11, 13.17, 19.23, 24.2
	soma: 		.float 0.0
	tamanho:	.float 7.0
	saidaparcial: 	.asciiz "\nSoma parcial: "
	media:		.asciiz "\n\nMedia: " 
	
.text
	la $s0, a		# a = [2.3, 4.5, 5.7, 6.11, 13.17, 19.23, 24.2];
	la $s4, soma
	la $s5, tamanho
	li $s1, 7		# tamanho = 7;
	li $t2, 0		# deslocamento = 0;
	l.s $f0, ($s4)		# soma = 0.0;
	l.s $f2, ($s5)		# tamanho = 7.0 		(em float para a divisão)
	
	# Calculando a média dos valores do vetor.
	# for ( int w = 0; w < tamanho; w++ ) {
	addi $t0, $t0, 0	# int w = 0;
FOR:	slt $t1, $t0, $s1	# condicao = w < tamanho; 	($t1 = $t0 < $s1)
	beq $zero, $t1, PRINT
	
	l.s $f1, 0($s0)		# temp = a[w]; 			($f1 = *a)
	add.s $f0, $f0, $f1	# soma += temp;			($f0 += $f1)
	
	#### Imprime a soma parcial no console ####
	la $a0, saidaparcial
	li $v0, 4
	syscall
	
	mtc1 $zero, $f12 	# zera o registrador $f12
	add.s $f12, $f12, $f0
	li $v0, 2
	syscall
	###########################################
	
	addi $s0, $s0, 4	# &a += 4; 			( a[w] )
	addi $t0, $t0, 1	# w++;
	j FOR
	
PRINT:
	div.s $f12, $f0, $f2		# soma /= tamanho;
	
	# Imprime a saída final.
	la $a0, media
	li $v0, 4
	syscall
	
	li $v0, 2
	syscall
