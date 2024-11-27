@echo off
chcp 65001>NUL
setlocal enabledelayedexpansion

echo Introduce el nombre del Mii
set /p output_folder=

if not exist "miis\%output_folder%" mkdir "miis\%output_folder%"

echo Pega la URL de Mii Renderer
set /p "base_url="
set "base_url=%base_url:characterYRotate=%"

cls
echo ***         Resumen         ***
echo -------------------------------
echo Mii: %output_folder%
echo Rotación: de 0 a 359 (completa)
echo -------------------------------
echo Puls ENTER para descargar
pause >nul
cls

for /L %%i in (0,1,359) do (
    echo Descargando rotación %%i...
    
    set "url=%base_url%&characterYRotate=%%i"
    
    curl -s "!url!" -o "miis\%output_folder%\mii_rotation_%%i.png"
    
    if not exist "miis\%output_folder%\mii_rotation_%%i.png" (
        echo Error al descargar la rotación %%i.
    )
)

cls
echo Descarga completada. Las imágenes están en la carpeta "miis\%output_folder%"
echo Pulsa cualquier tecla para finalizar
pause >nul
exit
