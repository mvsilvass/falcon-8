# --- INICIALIZAÇÃO (CARGA DE DADOS) ---
ADD R0, R0, R0      # NOP 
LW  R1, 10(R0)      # R1 = 2  (Distância Atual)
LW  R2, 11(R0)      # R2 = 60 (Velocidade Atual)
LW  R3, 12(R0)      # R3 = 3  (Distância Segura)
LW  R4, 13(R0)      # R4 = 30 (Velocidade Máxima Permitida)

# --- PROCESSAMENTO LOGÍCO ---
# 1. Comparar: Distância Atual < Distância Segura?
SLT R5, R1, R3      # Se 2 < 3, R5 = 1 (VERDADEIRO)

# 2. Comparar: Velocidade Máxima < Velocidade Atual? 
# (Usamos R4 < R2 para checar se a velocidade atual ultrapassou o limite)
SLT R6, R4, R2      # Se 30 < 60, R6 = 1 (VERDADEIRO)

# 3. Decisão: Ambas são verdadeiras? (AND)
AND R7, R5, R6      # R7 = 1 se (R5 == 1 E R6 == 1)

# --- TOMADA DE DECISÃO ---
# Se R7 for 0 (Falso), pula o acionamento de emergência.
# Como o cenário é de EMERGÊNCIA, R7 será 1 e ele NÃO vai pular.
BEQ R7, R0, 3       # Pula 3 instruções se NÃO for emergência

# --- SAÍDA (ATUAÇÃO) ---
SW  R1, 20(R0)      # Mem[0x20] = 2 (FREIO DE EMERGÊNCIA)
SW  R1, 21(R0)      # Mem[0x21] = 2 (STATUS: EMERGÊNCIA)

# Fim da Rotina
JAL R7, 8           # Pula para o fim do programa