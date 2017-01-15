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
set /p input=Choice: 
if EXIST %input% ( cd %input% ) else ( echo Unknown Option! && pause>nul )
cls
goto A