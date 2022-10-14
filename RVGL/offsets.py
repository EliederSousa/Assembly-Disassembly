# 14A9AD668 <- ID
# 14A9AD670 <- 

def h( n ):
    return hex(n)[2:]

#for w in range(count, 35):
#    print("Slot ID: {0}, value: {1}".format(h(offset), h(w)))
#    print("Slot old: {0}, value: {1}".format(h(offset+8), h(offset-27264)))
#    print("Slot new: {0}, value: {1}".format(h(offset+16), h(offset+27264)))
#    offset += 27264


# O último é 14A9AD678
# Lembrar de enviar o Primeiro para a memória de cima, e o próximo do de cima, pra esse primeiro.

print("[ENABLE]")

count = 30
offset = 5546658472
 
for w in range(count, 35):
    print("{0}:\ndq {1}".format(h(offset), h(w)))
    print("{0}:\ndq {1}".format(h(offset+8), h(offset-27264)))
    if (w < (35-1)):
        print("{0}:\ndq {1}".format(h(offset+16), h(offset+27264)))
    else:
        print("{0}:\ndq {1}".format(h(offset+16), 0))
    offset += 27264

print("[DISABLE]")
 
count = 30
offset = 5546658472 
 
for w in range(count, 35):
    print("{0}:\ndq {1}".format(h(offset), 0))
    print("{0}:\ndq {1}".format(h(offset+8), 0))
    print("{0}:\ndq {1}".format(h(offset+16), 0))
    offset += 27264