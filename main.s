#########################################################
#                   LAB1 - Mastermind			#
#  Organização e Arquitetura de Computadores - 2021-2	#
#							#
#           Ana Luísa Padilha Alves			#
#           Bruno Vargas de Souza			#
#           Harisson Freitas Magalhães			#
#							#
#########################################################

.include "MACROSv21.s"
.data
NL: .string "\n"
NS: .string " "
CORES: .byte 5				# Quantidade de Cores N
GABARITO_CORES: .byte 0, 0, 0, 0	# Gabarito Final de cada Fase
TENTATIVA_CORES: .byte 0, 0, 0, 0	# Tentativa do jogador
LINHA: .byte 1				# Linha Atual do Jogador
COLUNA: .byte 1				# Coluna Atual do Jogador
PINOS_QTD: .byte 0			# Quantidade de Pinos, brancos ou pretos por fase

.text
 
MENU:	
	li a0, 0
	la a1, CAPA_COMO_JOGAR_OFICIAL
	call PRINT_BACKGROUND		# Printa Background como Jogar frame 0
	
	li t2, 0xFF200604		# Carrega endereço da Frame
	li t4, 0
	sw t4, 0(t2)			# Armazena 0 na frame
	
	li a0, 1
	la a1, CAPA_JOGAR_OFICIAL
	call PRINT_BACKGROUND		# Printa backgorund jogar frame 1
	
# Alterna as capas entre jogar e como jogar	
KEYBOARD_MENU:
	li t1,0xFF200000	# carrega o endereço de controle do KDMMIO
	lw t0,0(t1)		# Le bit de Controle Teclado
	andi t0,t0,0x0001	# mascara o bit menos significativo
   	beq t0,zero,KEYBOARD_MENU  # Se não há tecla pressionada entÃ£o volta pro LOOP
   	lw s0,4(t1)		# tecla pressionada em t0
   	
   	li t2, 0xFF200604
   	lw t3, 0(t2)		# Frame Atual
   	
   	li t4, 0
   	beq t3, t4, MENU_COMO_JOGAR
MENU_JOGAR:		# Vai para o MENU_JOGAR
	li t4, 65
	li t5, 97
	li t6, 10
	beq s0, t4, NEXT_FRAME_MENU
	beq s0, t5, NEXT_FRAME_MENU
	beq s0, t6, FIM_KEYBOARD_MENU
	
	j KEYBOARD_MENU   	
MENU_COMO_JOGAR:	# Vai para o MENU_COMO_JOGAR
	li t4, 68
	li t5, 100
	li t6, 10
	beq s0, t4, NEXT_FRAME_MENU
	beq s0, t5, NEXT_FRAME_MENU
	beq s0, t6, PRINTA_COMO_JOGAR
	
	j KEYBOARD_MENU

NEXT_FRAME_MENU:	# TROCA FRAME
	xori t3, t3, 1
	sw t3, 0(t2)
	j KEYBOARD_MENU

PRINTA_COMO_JOGAR:	
	la a1, COMO_JOGAR
	li a0, 1
	call PRINT_BACKGROUND
	li t2, 0xFF200604
	li a0, 1
	sw a0, 0(t2)

KEYBOARD_COMO_JOGAR:	# LOOP DO TECLADO DO COMO JOGAR
	li t1,0xFF200000	
	lw t0,0(t1)		
	andi t0,t0,0x0001	
   	beq t0,zero,KEYBOARD_COMO_JOGAR
   	lw s0,4(t1)	
   	
   	li t5, 27
   	beq s0, t5, MENU 	
	j KEYBOARD_COMO_JOGAR
	
FIM_KEYBOARD_MENU:
	li s0,0xFF200604	# Escolhe o Frame 0 ou 1
	lw t2,0(s0)		# inicio Frame
	xori t2, t2, 1
	sw t2,0(s0)
	
INICIALIZA_TABULEIRO:	
	li a0, 0
	la a1, tabuleiro
	call PRINT_BACKGROUND
	
	call PRINTA_NUMERO	# Printa Número da Fase

OPCOES:
	call INICIA_OPCOES	# Printa as cores disponíveis

COMEÇA_PARTIDA:
	la a3, CORES
	lb a1, 0(a3)
# Cria a Resposta do Gabarito Final usando syscall random
INICIAR_ALEATORIO:
	li t0, 0	# Contador 
	li t1, 4
	la a2, GABARITO_CORES
	
LOOP_ALEATORIO:
	beq t0, t1, INICIAR_JOGO
	li a7, 42
	ecall
	
	sb a0, 0(a2)	# Armazena o numero aleatorio em GABARITO_CORES
	addi a2, a2, 1
	addi t0, t0, 1
	j LOOP_ALEATORIO
	
	
INICIAR_JOGO:
	# Printa a Resposta gabarito a fins de debug (NÃO USE PRA CHEAT)
	#la a2, GABARITO_CORES
   	#lb a0, 0(a2)
   	#li a7,1
   	#ecall
   	#la a0, NS
   	#li a7,4
   	#ecall
   	#lb a0, 1(a2)
   	#li a7,1
   	#ecall
   	#la a0, NS
   	#li a7,4
   	#ecall
   	#lb a0, 2(a2)
   	#li a7,1
   	#ecall
   	#la a0, NS
   	#li a7,4
   	#ecall
   	#lb a0, 3(a2)
   	#li a7,1
   	#ecall
   	#la a0, NL
   	#li a7,4
   	#ecall
	
# Inicia o Loop do KEYBOARD para receber as cores
KEYBOARD_1:
	li t1,0xFF200000	# carrega o endereço de controle do KDMMIO
	lw t0,0(t1)		# Le bit de Controle Teclado
	andi t0,t0,0x0001	# mascara o bit menos significativo
   	beq t0,zero,KEYBOARD_1  # Se não há tecla pressionada entÃ£o volta pro LOOP
   	lw a0,4(t1)		# tecla pressionada em t0
   	la a1, CORES
   	lb a1, 0(a1)
   	call SELECAO_COR		# em a0 vai conter a label a ser printada
   	li t1, -1
   	li t2, -2
   	li t3, -3
   	beq a0, t1, KEYBOARD_1
   	beq a0, t2, APAGA_IMAGEM	# Verifica se apaga a imagem
   	beq a0, t3, VERIFICA_CORES
   	li t5, 4
   	la a4, COLUNA
   	lb t4, 0(a4)
   	bgt t4, t5, KEYBOARD_1
   	
   	
   	mv a3, a0
   	li a0, 0
   	call COORDS_COR			# Calcula as Coordenadas atuais	
   	call PRINT_IMAGE		# Printa a imagem de acordo com a SELECAO_COR
   	la a0, COLUNA
   	lb t1, 0(a0)
   	addi t1, t1, 1
   	sb t1, 0(a0)
   	
   	
   	# Printa Tentativa no console
   	#la a2, TENTATIVA_CORES
   	#lb a0, 0(a2)
   	#li a7,1
   	#ecall
   	#lb a0, 1(a2)
   	#li a7,1
   	#ecall
   	#lb a0, 2(a2)
   	#li a7,1
   	#ecall
   	#lb a0, 3(a2)
   	#li a7,1
   	#ecall
   	
   	#la a0, NL
   	#li a7,4
   	#ecall
   	
   	j FIM_KEYBOARD
# Caso tecla = Backspace
APAGA_IMAGEM:
	la a0, COLUNA
	lb t1, 0(a0)
	li t3, 1
	beq t1, t3, KEYBOARD_1
	li t5, 1
	sub t1, t1, t5		# Subtrai a Coluna para pegar a coluna antiga
	sb t1, 0(a0)
	la a3, CINZA		
	li a0, 0
	call COORDS_COR
	call PRINT_IMAGE	# Printa a cor cinza na coordenada anterior
	j KEYBOARD_1

# Caso tecla = Enter
VERIFICA_CORES:
	call VERIFICA_PINOS	# Verifica os pinos de acordo com as respostas

VERIFICA_SE_GANHOU:
	la a1, PRETO_QTD
	lb a2, 0(a1)
	li t0, 4
	beq a2, t0, GANHOU_FASE
	
	la a1, LINHA
	lb t0, 0(a1)
	li t1, 10
	beq t0, t1, PERDEU_FASE
	
	j RESETA_DADOS
# Se ganhou, irá resetar para ir para a próxima fase
GANHOU_FASE:
	
	la a1, CORES
	lb t0, 0(a1)
	addi t0, t0, 1
	sb t0, 0(a1)
	
	call MOSTRA_GABARITO
	
	la a1, LINHA
	li t0, 1
	sb t0, 0(a1)
	
	la a1, PRETO_QTD
	li t0, 0
	sb t0, 0(a1)
	
	la a1, COLUNA
	li t0, 1
	sb t0, 0(a1)
	
	la a1, PINOS_QTD
	li t0, 0
	sb t0, 0(a1)
	
	la a1, TENTATIVA_CORES
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, GABARITO_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1 TENTATIVA_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, PRETO_BOOL
	li t0, 0
	sb t0, 0(a1)
	
	li a7, 32
	li a0, 2500
	ecall
	
	li a0, 0
	li a1, 40
	li a2, 24
	la a3, ImagemVITORIA
	call PRINT_IMAGE
	
	li a7, 32
	li a0, 1500
	ecall
	
	
	
	
	la a1, CORES
	lb t0, 0(a1)
	li t1, 20
	beq t0, t1, MENU
	
	j INICIALIZA_TABULEIRO
	
# Se perdeu, irá resetar e voltará para o MENU
PERDEU_FASE:
	la a1, CORES
	li t0, 5
	sb t0, 0(a1)
	
	call MOSTRA_GABARITO
	
	la a1, LINHA
	li t0, 1
	sb t0, 0(a1)
	
	la a1, PRETO_QTD
	li t0, 0
	sb t0, 0(a1)
	
	la a1, COLUNA
	li t0, 1
	sb t0, 0(a1)
	
	la a1, PINOS_QTD
	li t0, 0
	sb t0, 0(a1)
	
	la a1, TENTATIVA_CORES
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, GABARITO_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1 TENTATIVA_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, PRETO_BOOL
	li t0, 0
	sb t0, 0(a1)
	
	li a7, 32
	li a0, 2500
	ecall
	
	li a0, 0
	li a1, 40
	li a2, 24
	la a3, ImagemDERROTA
	call PRINT_IMAGE
	
	li a7, 32
	li a0, 1500
	ecall
	
	j MENU

# Reseta os dados para ir para a próxima linha
RESETA_DADOS:
	la a1, LINHA
	lb t0, 0(a1)
	addi t0, t0, 1	# Linha++
	sb t0, 0(a1)
	
	la a1, COLUNA
	li t0, 1
	sb t0, 0(a1)
	
	la a1, PINOS_QTD
	li t0, 0
	sb t0, 0(a1)
	
	la a1, TENTATIVA_CORES
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, GABARITO_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1 TENTATIVA_USED
	li t0, 0
	sb t0, 0(a1)
	sb t0, 1(a1)
	sb t0, 2(a1)
	sb t0, 3(a1)
	
	la a1, PRETO_BOOL
	li t0, 0
	sb t0, 0(a1)
	
	la a1, PRETO_QTD
	li t0, 0
	sb t0, 0(a1)
	
	
	j KEYBOARD_1


FIM_KEYBOARD:
   	j KEYBOARD_1

	
EXIT:
	
	li a7, 10
	ecall
	
	


.include "proc/background.s"
.include "proc/print.s"
.include "proc/selecao_cor.s"
.include "proc/coords_cor.s"
.include "proc/verifica.s"
.include "proc/printa_opcoes.s"
.include "proc/mostra_gabarito.s"
.include "proc/printa_numero.s"
.include "SYSTEMv21.s"
.data
.include "img/tabuleiro.data"
.include "img/ImagemDERROTA.data"
.include "img/ImagemVITORIA.data"
.include "img/CapaComoJogarOficial.data"
.include "img/CapaJogarOficial.data"
.include "img/comojogar.data"
.include "img/pino_branco.data"
.include "img/pino_preto.data"
.include "img/Numeros_Data/um.data"
.include "img/Numeros_Data/dois.data"
.include "img/Numeros_Data/tres.data"
.include "img/Numeros_Data/quatro.data"
.include "img/Numeros_Data/cinco.data"
.include "img/Numeros_Data/seis.data"
.include "img/Numeros_Data/sete.data"
.include "img/Numeros_Data/oito.data"
.include "img/Numeros_Data/nove.data"
.include "img/Numeros_Data/dez.data"
.include "img/Numeros_Data/onze.data"
.include "img/Numeros_Data/doze.data"
.include "img/Numeros_Data/treze.data"
.include "img/Numeros_Data/catorze.data"
.include "img/Numeros_Data/quinze.data"
.include "img/Letras_Data/A.data"
.include "img/Letras_Data/B.data"
.include "img/Letras_Data/C.data"
.include "img/Letras_Data/D.data"
.include "img/Letras_Data/E.data"
.include "img/Letras_Data/F.data"
.include "img/Letras_Data/G.data"
.include "img/Letras_Data/H.data"
.include "img/Letras_Data/I.data"
.include "img/Letras_Data/J.data"
.include "img/Letras_Data/K.data"
.include "img/Letras_Data/L.data"
.include "img/Letras_Data/M.data"
.include "img/Letras_Data/N.data"
.include "img/Letras_Data/O.data"
.include "img/Letras_Data/P.data"
.include "img/Letras_Data/Q.data"
.include "img/Letras_Data/R.data"
.include "img/Letras_Data/S.data"
.include "img/Letras_Data/T.data"
.include "img/Bolinhas_Data/amarelo.data"
.include "img/Bolinhas_Data/azul.data"
.include "img/Bolinhas_Data/azul_bebe.data"
.include "img/Bolinhas_Data/bege.data"
.include "img/Bolinhas_Data/branco.data"
.include "img/Bolinhas_Data/ciano.data"
.include "img/Bolinhas_Data/cinza.data"
.include "img/Bolinhas_Data/dourado.data"
.include "img/Bolinhas_Data/goiaba.data"
.include "img/Bolinhas_Data/iris.data"
.include "img/Bolinhas_Data/laranja.data"
.include "img/Bolinhas_Data/preto.data"
.include "img/Bolinhas_Data/rosa.data"
.include "img/Bolinhas_Data/rosa_pink.data"
.include "img/Bolinhas_Data/roxo.data"
.include "img/Bolinhas_Data/sepia.data"
.include "img/Bolinhas_Data/verde.data"
.include "img/Bolinhas_Data/verde_escuro.data"
.include "img/Bolinhas_Data/verde_pastel.data"
.include "img/Bolinhas_Data/vermelho.data"
.include "img/Bolinhas_Data/vinho.data"

