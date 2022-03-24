#################################
# Procedimento responsável por	#
# Verificar a tecla do teclado	#
# e printar sua respectiva cor	#
# no tabuleiro			#
#################################

#########################
#      Argumentos	#
#########################
#			#
#    a0 = CARACTER	#
#    a1 = N atual	#
#			#
#########################


.text
SELECAO_COR:
	la a3, COLUNA
	la a2, TENTATIVA_CORES
	li t5, 4
	# Para saber em qual posição do Vetor TENTATIVA_CORESS irá armazenar
	# ((Coluna-1)*2) + Endereço Inicial
	lb t3, 0(a3)		# Guarda em t3 o valor da Coluna Atual
	mv t6, t3
	li t4, 1		# t4=1
	sub t3, t3, t4		# Coluna-1
	la t4, TENTATIVA_CORES	# Salva em t4 o Endereço Inicial de TENTATIVA_CORES
	add t4, t4, t3		# Endereço a ser Armazenado = (Coluna-1) + Endereço Inicial
	bgt t6, t5, LBL_APG
	# APAGAR
	li t0, 8
	beq a0, t0, APAGAR
	
	li t1, 0	# Contador
	
	# A
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 65
	beq a0, t0, AMARELO_COR
	
	# B
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 66
	beq a0, t0, VERMELHO_COR
	
	# C
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 67
	beq a0, t0, AZUL_COR
	
	# D
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 68
	beq a0, t0, VERDE_COR
	
	# E
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 69
	beq a0, t0, PRETO_COR
	
	# F
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 70
	beq a0, t0, BRANCO_COR
	
	# G
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 71
	beq a0, t0, LARANJA_COR
	
	# H
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 72
	beq a0, t0, ROXO_COR
	
	# I
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 73
	beq a0, t0, BEGE_COR
	
	# J
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 74
	beq a0, t0, GOIABA_COR
	
	# K
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 75
	beq a0, t0, AZUL_BEBE_COR
	
	# L
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 76
	beq a0, t0, VINHO_COR
	
	# M
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 77
	beq a0, t0, ROSA_COR
	
	# N
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 78
	beq a0, t0, CIANO_COR
	
	# O
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 79
	beq a0, t0, VERDE_ESCURO_COR
	
	# P
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 80
	beq a0, t0, DOURADO_COR
	
	# Q
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 81
	beq a0, t0, IRIS_COR
	
	# R
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 82
	beq a0, t0, ROSA_PINK_COR
	
	# S
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 83
	beq a0, t0, VERDE_PASTEL_COR
	
	# T
	addi t1, t1, 1
	bgt t1, a1, NAO_ACHOU
	li t0, 84
	beq a0, t0, SEPIA_COR
	
LBL_APG:
	# APAGAR
	li t0, 8
	beq a0, t0, APAGAR
	
	# ENTER
	li t0, 10
	beq a0, t0, ENTER
	
	j NAO_ACHOU
AMARELO_COR:
	li a0, 60 	#Tom
	li a1, 500	#Duração
	li a2, 4	#Instrumento
	li a3, 90	#Volume
	li a7,31
	ecall		#Toca a nota
	
	li t2, 0	# Amarelo = 0
	sb t2, 0(t4)	# Armazena no Endereço Atual
	la a0, AMARELO
	j FIM
VERMELHO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 5
	li a3, 90	
	li a7,31
	ecall		

	li t2, 1
	sb t2, 0(t4)
	la a0, VERMELHO
	j FIM
AZUL_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 6
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 2
	sb t2, 0(t4)
	la a0, AZUL
	j FIM
VERDE_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 7
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 3
	sb t2, 0(t4)
	la a0, VERDE
	j FIM
PRETO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 8
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 4
	sb t2, 0(t4)
	la a0, PRETO
	j FIM
BRANCO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 9
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 5
	sb t2, 0(t4)
	la a0, BRANCO
	j FIM
LARANJA_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 10
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 6
	sb t2, 0(t4)
	la a0, LARANJA
	j FIM
ROXO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 11
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 7
	sb t2, 0(t4)
	la a0, ROXO
	j FIM
BEGE_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 12
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 8
	sb t2, 0(t4)
	la a0, BEGE
	j FIM
GOIABA_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 13
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 9
	sb t2, 0(t4)
	la a0, GOIABA
	j FIM
AZUL_BEBE_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 14
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 10
	sb t2, 0(t4)
	la a0, AZUL_BEBE
	j FIM
VINHO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 15
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 11
	sb t2, 0(t4)
	la a0, VINHO
	j FIM
ROSA_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 64
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 12
	sb t2, 0(t4)
	la a0, ROSA
	j FIM
CIANO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 65
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 13
	sb t2, 0(t4)
	la a0, CIANO
	j FIM
VERDE_ESCURO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 66
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 14
	sb t2, 0(t4)
	la a0, VERDE_ESCURO
	j FIM
DOURADO_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 67
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 15
	sb t2, 0(t4)
	la a0, DOURADO
	j FIM
IRIS_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 68
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 16
	sb t2, 0(t4)
	la a0, IRIS
	j FIM
ROSA_PINK_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 69
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 17
	sb t2, 0(t4)
	la a0, ROSA_PINK
	j FIM
VERDE_PASTEL_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 70
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 18
	sb t2, 0(t4)
	la a0, VERDE_PASTEL
	j FIM
SEPIA_COR:
	li a0, 60 	
	li a1, 500	
	li a2, 71
	li a3, 90	
	li a7,31
	ecall
	
	li t2, 19
	sb t2, 0(t4)
	la a0, SEPIA
	j FIM
NAO_ACHOU:
	li a0, -1
	j FIM
	
APAGAR:
	li t2, 30
	addi t4, t4, -1
	sb t2, 0(t4)
	li a0, -2
	j FIM

ENTER:
	
	lb a3, 0(a3)
	li t2, 5
	bne a3, t2, NAO_ACHOU
	li a0, -3
FIM:
	ret



