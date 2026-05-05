.text
.globl main
main:
    # 1. CARGA DE DADOS
    li   x1, 100  # R1 = 100
    li   x2, 80   # R2 = 80
    li   x3, 0    # R3 = 0
    li   x4, 100  # R4 = 100
    
    li   x5, 10   # R5 = 10
    li   x6, 20   # R6 = 20

    # 2. PROCESSAMENTO LÓGICO
    blt  x4, x5, executa_reducao
    blt  x4, x6, manter_velocidade

    j    executa_dobro

executa_reducao:
    srl  x7, x2, x1
    j    fim_rotina

manter_velocidade:
    add  x7, x3, x0
    j    fim_rotina

executa_dobro:
    # --- 1. Velocidade-alvo (R7) dobrada ---
    slli x7, x2, 1         # x7 = 80 << 1 = 160 (Velocidade-alvo)
    
    # --- 2. Etapa do Imediato (R1) ---
    li   x1, 20            # Recebe o imediato 20
    slli x1, x1, 1         # Multiplica por 2: 20 << 1 = 40

    # --- 3. Etapa da Velocidade (R2) ---
    slli x2, x1, 1         # Multiplica por 2: 40 << 1 = 80

    # --- 4. Soma de R1 e R2 (40 + 80 = 120) ---
    add  x3, x1, x2        # x3 recebe o valor 120

    # --- 5. Lógica de Menor Valor ---
    blt  x7, x3, menor_que_120

maior_ou_igual:
    mv   t0, x3
    j    multiplicacao

menor_que_120:
    mv   t0, x7

multiplicacao:
    slli x1, x3, 1
    
   
# Salva os dois valores finais nos registradores de saída
    mv   x1, x1 	   # x1 = 160
    mv   x2, x7 	   # x2 = 160
    
fim_rotina:
    # 3. Encerra o programa
    li   a7, 10
    ecall