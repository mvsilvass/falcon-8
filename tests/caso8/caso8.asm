.text
.globl main
main:
    # 1. CARGA DE DADOS
    li   x1, 30   # R1 = 30 (Distância atual do obstáculo frontal)
    li   x2, 60   # R2 = 60 (Velocidade atual do veículo)
    li   x3, 55   # R3 = 55 (Velocidade do veículo à frente)
    li   x4, 15   # R4 = 15 (Distância do veículo à frente)
    
    li   x5, 10   # R5 = 10 (Limite para redução)
    li   x6, 20   # R6 = 20 (Valor de comparação)

    # 2. PROCESSAMENTO LÓGICO
    # Verifica se R4 (x4) é menor que R5 (15 < 10) - Falso
    blt  x4, x5, executa_reducao

    # Verifica se R4 (x4) é menor que R6 (15 < 20) - Verdadeiro
    blt  x4, x6, manter_velocidade

    # Caso distância seja maior ou igual a 20 metros
    j    executa_dobro

executa_reducao:
    # --- INSTRUÇÕES DE REDUÇÃO ---
    srl  x7, x2, x1
    j    fim_rotina

manter_velocidade:
    # --- BLOCO EXECUTADO (15 < 20 METROS) ---
    # Soma R7 = R3 + R0 (R3 = 55)
    add  x7, x3, x0    
    
    # Prepara o valor 1 para o deslocamento
    li   t1, 1

    # Cálculo do comando do acelerador
    sll  x2, x7, t1    # R2 = 55 * 2 = 110 (Aproximadamente)

    # Salva os dois valores finais nos registradores de saída
    mv   x1, x2        # x1 recebe o comando do acelerador (110)
    mv   x2, x7        # x2 recebe a velocidade de referência (55)
    j    fim_rotina

executa_dobro:
    # --- BLOCO DE VIA LIVRE (NÃO EXECUTADO AQUI) ---
    slli x7, x2, 1
    li   t1, 1
    sll  x2, x7, t1
    mv   x1, x2
    mv   x2, x7

fim_rotina:
    # 3. Encerra o programa
    li   a7, 10
    ecall