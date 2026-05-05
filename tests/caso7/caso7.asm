.text
.globl main
main:
    # 1. CARGA DE DADOS (Simulação dos valores na memória/registradores)
    li   x1, 40   # R1 = 40 (Distância atual do obstáculo frontal)
    li   x2, 50   # R2 = 50 (Velocidade atual do veículo)
    li   x3, 70   # R3 = 70 (Velocidade do veículo à frente)
    li   x4, 25   # R4 = 25 (Distância do veículo à frente)
    
    li   x5, 10   # R5 = 10 (Limite para redução)
    li   x6, 20   # R6 = 20 (Valor de comparação)

    # 2. PROCESSAMENTO LÓGICO
    # Verifica se R4 (x4) é menor que R5 (25 < 10) - Falso
    blt  x4, x5, executa_reducao

    # Verifica se R4 (x4) é menor que R6 (25 < 20) - Falso
    blt  x4, x6, executa_reducao

    # Se ambas forem falsas, via livre (Distância >= 20 metros): pula para o bloco de via livre
    j executa_dobro

executa_reducao:
    # --- INSTRUÇÕES DE REDUÇÃO (NÃO EXECUTADAS NESTE CASO) ---
    srl  x7, x2, x1
    j fim_rotina

executa_dobro:
    # --- BLOCO EXECUTADO (DISTÂNCIA > 20 METROS) ---
    slli x7, x2, 1     # x7 = 50 << 1 = 100 km/h (Velocidade-alvo)
    li   x1, 1         # x1 = 1 (Configura o valor 1 para o deslocamento)

    # Cálculo do comando do acelerador
    sll  x2, x7, x1    # x2 = 100 * 2 = 200 (Comando do acelerador)

    # Salva os dois valores de saída nos registradores:
    mv   x1, x2        # x1 recebe o comando do acelerador (200)
    mv   x2, x7        # x2 recebe a velocidade-alvo (100)

fim_rotina:
    # 3. Encerra o programa
    li   a7, 10
    ecall