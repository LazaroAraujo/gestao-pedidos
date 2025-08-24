#!/bin/bash
echo "Iniciando script de serviços..."

# Definir variáveis de ambiente
GRADLE_CMD="./gradlew"
LOGS_DIR="./logs"

# Criar diretório para logs
mkdir -p "${LOGS_DIR}"

# Executar build antes de iniciar os serviços
echo
echo "=== Executando build do projeto ==="
${GRADLE_CMD} clean build
if [ $? -ne 0 ]; then
    echo "Falha no build. Não é possível iniciar os serviços."
    read -p "Pressione ENTER para continuar..."
    exit 1
fi
echo "Build concluído com sucesso!"

# Definir caminhos dos JARs
MS_DISCOVERY_JAR="ms-discovery/build/libs/ms-discovery-0.0.1-SNAPSHOT.jar"
MS_PRODUTO_JAR="ms-produtos/build/libs/ms-produtos-1.0.jar"
MS_PEDIDO_JAR="ms-pedidos/build/libs/ms-pedidos-1.0.jar"
MS_GATEWAY_JAR="ms-gateway/build/libs/ms-gateway-0.0.1-SNAPSHOT.jar"

# Verificar se os arquivos JAR existem
for JAR in "${MS_DISCOVERY_JAR}" "${MS_PRODUTO_JAR}" "${MS_PEDIDO_JAR}" "${MS_GATEWAY_JAR}"; do
    if [ ! -f "${JAR}" ]; then
        echo "Arquivo ${JAR} não encontrado."
        read -p "Pressione ENTER para continuar..."
        exit 1
    fi
done

echo
echo "=== Iniciando serviços em ordem ==="

# Iniciar ms-discovery (prioridade máxima)
echo
echo "Iniciando MS-DISCOVERY..."
java -jar ${MS_DISCOVERY_JAR} > "${LOGS_DIR}/ms-discovery.log" 2>&1 &
DISCOVERY_PID=$!
echo "Aguardando MS-DISCOVERY inicializar (30 segundos)..."
sleep 30

# Iniciar ms-produto
echo
echo "Iniciando MS-PRODUTO..."
java -jar ${MS_PRODUTO_JAR} > "${LOGS_DIR}/ms-produto.log" 2>&1 &
PRODUTO_PID=$!
echo "Aguardando MS-PRODUTO inicializar (15 segundos)..."
sleep 15

# Iniciar ms-pedido
echo
echo "Iniciando MS-PEDIDO..."
java -jar ${MS_PEDIDO_JAR} > "${LOGS_DIR}/ms-pedido.log" 2>&1 &
PEDIDO_PID=$!
echo "Aguardando MS-PEDIDO inicializar (15 segundos)..."
sleep 15

# Iniciar ms-gateway
echo
echo "Iniciando MS-GATEWAY..."
java -jar ${MS_GATEWAY_JAR} > "${LOGS_DIR}/ms-gateway.log" 2>&1 &
GATEWAY_PID=$!
echo "Aguardando MS-GATEWAY inicializar (15 segundos)..."
sleep 15

echo
echo "=== Todos os serviços foram iniciados com sucesso ==="

echo
echo "Pressione CTRL+C para encerrar todos os serviços..."
read -r

echo
echo "=== Encerrando serviços ==="
pkill -f java
echo "Todos os serviços foram encerrados."

exit 0