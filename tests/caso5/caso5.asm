# --- CARGA DE DADOS ---
ADD R0, R0, R0      # NOP
LW  R1, 10(R0)      # R1 = 30 (Distância Atual - SEGURO)
LW  R2, 11(R0)      # R2 = 80 (Velocidade Atual - ALTA)
LW  R3, 12(R0)      # R3 = 3  (Distância Segura)
LW  R4, 13(R0)      # R4 = 50 (Velocidade Máxima)

# --- TESTE DE CONDIÇÃO PRIORITÁRIA ---
# R5 = (Distância Atual < Distância Segura) ? 1 : 0
SLT R5, R1, R3      # 30 < 3? NÃO, então R5 = 0 (FALSO)

# --- TOMADA DE DECISÃO ---
# Como a distância é segura (R5 == 0), o BEQ pula direto para o estado normal,
# ignorando completamente qualquer checagem de velocidade.
BEQ R5, R0, 5       

# --- BLOCO DE ACIONAMENTO (PULADO) ---
ADDI R1, R0, 2      
SW  R1, 20(R0)      
SW  R1, 21(R0)      
JAL R7, 8           

# --- BLOCO DE OPERAÇÃO NORMAL (SAÍDA ESPERADA) ---
# Alvo do pulo: Mantém o veículo em operação normal
SW  R0, 20(R0)      # Mem[0x20] = 0 (Freio DESATIVADO)
SW  R0, 21(R0)      # Mem[0x21] = 0 (Status: NORMAL)