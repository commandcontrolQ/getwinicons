@echo off
setlocal enabledelayedexpansion

rem Check if parameters were passed
if "%~1"=="" ( goto err )

rem Set variables
set "_dll=%~1"
set "_path=C:\Windows\System32\"
set "_fullpath=%_path%%_dll%"

rem Check if extracted folder exists
if exist extracted\ (
    goto delext
) else (
    goto ext
)

:delext
echo Deleting folder...
rd /s /q .\extracted
goto ext

:ext
md extracted
echo Extracting icons...
.\iconsext\iconsext.exe /save %_fullpath% .\extracted -icons
echo Done^^! Now trimming filenames...
goto trim

:done
echo Opening folder...
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

:trim
echo Trimming filenames...
cd extracted

for %%f in (*.ico) do (
    set "name=%%~nf"
    set "newname=!name:*_=!"
    ren "%%f" "!newname!.ico"
)

cd ..
echo Trimming done!
goto done

:end
endlocal
