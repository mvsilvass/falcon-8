# --- CARGA DE DADOS ---
ADD R0, R0, R0      # NOP
LW  R1, 10(R0)      # R1 = 2  (Distância Atual)
LW  R2, 11(R0)      # R2 = 20 (Velocidade Atual)
LW  R3, 12(R0)      # R3 = 3  (Distância Segura)
LW  R4, 13(R0)      # R4 = 30 (Velocidade Máxima)

# --- TESTES LÓGICOS ---
# 1. Distância < Limite?
SLT R5, R1, R3      # 2 < 3? SIM, então R5 = 1

# 2. Velocidade Máxima < Velocidade Atual?
SLT R6, R4, R2      # 30 < 20? NÃO, então R6 = 0

# --- TOMADA DE DECISÃO ---
# Se a distância estiver OK (R5 == 0), pula para o estado NORMAL (fim)
BEQ R5, R0, 9       

# Se a velocidade estiver ALTA (R6 != 0), pula para o bloco de EMERGÊNCIA
BNE R6, R0, 5       

# --- BLOCO DE ALERTA ---
# Executado se: Distância for Crítica E Velocidade for OK
ADDI R1, R0, 1      # Prepara valor 1
SW  R1, 20(R0)      # Mem[0x20] = 1 (Freio Normal)
SW  R1, 21(R0)      # Mem[0x21] = 1 (Status: Alerta)
JAL R7, 8           # Finaliza a execução

# --- BLOCO DE EMERGÊNCIA (PULADO) ---
ADDI R1, R0, 2      
SW  R1, 20(R0)      # Mem[0x20] = 2
SW  R1, 21(R0)      # Mem[0x21] = 2
JAL R7, 8           

# --- BLOCO NORMAL (PULADO) ---
SW  R0, 20(R0)      # Mem[0x20] = 0
SW  R0, 21(R0)      # Mem[0x21] = 0