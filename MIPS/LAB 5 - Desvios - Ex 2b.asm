.text
	addi $s0, $0, 0 	# a = 0;
	addi $s1, $0, 1 	# b = 1; b será o n-ésimo termo da sequência de Fibonacci.
	addi $s2, $0, 0		# c = 0;
	
while: 	beq $s1, 377, done	# Enquanto não chegar no termo 14
	add $s2, $0, $s1	# c = b
	add $s1, $s0, $s1	# b = a + b
	add $s0, $0, $s2	# a = c	
	
	j while
done: