.text
.globl main
main:
    # 1. CARGA DE DADOS (Simulando os valores nos registradores)
    li   x1, 3    # Distância Atual
    li   x2, 30   # Velocidade Atual
    li   x3, 3    # Distância Segura
    li   x4, 40   # Velocidade Máxima

    # 2. TESTE DE CONDIÇÃO
    # x5 = (Distância Atual < Distância Segura) ? 1 : 0
    slt  x5, x1, x3   # Como 3 não é menor que 3, x5 = 0 (Falso)

    # 3. LÓGICA DE SALTO
    # Se x5 for igual a 0, pula para o bloco normal
    beqz x5, bloco_normal

bloco_emergencia:
    # 4. Bloco de Emergência
    li   x1, 2    # Valor 1: Freio de Emergência
    li   x2, 2    # Valor 2: Status de Emergência
    j    fim_rotina

bloco_normal:
    # 5. Bloco de Operação Normal (Alvo do pulo)
    li   x1, 0    # Valor 1: Freio Desativado
    li   x2, 0    # Valor 2: Status: Normal

fim_rotina:
    # 6. Encerra o programa
    li   a7, 10
    ecall