#################################################
#        Procedimento responsável por		#
#   printar o background no bitmap display	#
#   sem se importar com as coordenadas		#
#################################################

#################################
#	Argumentos		#
#################################
# 	a0 = frame		#
# 	a1 = LABEL		#
#################################


.text
PRINT_BACKGROUND:
	li t1,0xFF000000	# endereco inicial da Memoria VGA - Frame 0
	li t2,0xFF012C00	# endereco final - Frame 0
	li t3,0
	bgtz  a0, SOMA_PB
	j INICIO_PB
SOMA_PB:
	li a0, 0x00100000
	add t1,t1,a0		# Endereço Inicial - Frame 1 - 0xFF100000
	add t2,t2,a0		# Endereço Final - Frame 1 - 0xFF112C00
INICIO_PB:
	addi a1,a1,8		# primeiro pixels depois das informações de nlin ncol
LOOP1_PB: 
	beq t1,t2,FIM_PB	# Se for o último endereço então sai do loop
	lw t3,0(a1)		# le um conjunto de 4 pixels : word
	sw t3,0(t1)		# escreve a word na memória VGA
	addi t1,t1,4		# soma 4 ao endereço
	addi a1,a1,4
	j LOOP1_PB		# volta a verificar
FIM_PB:
	ret
