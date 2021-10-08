# a = 5
# b = 5

.text
	addi $s0, $0, 5
	addi $s1, $0, 5

	beq $s0, $s1, ELSE
	sub $s2, $s0, $s1
	j DONE

ELSE:
	addi $s2, $0, 10

DONE:
