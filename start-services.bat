@echo off
echo Iniciando script de servicos...

:: Definir variaveis de ambiente
set GRADLE_CMD=.\gradlew
set LOGS_DIR=.\logs

:: Criar diretório para logs
if not exist "%LOGS_DIR%" mkdir "%LOGS_DIR%"

:: Executar build antes de iniciar os serviços
echo.
echo === Executando build do projeto ===
call %GRADLE_CMD% clean build
if %ERRORLEVEL% NEQ 0 (
    echo Falha no build. Não é possível iniciar os servicos.
    pause
    exit /b 1
)
echo Build concluido com sucesso!

:: Definir caminhos dos JARs
set MS_DISCOVERY_JAR=ms-discovery\build\libs\ms-discovery-0.0.1-SNAPSHOT.jar
set MS_PRODUTO_JAR=ms-produtos\build\libs\ms-produtos-1.0.jar
set MS_PEDIDO_JAR=ms-pedidos\build\libs\ms-pedidos-1.0.jar
set MS_GATEWAY_JAR=ms-gateway\build\libs\ms-gateway-0.0.1-SNAPSHOT.jar

:: Verificar se os arquivos JAR existem
if not exist "%MS_DISCOVERY_JAR%" (
    echo Arquivo %MS_DISCOVERY_JAR% nao encontrado.
    pause
    exit /b 1
)
if not exist "%MS_PRODUTO_JAR%" (
    echo Arquivo %MS_PRODUTO_JAR% nao encontrado.
    pause
    exit /b 1
)
if not exist "%MS_PEDIDO_JAR%" (
    echo Arquivo %MS_PEDIDO_JAR% nao encontrado.
    pause
    exit /b 1
)
if not exist "%MS_GATEWAY_JAR%" (
    echo Arquivo %MS_GATEWAY_JAR% nao encontrado.
    pause
    exit /b 1
)

echo.
echo === Iniciando servicos em ordem ===

:: Iniciar ms-discovery (prioridade máxima)
echo.
echo Iniciando MS-DISCOVERY...
start "MS-DISCOVERY" java -jar %MS_DISCOVERY_JAR%
echo Aguardando MS-DISCOVERY inicializar (30 segundos)...
timeout /t 30 /nobreak > nul

:: Iniciar ms-produto
echo.
echo Iniciando MS-PRODUTO...
start "MS-PRODUTO" java -jar %MS_PRODUTO_JAR%
echo Aguardando MS-PRODUTO inicializar (15 segundos)...
timeout /t 15 /nobreak > nul

:: Iniciar ms-pedido
echo.
echo Iniciando MS-PEDIDO...
start "MS-PEDIDO" java -jar %MS_PEDIDO_JAR%
echo Aguardando MS-PEDIDO inicializar (15 segundos)...
timeout /t 15 /nobreak > nul

:: Iniciar ms-gateway
echo.
echo Iniciando MS-GATEWAY...
start "MS-GATEWAY" java -jar %MS_GATEWAY_JAR%
echo Aguardando MS-GATEWAY inicializar (15 segundos)...
timeout /t 15 /nobreak > nul

echo.
echo === Todos os servicos foram iniciados com sucesso ===

echo.
echo Pressione qualquer tecla para encerrar todos os servicos...
pause > nul

echo.
echo === Encerrando servicos ===
taskkill /F /IM java.exe
echo Todos os servicos foram encerrados.

pause
exit /b 0