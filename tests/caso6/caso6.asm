.text
.globl main
main:
    # 1. CARGA DE DADOS (Simulando os valores nos registradores)
    li   x1, 20   # Distância atual do obstáculo frontal (R1)
    li   x2, 60   # Velocidade atual do veículo (R2)
    li   x3, 40   # Velocidade do veículo à frente (R3)
    li   x4, 8    # Distância do veículo à frente (R4)
    
    li   x5, 10   # Limite para redução (R5)
    li   x6, 20   # Valor de comparação (R6)

    # 2. PROCESSAMENTO LÓGICO
    # Verifica se a distância do veículo à frente (x4) é menor que 10 metros (x5)
    # Como 8 < 10, o salto ocorre para a redução
    blt  x4, x5, executa_reducao

bloco_sem_reducao:
    # Caso a condição seja falsa (não entra no desvio)
    j fim_rotina

executa_reducao:
    # 3. SE VERDADEIRO (Entra na condição de redução)
    li   t1, 1        # Registrador temporário para o deslocamento (valor 1)
    srl  x1, x2, t1   # x1 = 60 >> 1 = 30 km/h (Velocidade-alvo)
    
    # Ajuste do comando do acelerador (aproximação proporcional)
    sll  x2, x1, t1   # x2 = 30 << 1 = 60 km/h (Comando do acelerador)

fim_rotina:
    # 4. Encerra o programa
    li   a7, 10
    ecall