	REM adventure Game Engine

	REM by gusg21

	REM (c) 2017
	
	REM ==================================

	REM The greatest batch game engine ever. *ahem* One of the only batch game engines ever.
	REM It's pretty great. In my completely un-humble opinion.

	REM See how-to.txt to get going!

@echo off
set topPath=%CD%
REM INI File header
set iniheader=[currentArea]
REM Load options
call options.bat
cls
REM Display start message
type start-text.txt
pause>nul
cls
cd main
:A
REM Show directories as options
echo Options:
dir /ad /b
echo.
REM Show text.txt as the description
echo Description:
if EXIST text.txt ( type text.txt )
if EXIST script.bat ( call script.bat )
echo.
echo.

REM Read input
set /p input=Choice: 

REM DETECTION
REM =========

REM Detect save command
if %saveSystem% EQU 1 (
if "%input%" EQU "save" (
REM Handle command
(
  echo cd %CD%
) > "%topPath%/data/last-save.bat"
echo Saved.
pause >nul
cls
goto A
)
)

REM Detect load command
if %saveSystem% EQU 1 (
if "%input%" EQU "load" (
REM Handle command
if EXIST "%topPath%/data/last-save.bat" (
call "%topPath%/data/last-save.bat"
echo Loaded.
) else (
echo No save file found!
)
pause >nul
cls
goto A
)
)

REM Detect "undo" command
for %%* in (.) do set cdname=%%~nx*
if %canUndo% EQU 1 ( 
if "%input%" EQU "undo" ( 
if "%cdname%" NEQ "main" (
cd .. 
)
)
)

REM Move into the option chosen
if EXIST "%input%" ( cd "%input%" ) else ( 
if "%input%" EQU "undo" ( 
if %canUndo% EQU 1 (
echo Undoing... && pause>nul 
) else (
echo Unknown Option! && pause>nul 
)
) else (
echo Unknown Option! && pause>nul 
)
)
cls
goto A
