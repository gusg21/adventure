@echo off
call options.bat
cls
type start-text.txt
pause>nul
cls
cd main
:A
echo Options:
dir /ad /b
echo.
echo Description:
if EXIST text.txt ( type text.txt )
if EXIST script.bat ( call script.bat )
echo.
echo.
for %%* in (.) do set cdname=%%~nx*
set /p input=Choice: 
if %canUndo% EQU 1 ( 
if "%input%" EQU "undo" ( 
if "%cdname%" NEQ "main" (
cd .. 
)
)
)
if EXIST "%input%" ( cd "%input%" ) else ( 
if "%input%" EQU "undo" (
echo Undoing... && pause>nul
) else (
echo Unknown Option! && pause>nul 
)
)
cls
goto A
