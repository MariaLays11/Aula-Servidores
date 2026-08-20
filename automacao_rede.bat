@echo off
color 0A
:inicio
cls
echo ====================================================
echo PAINEL DE ADMINISTRACAO DE REDES - IFCE
echo ====================================================
echo [1] Verificar Configuracoes de IP (Ipconfig)
echo [2] Testar Conectividade com Servidor (Ping)
echo [3] Consultar Registros DNS (Nslookup)
echo [4] Implementação de Logs 
echo [5] Rastreamento (FlushDNS e Tracert)
echo [6] Sair
echo ====================================================
set /p opcao="Selecione uma opcao desejada: "

if "%opcao%"=="1" goto op1
if "%opcao%"=="2" goto op2
if "%opcao%"=="3" goto op3
if "%opcao%"=="4" goto op4
if "%opcao%"=="5" goto op5
if "%opcao%"=="6" goto sair

:: Se o usuario digitar algo invalido, limpa a tela e volta ao inicio
goto inicio

:op1
cls
echo Coletando configuracoes de IP...
ipconfig
echo.
pause
goto inicio

:op2
cls
set /p destino="Digite o IP ou site de destino: "
ping %destino%
echo.
pause
goto inicio

:op3
cls
set /p dominio="Digite o dominio para consulta DNS: "
nslookup %dominio%
echo.
pause
goto inicio

:op4
cls
echo Gerando relatorio de diagnostico da rede...
echo ==================================================== > relatorio_rede.txt
echo PAINEL DE REDE - LOG AUTOMATICO >> relatorio_rede.txt
echo Data e Hora: %date% - %time% >> relatorio_rede.txt
echo ==================================================== >> relatorio_rede.txt
echo. >> relatorio_rede.txt
echo [IPCONFIG] >> relatorio_rede.txt
ipconfig /all >> relatorio_rede.txt
echo. >> relatorio_rede.txt
echo [TESTE DE CONECTIVIDADE] >> relatorio_rede.txt
ping -n 4 8.8.8.8 >> relatorio_rede.txt
echo.
echo [!] Log gerado com sucesso na pasta local como "relatorio_rede.txt"!
pause
goto inicio

:op5
cls
echo [1/2] Limpando o cache do resolvedor DNS...
ipconfig /flushdns
echo.
echo ----------------------------------------------------
set /p rota="Digite o IP ou site para rastrear a rota (Tracert): "
echo Rastreando rota para %rota%...
tracert %rota%
echo.
pause
goto inicio

:sair
exit
