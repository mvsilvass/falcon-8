.text
.globl main
main:
    # 1. CARGA DE DADOS (Simulando os valores nos registradores)
    li   x1, 2    # Distância Atual
    li   x2, 20   # Velocidade Atual
    li   x3, 3    # Distância Segura
    li   x4, 30   # Velocidade Máxima

    # 2. TESTES LÓGICOS
    # Distância < Limite? (2 < 3)
    slt  x5, x1, x3   # x5 = 1 (Verdadeiro)
    
    # Velocidade Máxima < Velocidade Atual? (30 < 20)
    slt  x6, x4, x2   # x6 = 0 (Falso)

    # 3. TOMADA DE DECISÃO
    # Se distância estiver OK (x5 == 0), pula para o bloco normal
    beqz x5, bloco_normal

    # Se a velocidade estiver alta (x6 != 0), pula para o bloco de emergência
    bnez x6, bloco_emergencia

bloco_alerta:
    # 4. Bloco de Alerta (Distância crítica e Velocidade normal)
    li   x1, 1    # Valor 1: Freio Normal
    li   x2, 1    # Valor 2: Status Alerta
    j    fim_rotina

bloco_emergencia:
    # 5. Bloco de Emergência
    li   x1, 2    # Valor 1: Freio de Emergência
    li   x2, 2    # Valor 2: Status de Emergência
    j    fim_rotina

bloco_normal:
    # 6. Bloco Normal
    li   x1, 0    # Valor 1: Freio Solto
    li   x2, 0    # Valor 2: Status Tudo OK

fim_rotina:
    # 7. Encerra o programa
    li   a7, 10
    ecall