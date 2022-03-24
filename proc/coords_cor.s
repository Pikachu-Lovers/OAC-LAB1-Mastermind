#########################################
# Procedimento responsável por		#
# Calcular a coordenada atual 		#
# da bolinha que vai ser printada	#
#########################################
.text
COORDS_COR:
	# X = 76 + (28*(Coluna-1))
	# Y = 2  + (21*(Linha-1))
	
	li t0, 76	# X inicial
	li t1, 2	# Y inicial
	la t2, LINHA
	la t3, COLUNA
	lb t4, 0(t2)	# Linha Atual
	lb t5, 0(t3)	# Coluna Atual
	
	li t3, 21	# Altura de cada circulo
	li t2, 28	# Largura de cada circulo
	
	li t6, 1
	sub t4, t4, t6	# Linha-1
	sub t5, t5, t6	# Coluna-1
	
	mul t3, t3, t4	# Y
	mul t2, t2, t5	# X
	
	add a1, t0, t2
	add a2, t1, t3
	
	ret
	
	
	
	
	
	
