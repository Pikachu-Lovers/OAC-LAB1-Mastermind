.text
#################################
# Procedimento responsável por	#
# após ganhar ou perder		#
# mostrar o gabarito na resposta#
#################################

MOSTRA_GABARITO:
	addi sp, sp, -16
	sw ra, 0(sp)
	
	
	li t0, 0	# Contador
	li t1, 4
LOOP_GABARITO:
	beq t0, t1, FIM_GABARITO
	la a1, GABARITO_CORES
	add a1, a1, t0
	lb a7, 0(a1)
	sw a7, 4(sp)

DEFINE_X:
	li t2, 0
	li t3, 1
	li t4, 2
	li t5, 3
	
	beq t0, t2, PRIMEIRO_X
	beq t0, t3, SEGUNDO_X
	beq t0, t4, TERCEIRO_X
	beq t0, t5, QUARTO_X

PRIMEIRO_X:
	li a1, 76
	li a2, 218
	j DEFINE_COR
SEGUNDO_X:
	li a1, 104
	li a2, 218
	j DEFINE_COR
TERCEIRO_X:
	li a1, 132
	li a2, 218
	j DEFINE_COR
QUARTO_X:
	li a1, 160
	li a2, 218
	j DEFINE_COR
DEFINE_COR:
	li t2, 0
	li t3, 1
	li t4, 2
	li t5, 3
	li t6, 4
	li s0, 5
	li s1, 6
	li s2, 7
	li s3, 8
	li s4, 9
	li s5, 10
	li s6, 11
	li s7, 12
	li s8, 13
	li s9, 14
	li s10, 15
	li s11, 16
	li a4, 17
	li a5, 18
	li a6, 19

	lw a7, 4(sp)
	beq a7, t2, PRINT_AMARELO
	beq a7, t3, PRINT_VERMELHO
	beq a7, t4, PRINT_AZUL
	beq a7, t5, PRINT_VERDE
	beq a7, t6, PRINT_PRETO
	beq a7, s0, PRINT_BRANCO
	beq a7, s1, PRINT_LARANJA
	beq a7, s2, PRINT_ROXO
	beq a7, s3, PRINT_BEGE
	beq a7, s4, PRINT_GOIABA
	beq a7, s5, PRINT_AZUL_BEBE
	beq a7, s6, PRINT_VINHO
	beq a7, s7, PRINT_ROSA
	beq a7, s8, PRINT_CIANO
	beq a7, s9, PRINT_VERDE_ESCURO
	beq a7, s10, PRINT_DOURADO
	beq a7, s11, PRINT_IRIS
	beq a7, a4, PRINT_ROSA_PINK
	beq a7, a5, PRINT_VERDE_PASTEL
	beq a7, a6, PRINT_SEPIA
	
FIM_LOOP_GABARITO:
	addi t0, t0, 1
	j LOOP_GABARITO
PRINT_AMARELO:
	li a0, 0
	la a3, AMARELO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_VERMELHO:
	li a0, 0
	la a3, VERMELHO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_AZUL:
	li a0, 0
	la a3, AZUL
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_VERDE:
	li a0, 0
	la a3, VERDE
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_PRETO:
	li a0, 0
	la a3, PRETO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_BRANCO:
	li a0, 0
	la a3, BRANCO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_LARANJA:
	li a0, 0
	la a3, LARANJA
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_ROXO:
	li a0, 0
	la a3, ROXO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_BEGE:
	li a0, 0
	la a3, BEGE
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_GOIABA:
	li a0, 0
	la a3, GOIABA
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_AZUL_BEBE:
	li a0, 0
	la a3, AZUL_BEBE
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_VINHO:
	li a0, 0
	la a3, VINHO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_ROSA:
	li a0, 0
	la a3, ROSA
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_CIANO:
	li a0, 0
	la a3, CIANO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_VERDE_ESCURO:
	li a0, 0
	la a3, VERDE_ESCURO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_DOURADO:
	li a0, 0
	la a3, DOURADO
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_IRIS:
	li a0, 0
	la a3, IRIS
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_ROSA_PINK:	
	li a0, 0
	la a3, ROSA_PINK
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_VERDE_PASTEL:
	li a0, 0
	la a3, VERDE_PASTEL
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO
PRINT_SEPIA:
	li a0, 0
	la a3, SEPIA
	sw t0, 8(sp)
	sw t1, 12(sp)
	call PRINT_IMAGE
	lw t1, 12(sp)
	lw t0, 8(sp)
	j FIM_LOOP_GABARITO

FIM_GABARITO:
	lw ra, 0(sp)
	addi sp, sp, 16
	ret
