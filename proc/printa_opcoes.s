#########################################
#   Procedimento responsável por 	#
#   Printar as letras disponíveis	#
#   em cada fase			#
#########################################
.text
INICIA_OPCOES:
	addi sp, sp, -12
	sw ra, 0(sp)
	la a1, CORES
	lb t1, 0(a1)	# Carrega em t0 o valor de Cores atual
	li a0, 0
	li t0, 1	# Contador
	
LOOP_OPTIONS:
	# Irá verificar as opções (talvez haja modo mais eficiente)
	bgt t0, t1, FINALIZA_OPTIONS
	sw t0, 8(sp)
	li t2, 1
	li t3, 2
	li t4, 3
	li t5, 4
	li t6, 5
	li s0, 6
	li s1, 7
	li s2, 8
	li s3, 9
	li s4, 10
	li s5, 11
	li s6, 12
	li s7, 13
	li s8, 14
	li s9, 15
	li s10, 16
	li s11, 17
	li a3, 18
	li a4, 19
	li a5, 20
	beq t0, t2, PRINTA_A
	beq t0, t3, PRINTA_B
	beq t0, t4, PRINTA_C
	beq t0, t5, PRINTA_D
	beq t0, t6, PRINTA_E
	beq t0, s0, PRINTA_F
	beq t0, s1, PRINTA_G
	beq t0, s2, PRINTA_H
	beq t0, s3, PRINTA_I
	beq t0, s4, PRINTA_J
	beq t0, s5, PRINTA_K
	beq t0, s6, PRINTA_L
	beq t0, s7, PRINTA_M
	beq t0, s8, PRINTA_N
	beq t0, s9, PRINTA_O
	beq t0, s10, PRINTA_P
	beq t0, s11, PRINTA_Q
	beq t0, a3, PRINTA_R
	beq t0, a4, PRINTA_S
	beq t0, a5, PRINTA_T
SOMA_OPTIONS:
	addi t0, t0, 1
	j LOOP_OPTIONS
PRINTA_A:
	li a1, 252
	li a2, 21
	la a3, A
	j PRINTA_IMAGEM_LETRA
PRINTA_B:
	li a1, 284
	li a2, 21
	la a3, B
	j PRINTA_IMAGEM_LETRA
PRINTA_C:
	li a1, 252
	li a2, 42
	la a3, C
	j PRINTA_IMAGEM_LETRA
PRINTA_D:
	li a1, 284
	li a2, 42
	la a3, D
	j PRINTA_IMAGEM_LETRA
PRINTA_E:
	li a1, 252
	li a2, 63
	la a3, E
	j PRINTA_IMAGEM_LETRA

PRINTA_F:
	li a1, 284
	li a2, 63
	la a3, F
	j PRINTA_IMAGEM_LETRA
PRINTA_G:
	li a1, 252
	li a2, 84
	la a3, G
	j PRINTA_IMAGEM_LETRA
PRINTA_H:
	li a1, 284
	li a2, 84
	la a3, H
	j PRINTA_IMAGEM_LETRA
PRINTA_I:
	li a1, 252
	li a2, 105
	la a3, I
	j PRINTA_IMAGEM_LETRA
PRINTA_J:
	li a1, 284
	li a2, 105
	la a3, J
	j PRINTA_IMAGEM_LETRA

PRINTA_K:
	li a1, 252
	li a2, 126
	la a3, K
	j PRINTA_IMAGEM_LETRA

PRINTA_L:
	li a1, 284
	li a2, 126
	la a3, L
	j PRINTA_IMAGEM_LETRA
PRINTA_M:
	li a1, 252
	li a2, 147
	la a3, M
	j PRINTA_IMAGEM_LETRA

PRINTA_N:
	li a1, 284
	li a2, 147
	la a3, N
	j PRINTA_IMAGEM_LETRA

PRINTA_O:
	li a1, 252
	li a2, 168
	la a3, O
	j PRINTA_IMAGEM_LETRA
PRINTA_P:
	li a1, 284
	li a2, 168
	la a3, P
	j PRINTA_IMAGEM_LETRA
PRINTA_Q:
	li a1, 252
	li a2, 189
	la a3, Q
	j PRINTA_IMAGEM_LETRA
PRINTA_R:
	li a1, 284
	li a2, 189
	la a3, R
	j PRINTA_IMAGEM_LETRA
PRINTA_S:
	li a1, 252
	li a2, 210
	la a3, S
	j PRINTA_IMAGEM_LETRA
PRINTA_T:
	li a1, 284
	li a2, 210
	la a3, T
	j PRINTA_IMAGEM_LETRA
PRINTA_IMAGEM_LETRA:
	sw t0, 4(sp)
	sw t1, 8(sp)
	call PRINT_IMAGE
	lw t0, 4(sp)
	lw t1, 8(sp)
	j SOMA_OPTIONS
FINALIZA_OPTIONS:
	lw ra, 0(sp)
	
	addi sp, sp, 12
	ret
