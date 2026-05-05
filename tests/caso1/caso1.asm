.text
.globl main
main:
    # 1. Carrega os valores
    li   x1, 2    # Distância Atual
    li   x2, 60   # Velocidade Atual
    li   x3, 3    # Distância Segura
    li   x4, 30   # Velocidade Máxima Permitida

    # 2. Processamento Lógico (Verificações)
    slt  x5, x1, x3   # x5 = 1 (Distância Atual < Distância Segura)
    slt  x6, x4, x2   # x6 = 1 (Velocidade Máxima < Velocidade Atual)
    and  x7, x5, x6   # x7 = 1 se ambas forem verdadeiras

    # 3. Tomada de Decisão
    beq x7, zero, fim_rotina   # Se x7 for 0, pula o freio e vai pro fim

    acionar_freio:
  	# Salva o valor do freio na memória
	li   x1, 2    # Valor 1: Aciona o freio de emergência
   	li   x2, 2    # Valor 2: Status de emergência ativado

    fim_rotina:
    	# 5. Encerra o programa
    	li   a7, 10
    	ecall
    