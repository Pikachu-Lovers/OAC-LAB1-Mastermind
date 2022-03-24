#########################################
#   Procedimento responsável por	#
#   Verificar as cores enviadas		#
#   e printar os respectivos pinos	#
#   pretos ou brancos			#
#########################################
.data 
GABARITO_USED: .byte 0, 0, 0, 0
TENTATIVA_USED: .byte 0, 0, 0, 0
PRETO_BOOL: .byte 0
PRETO_QTD: .byte 0
.text
VERIFICA_PINOS:
	addi sp, sp, -8	# Desloca memória pro SP
	sw ra, 0(sp)	# Empilha o RA
	
	li s10, 0 	# i=0
	li s11, 4	# Limite i;
LOOP_1:				# Começa Loop do PRETO
	beq s10, s11, FIM_LOOP_1# s10 salvar
	la a4, GABARITO_CORES	# GABARITO
	la a5, TENTATIVA_CORES	# TENTATIVA
	add s8, a4, s10		# Equivalente ao Gabarito[i]
	add s7, a5, s10		# Equivalente a Tentativa[i]
	lb t3, 0(s8)		# Carrega o elemento Gabarito[i]
	lb t4, 0(s7)		# Carrega o elemento Tentativa[i]
	
	sw s10, 4(sp)		# Salva s10
	addi t6, s10, 0		# t6 = s10
	beq t3, t4, DEFINE_PRETO
VOLTA_LOOP_1:
	addi s10, s10, 1	# i++
	j LOOP_1
FIM_LOOP_1:
	la a4, PRETO_BOOL
	lb s10, 0(a4)
	addi s10, s10, 1
	sb s10, 0(a4)
	li s10, 0		# i=0
	li s11, 4		# tam=4
INICIO_LOOP_2:			# Começo do LOOP pra checar o BRANCO
	beq s10, s11, ENCERRA_VERIFICA#i<4
	la a4, GABARITO_USED
	add s8, a4, s10		#GABARITO_USED[i]
	lb t3, 0(s8)
	bnez t3, FIM_LOOP_2	# if USED -> NAO_PASSOU
	
	li t6, 0		# Contador j=0
INICIO_LOOP_3:
	beq t6, s11, FIM_LOOP_2	# j==4
		
	la a4, GABARITO_CORES
	la a5, TENTATIVA_CORES
	add s8, a4, s10		# Equivalente ao Gabarito[i]
	add s7, a5, t6		# Equivalente a Tentativa[i]
	lb t3, 0(s8)		# Carrega o elemento Gabarito[i]
	lb t4, 0(s7)		# Carrega o elemento Tentativa[i]
	beq t6, s10, FIM_LOOP_3	# i == j
	bne t4, t3, FIM_LOOP_3	# Gabarito[i]!=Tentativa[i]
		
	la a5, TENTATIVA_USED
	add s7, a5, t6		# Tentativa[i]
	lb t4, 0(s7)
	bnez t4, FIM_LOOP_3	# ff USED -> NAO_PASSOU
		
	j DEFINE_BRANCO		# Vai para o Branco
FIM_LOOP_3:
	addi t6, t6, 1		# j++
	j INICIO_LOOP_3
FIM_LOOP_2:
	addi s10, s10, 1	# i++
	j INICIO_LOOP_2
	
	
ENCERRA_VERIFICA:
	j FIM_TOTAL		# Encerra os LOOPS
	
	
DEFINE_PRETO:
	la a4, PRETO_QTD
	lb t3, 0(a4)
	addi t3, t3, 1
	sb t3, 0(a4)
	la a3, PINO_PRETO	# Escolhe a imagem do PINO_PRETO	
	j PRINTA

DEFINE_BRANCO:
	la a3, PINO_BRANCO	# Escolhe a imagem do PINO_BRANCO
	j PRINTA
PRINTA:
	la a5, PINOS_QTD
	lb s0, 0(a5)	# Pega quantos pinos foram printados
	li s1, 0
	li s2, 1
	li s3, 2
	li s4, 3
	beq s0, s1, PINO_1_1
	beq s0, s2, PINO_1_2
	beq s0, s3, PINO_2_1
	beq s0, s4, PINO_2_2

# Escolhe a coordenada que irá printar o pino de acordo com os pinos atuais
PINO_1_1:
	li s0, 212
	li s1, 3
	li s2, 21
	la a5, LINHA
	lb s3, 0(a5)
	
	addi s3, s3, -1
	mul s3, s3, s2
	add s3, s3, s1
	
	mv a1, s0
	mv a2, s3
	j PRINTA_IMAGEM
PINO_1_2:
	li s0, 224
	li s1, 3
	li s2, 21
	la a5, LINHA
	lb s3, 0(a5)
	
	addi s3, s3, -1
	mul s3, s3, s2
	add s3, s3, s1
	
	mv a1, s0
	mv a2, s3
	j PRINTA_IMAGEM
PINO_2_1:

	li s0, 212
	li s1, 12
	li s2, 21
	la a5, LINHA
	lb s3, 0(a5)
	
	addi s3, s3, -1
	mul s3, s3, s2
	add s3, s3, s1
	
	mv a1, s0
	mv a2, s3
	j PRINTA_IMAGEM

PINO_2_2:

	li s0, 224
	li s1, 12
	li s2, 21
	la a5, LINHA
	lb s3, 0(a5)
	
	addi s3, s3, -1
	mul s3, s3, s2
	add s3, s3, s1
	
	mv a1, s0
	mv a2, s3
	j PRINTA_IMAGEM
	
PRINTA_IMAGEM:
	li a0, 0
	call PRINT_IMAGE
	la a6, PINOS_QTD
	lb s5, 0(a6)
	addi s5, s5, 1	
	sb s5, 0(a6)	# PINOS_QTD++
	
	la a6, GABARITO_USED
	add a6, a6, s10
	lb s5, 0(a6)
	addi s5, s5, 1
	sb s5, 0(a6)	# GABARITO[i]++
	
	la a6, TENTATIVA_USED
	add a6, a6, t6
	lb s5, 0(a6)
	addi s5, s5, 1
	sb s5, 0(a6)	# TENTATIVA[i]++
	
	la a6, PRETO_BOOL
	lb s5, 0(a6)	
	beqz s5, TOCA_PRETO	# if PRETO_BOOL==0 vai pro LOOP do PRETO
	j TOCA_BRANCO		# vai pro LOOP do BRANCO

TOCA_PRETO:
	
	li a0,60	
    	li a1,250
    	li a2, 104
    	li a3, 90
    	li a7, 33
    	ecall

    	li a0,60
    	li a1,250
    	li a2, 105
    	li a3, 90
    	li a7, 33
    	ecall

    	li a0,60
    	li a1,250
    	li a2, 106
    	li a3, 90
    	li a7, 33
   	ecall
	

	j VOLTA_LOOP_1

TOCA_BRANCO:
	
	li a0,60
    	li a1,250
    	li a2, 49
    	li a3, 90
    	li a7, 33
    	ecall

    	li a0,60
    	li a1,250
    	li a2, 53
    	li a3, 90
    	li a7, 33
    	ecall

    	li a0,60
    	li a1,250
    	li a2, 55
    	li a3, 90
    	li a7, 33
   	ecall
	
	j FIM_LOOP_2

FIM_TOTAL:
		
	lw ra, 0(sp)		# Coloca o valor de inicio do RA nele novamente
	addi sp, sp, 8
	ret
