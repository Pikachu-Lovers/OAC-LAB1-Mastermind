#########################################
#   Procedimento responsável por 	#
#   verificar a quantidade de cores	#
#   e baseado nisso, dizer qual a fase	#
#   que o jogador está			#
#########################################

.text

PRINTA_NUMERO:
	addi sp, sp, -4
	sw ra, 0(sp)
	
	la s0, CORES
	lb s1, 0(s0)	# valor de COR a ser CHECADO
		
	li a0, 0
	li a1, 4
	li a2, 2
	
	li s2, 5
	li s3, 6
	li s4, 7
	li s5, 8
	li s6, 9
	li s7, 10
	li s8, 11
	li s9, 12
	li s10, 13
	li s11, 14
	li t0, 15
	li t1, 16
	li t2, 17
	li t3, 18
	li t4, 19
	beq s1, s2, PRINTA_UM
	beq s1, s3, PRINTA_DOIS
	beq s1, s4, PRINTA_TRES
	beq s1, s5, PRINTA_QUATRO
	beq s1, s6, PRINTA_CINCO
	beq s1, s7, PRINTA_SEIS
	beq s1, s8, PRINTA_SETE
	beq s1, s9, PRINTA_OITO
	beq s1, s10, PRINTA_NOVE
	beq s1, s11, PRINTA_DEZ
	beq s1, t0, PRINTA_ONZE
	beq s1, t1, PRINTA_DOZE
	beq s1, t2, PRINTA_TREZE
	beq s1, t3, PRINTA_CATORZE
	beq s1, t4, PRINTA_QUINZE
	
	
PRINTA_UM:
	la a3, UM
	j PRINTA_IMAGEM_NUMERO
PRINTA_DOIS:
	la a3, DOIS
	j PRINTA_IMAGEM_NUMERO
PRINTA_TRES:
	la a3, TRES
	j PRINTA_IMAGEM_NUMERO
PRINTA_QUATRO:
	la a3, QUATRO
	j PRINTA_IMAGEM_NUMERO
PRINTA_CINCO:
	la a3, CINCO
	j PRINTA_IMAGEM_NUMERO
PRINTA_SEIS:
	la a3, SEIS
	j PRINTA_IMAGEM_NUMERO
PRINTA_SETE:
	la a3, SETE
	j PRINTA_IMAGEM_NUMERO
PRINTA_OITO:
	la a3, OITO
	j PRINTA_IMAGEM_NUMERO
PRINTA_NOVE:
	la a3, NOVE
	j PRINTA_IMAGEM_NUMERO
PRINTA_DEZ:
	la a3, DEZ
	j PRINTA_IMAGEM_NUMERO
PRINTA_ONZE:
	la a3, ONZE
	j PRINTA_IMAGEM_NUMERO
PRINTA_DOZE:
	la a3, DOZE
	j PRINTA_IMAGEM_NUMERO
PRINTA_TREZE:
	la a3, TREZE
	j PRINTA_IMAGEM_NUMERO
PRINTA_CATORZE:
	la a3, CATORZE
	j PRINTA_IMAGEM_NUMERO
PRINTA_QUINZE:
	la a3, QUINZE
	j PRINTA_IMAGEM_NUMERO
PRINTA_IMAGEM_NUMERO:
	call PRINT_IMAGE
FIM_NUMERO:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
