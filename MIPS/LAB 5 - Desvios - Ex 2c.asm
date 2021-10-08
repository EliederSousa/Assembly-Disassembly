.text

# Gerador de números quadrados por soma de números ímpares.
# b = 1;
# // 'a' será o nosso n-ésimo número quadrado perfeito.
# for ( a = 0; a < 101; a += b ) {
#     b += 2;
# }

	addi $s0, $0, 0		# a = 0;
	addi $s1, $0, 1		# b = 1;
	addi $s2, $0, 101	# c = 101;
for:	slt $t0, $s0, $s2	# temp = a < c; // O loop para quando 'a' for igual a 121
 	beq $t0, $0, done	# if ( temp == 0 ) jmp done
	add $s0, $s0, $s1 	# a = a + b;
	addi $s1, $s1, 2
	j for
done:
