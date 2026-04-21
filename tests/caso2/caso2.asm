# --- CARGA DE DADOS ---
ADD R0, R0, R0      # NOP
LW  R1, 10(R0)      # R1 = 50 (Distância Atual)
LW  R2, 11(R0)      # R2 = 40 (Velocidade Atual)
LW  R3, 12(R0)      # R3 = 3  (Distância Segura)
LW  R4, 13(R0)      # R4 = 60 (Velocidade Máxima)

# --- TESTE DE CONDIÇÃO ---
# R5 = (Distância Atual < Distância Segura) ? 1 : 0
SLT R5, R1, R3      # 50 < 3 é FALSO, então R5 = 0

# --- LÓGICA DE SALTO ---
# Se R5 for 0 (Via Segura), pula 5 instruções para o BLOCO NORMAL
BEQ R5, R0, 5       

# --- BLOCO DE EMERGÊNCIA (IGNORADO) ---
ADDI R1, R0, 2      
SW  R1, 20(R0)      
SW  R1, 21(R0)      
JAL R7, 8 # Pulo para evitar executar o bloco normal

# --- BLOCO NORMAL (ALVO DO PULO) ---
# Se o sensor deu "0", o PC aponta para cá:
SW  R0, 20(R0)      # Mem[0x20] = 0 (Freio Solto)
SW  R0, 21(R0)      # Mem[0x21] = 0 (Tudo OK)