@echo off
cls
type start-text.txt
pause>nul
cls
cd main
:A
dir /ad /b
echo.
if EXIST text.txt ( type text.txt )
if EXIST script.bat ( call script.bat )
echo.
echo.
set /p input=Option: 
if EXIST %input% ( cd %input% ) else ( echo Unknown Option! && pause>nul )
cls
goto A