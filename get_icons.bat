@echo off
setlocal

:: Check if parameters were passed
if "%~1"=="" ( goto err )

set "_dll=%~1"
set "_path=C:\Windows\System32\"
set "_fullpath=%_path%%_dll%"

if exist extracted\ (
    goto delext
) else (
    goto ext
)

:delext
echo Creating folder...
rd /s /q .\extracted
goto ext

:ext
md extracted
echo Extracting icons...
.\iconsext\iconsext.exe /save %_fullpath% .\extracted -icons
echo Done! If there are no icons inside, then either:
echo.
echo 1. The DLL file had no icons present.
echo 2. The path does not point to a (valid) DLL file.
explorer extracted
goto end

:err
echo This script extracts icons from any DLL located in the System32 folder.
echo.
echo Usage: get_icons.bat [dll]
echo.
echo Parameters:
echo   dll - The name of the library to operate on.
echo.
echo Example: get_icons.bat imageres.dll
exit /b

:: End of script
:end
endlocal
