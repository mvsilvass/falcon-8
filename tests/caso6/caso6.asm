# --- INICIALIZAÇÃO (CARGA DE DADOS) ---
ADD R0, R0, R0      # NOP
LW  R1, 10(R0)      # R1 = 20 (Distância atual do obstáculo frontal)
LW  R2, 11(R0)      # R2 = 60 (Velocidade atual do veículo)
LW  R3, 14(R0)      # R3 = 40 (Velocidade do veículo à frente)
LW  R4, 15(R0)      # R4 = 8  (Distância do veículo à frente)
ADDI R5, R0, 10     # R5 = 10 (Limite para redução)
ADDI R6, R0, 20     # R6 = 20 (Valor de comparação)

# --- PROCESSAMENTO LÓGICO ---
# 1. Verificar se a distância do veículo à frente é menor que 10 metros
BLT R4, R5, 3       # Se R4 < R5, pula 3 instruções (se 8 < 10, executa o desvio)

# --- SE FALSO (NÃO ENTRA NA CONDIÇÃO) ---
ADD R0, R0, R0      # NOP
ADD R0, R0, R0      # NOP

# --- SE VERDADEIRO (ENTRA NA CONDIÇÃO) ---
ADDI R1, R0, 1      # R1 = 1 (Configura o valor 1 para o registrador de deslocamento)
SRL R7, R2, R1      # R7 = 60 >> 1 = 30 km/h (Velocidade-alvo)
SW  R7, 23(R0)      # Mem[0x23] = 30 (Velocidade-alvo atualizada na memória)

# Ajuste do comando do acelerador (aproximação proporcional)
SLL R2, R7, R1      # R2 = 30 * 2 = 60 km/h (Comando ajustado)
SW  R2, 22(R0)      # Mem[0x22] = 60 (Comando do acelerador na memória)

# Fim da Rotina
JAL R7, 8           # Pula para o fim do programa