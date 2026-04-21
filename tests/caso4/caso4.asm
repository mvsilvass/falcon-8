# --- CARGA DE DADOS ---
ADD R0, R0, R0      # NOP
LW  R1, 10(R0)      # R1 = 3  (Distância Atual)
LW  R2, 11(R0)      # R2 = 30 (Velocidade Atual)
LW  R3, 12(R0)      # R3 = 3  (Distância Segura)
LW  R4, 13(R0)      # R4 = 40 (Velocidade Máxima)

# --- TESTE DE CONDIÇÃO ---
SLT R5, R1, R3      # Como 3 não é menor que 3, R5 recebe 0 (FALSO)

# --- LÓGICA DE SALTO ---
# Como R5 é 0 (Distância Segura/No Limite), o BEQ realiza o salto
BEQ R5, R0, 5       

# --- BLOCO DE ACIONAMENTO (PULADO) ---
ADDI R1, R0, 2      # (Emergência)
SW  R1, 20(R0)      
SW  R1, 21(R0)      
JAL R7, 8           # Pulo para o fim

# --- BLOCO DE OPERAÇÃO NORMAL (ALVO DO PULO) ---
# Executado porque a distância está no limite exato
SW  R0, 20(R0)      # Mem[0x20] = 0 (Freio DESATIVADO)
SW  R0, 21(R0)      # Mem[0x21] = 0 (Status: NORMAL)