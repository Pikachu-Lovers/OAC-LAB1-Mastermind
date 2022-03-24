#########################################
# Procedimento respons�vel por printar	#
# qualquer imagem no BitMap Display	#
#########################################

#################################
#	Argumentos		#
#################################
# 	a0 = frame		#
# 	a1 = x			#
# 	a2 = y			#
# 	a3 = label		#
#################################


.text
PRINT_IMAGE:
	li t4,0
	li t3, 0
	li t1,0xFF000000	# endereco inicial da Memoria VGA - Frame 0
	bgtz  a0, FRAME1_PI
	j START1_PI
FRAME1_PI:
	li t0, 0x00100000
	add t1,t1,t0		# vai pra Frame 1
START1_PI:	
	li t0,0
	li s3,320		# multiplicar depois 
	li t5, 320
	mul s3, s3, a2		# 320*(Altura) (Y)		
	lw s4, 0(a3)		# Largura da Imagem
	lw s5, 4(a3)		# Altura da Imagem
	mul t2, s4,s5		# �rea
	add t1, t1, s3		# Endere�o Inicial + 320*(Altura) 
	add t1, t1, a1		# Endere�o Inicial + 320*(Altura) + (Largura)	
	addi a3,a3,8        	# primeiro pixels depois das informa��es de nlin ncol
    
SAVE_PI: 
	bge t4,t2,FINAL_PI		
	addi t0,t0,4		
	addi t4,t4,4		
	lw t3,0(a3)         
	sw t3,0(t1)         
	addi t1,t1,4        
	addi a3,a3,4	
	beq t0,s4,BREAK1_PI
	j SAVE_PI   
         
BREAK1_PI:
	add t1,t1,t5		#Endere�o + 320 = Pula a linha
	sub t1,t1,t0		#Endere�o - 16 = Diminui pelo tamanho dos pixels
	li t0,0
	j SAVE_PI
FINAL_PI:
	li t4, 0
	ret
