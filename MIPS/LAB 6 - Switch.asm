# Nome: Elieder Damasceno Sousa
# TIA: 32093659		Turma: 03G11

.data
	jTable: .word L1,L2,L3,L4,L5

.text
	la $t4, jTable 		# Carrega o endereço de memória da tabela
	li $s5, 1 		# w
	li $s0, 4		# a
	li $s1, 0		# b = 0
	
	slti $t3, $s5, 1	# $t3 = (w < 1)
	bne $t3, $zero, SAIR	# if ($t3 != 0) jmp SAIR
	slti $t3, $s5, 6	# $t3 = (w < 6)
	beq $t3, $zero, SAIR	# if ($t3 == 0) jmp SAIR
	
	# w = w - 1 (fiz assim por que o switch avalia casos entre 1 e 5, não entre 0 e 4)
	# portanto, o sll nunca carregaria o primeiro endereço da jTable, e daria erro ao tentar carregar
	# quando w = 5 (porque 5 * 4 = 20, e o último endereço da jTable é 16($t1) )
	subi $s5, $s5, 1
	
	sll $t1, $s5, 2		# $t1 = w * 4 
	add $t1, $t1, $t4	# $t1 = &$t4 + $t1 (desloca o endereço $t4, $t1 bytes, e guarda em $t1)
	lw $t0, 0($t1)		# $t0 = *($t1) ($t0 agora é o valor que está dentro do endereço $t1)
	
	jr $t0			# Segue para o Label indicado em $t0
L1:
	slti $t0, $s0, 5	# $t0 = (a < 5)
	beq $t0, $zero, SAIR	# if ($t0 == 0) jmp SAIR
	sll $s1, $s0, 1		# b = a * 2
	j SAIR			# break;
L2:
	slti $t0, $s0, 5	# $t0 = (a < 5)
	beq $t0, $zero, ELSE	# if ($t0 == 0) jmp ELSE
	sll $s1, $s0, 2		# b = a * 4
	j SAIR			# endif
ELSE:	
	sll $s1, $s0, 3		# b = a * 8
	j SAIR			# break;
L3:
WHILE:	
	beq $s0, $zero, SAIR	# if (a == 0) jmp SAIR
	add $s1, $s1, $s0	# b += a;
	subi $s0, $s0, 1	# a--;
	j WHILE 
	j SAIR			# break;
L4:
DO:
	add $s1, $s1, $s0	# b += a;
	subi $s0, $s0, 1	# a--;
	bne $s0, $zero, DO	# if (a != 0) jmp DO
	j SAIR			# break;
L5:
	addi $s2, $zero, 0	# c = 0;
FOR:
	slti $t0, $s2, 10	# $t0 = (c < 10)
	beq $t0, $zero, SAIR	# if ($t0 == 0) jmp SAIR
	add $s1, $s1, $s2 	# b += c;
	add $s2, $s2, 1		# c++;
	j FOR
	j SAIR			# break;
SAIR: