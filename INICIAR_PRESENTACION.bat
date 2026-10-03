@echo off
chcp 65001 >nul
cd /d "%~dp0"
set PORT=8765

echo.
echo ===============================================
echo   EL HEROE DEL MUNDO - PRESENTACION SADANKAI
echo ===============================================
echo.
echo Iniciando la presentacion en http://127.0.0.1:%PORT%
echo No cierres la ventana del servidor mientras presentas.
echo.

where py >nul 2>&1
if %errorlevel%==0 (
  start "Servidor Presentacion" /min py -m http.server %PORT% --bind 127.0.0.1
  timeout /t 2 /nobreak >nul
  start "" "http://127.0.0.1:%PORT%/index.html"
  exit /b
)

where python >nul 2>&1
if %errorlevel%==0 (
  start "Servidor Presentacion" /min python -m http.server %PORT% --bind 127.0.0.1
  timeout /t 2 /nobreak >nul
  start "" "http://127.0.0.1:%PORT%/index.html"
  exit /b
)

echo No encontre Python instalado.
echo Abri index.html directamente: los videos mostraran un boton para abrir YouTube.
pause
