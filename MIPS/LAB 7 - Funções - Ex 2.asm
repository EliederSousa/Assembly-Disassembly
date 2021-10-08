.data
	dados: .word 2,3,5,7,11,13,17,19	# a = [2,3,5,7,11,13,17,19];

.text
	la $s0, dados	# endere�o de mem�ria da array.

	# int sum (int A [], int primeiro, int �ltimo)
	la $a0, dados		# $a0 = A[]
	li $a1, 0		# $a1 = primeiro
	li $a2, 7		# $a2 = ultimo
	
	li $s1, 0		# b = 0;
	li $t0, 8		# $t0 = tamanho do array
	
	jal SUM			# sum(a, 0, 7);
	
	div $v0, $t0		# sum / tamanhoDoArray
	mflo $s1		# b = sum // tamanhoDoArray (quociente -> parte inteira)
	
	j EXIT
	
SUM:
	# Armazenando na stack os valores que ser�o usados pela fun��o.
	addi $sp, $sp, -24
	sw $t0, 20($sp)
	sw $t1, 16($sp)
	sw $t2, 12($sp)
	sw $t3, 8($sp)
	sw $t4, 4($sp)
	sw $s1, 0($sp)
	
	# Corpo da fun��o
	li $s1, 0		# soma = 0;
	add $t0, $0, $a0	# $t0 = $a0		-> $t0 = &A[] (endere�o do vetor)
	add $t1, $0, $a1	# $t1 = $a1 		-> $t1 = w = primeiro
	add $t2, $0, $a2	# $t2 = $a2 		-> $t2 = ultimo
	addi $t2, $t2, 1	# $t2 += 1		-> $t2 = ultimo + 1 (para poder processar o �ltimo)
	
FOR:	slt $t3, $t1, $t2	# $t3 = ($t1 < $t2)	-> if (primeiro < �ltimo + 1)
	beq $t3, $zero, DONE	# if (primeiro >= ultimo + 1) jmp DONE
	
	lw $t4, 0($t0)		# $t4 = *$t0		-> $t4 = A[w]
	add $s1, $s1, $t4	# soma += A[N]
	addi $t0, $t0, 4	# $t0 += 4		-> $t0 = A[w+1]
	addi $t1, $t1, 1	# w++;
	j FOR
DONE:	add $v0, $s1, $0	# retorno da fun��o
	
	# Desempilha a stack para terminar a fun��o.
	lw $s1, 0($sp)
	lw $t4, 4($sp)
	lw $t3, 8($sp)
	lw $t2, 12($sp)
	lw $t1, 16($sp)
	lw $t0, 20($sp)
	addi $sp, $sp, 24
	
	# retorna de onde parou no fluxo do programa.
	jr $ra
EXIT:
	
