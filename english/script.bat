@echo off
setlocal enabledelayedexpansion

echo Enter the Mii's name
set /p output_folder=

if not exist "miis\%output_folder%" mkdir "miis\%output_folder%"

echo Paste the URL of Mii Renderer
set /p "base_url="
set "base_url=%base_url:characterYRotate=%"

cls
echo ***         Summary         ***
echo -------------------------------
echo Mii: %output_folder%
echo Rotation:  from 0 to 359 (full)
echo -------------------------------
echo Press ENTER to download
pause >nul
cls

for /L %%i in (0,1,359) do (
    echo Downloading rotation %%i...
    
    set "url=%base_url%&characterYRotate=%%i"
    
    curl -s "!url!" -o "miis\%output_folder%\mii_rotation_%%i.png"
    
    :: Comprobar si la imagen se descargó correctamente
    if not exist "miis\%output_folder%\mii_rotation_%%i.png" (
        echo Error downloading rotation %%i.
    )
)

cls
echo Download completed. The images are in the folder "miis\%output_folder%"
echo Press any key to end the process
pause >nul
exit
