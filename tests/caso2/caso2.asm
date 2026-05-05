.text
.globl main
main:
    # 1. CARGA DE DADOS (Simulando os valores nos registradores)
    li   x1, 50   # Distância Atual
    li   x2, 40   # Velocidade Atual
    li   x3, 3    # Distância Segura
    li   x4, 60   # Velocidade Máxima

    # 2. TESTE DE CONDIÇÃO
    # x5 = (Distância Atual < Distância Segura) ? 1 : 0
    slt  x5, x1, x3   # 50 < 3 é falso, então x5 = 0

    # 3. LÓGICA DE SALTO
    # Se x5 for 0 (Via Segura), pula para o bloco normal
    beq x5, zero, bloco_normal

bloco_emergencia:
    # 4. Ação de emergência (caso a condição seja verdadeira)
    li   x1, 2    # Valor 1: Aciona o freio de emergência
    li   x2, 2    # Valor 2: Status de emergência ativado
    j    fim_rotina

bloco_normal:
    # 5. Bloco normal (caso a condição seja falsa)
    li   x1, 0    # Valor 1: Freio Solto
    li   x2, 0    # Valor 2: Status Tudo OK

fim_rotina:
    # 6. Encerra o programa corretamente
    li   a7, 10
    ecall