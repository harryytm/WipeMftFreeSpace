@echo off
cls
set default=1000
set scriptname=Wipe MFT free space tool
call :msg_main
call :msg_currdir

:start
call :msg_usage
set input=%default%
set /p input=Input(%input%): 

if "%input%" == "0" goto end
SET "var="&for /f "delims=0123456789" %%i in ("%input%") do set var=%%i
if defined var (
	call :msg_main
	cd /d "%input%"\
	call :msg_currdir
	goto start
) else (
	set default=%input%
)

cls
call :banner
echo Creating folders...
FOR /L %%i in (2,1,%input%) do (
	title %scriptname% - Creating folder %%i...
	md "tmp\WipeMftFreeSpace%%i"
)

title %scriptname% - Cleanup
echo Cleaning up...
rd /s /q tmp
call :msg_main
echo Wiped %input% unused MFT record(s).
call :msg_currdir
goto start

:banner
echo %scriptname%
echo Copyright (C) 2020 Harry Yeung Tim Ming. Licensed under GPLv2.
echo.
goto :eof

:msg_main
cls
call :banner
title %scriptname%
goto :eof

:msg_usage
echo  Usage:
echo  - Enter number of unused MFT record to wipe or leave empty to use default
echo  - Enter a valid path to change directory
echo  - Enter 0 to exit
echo.
goto :eof

:msg_currdir
echo Current directory: %cd%
echo.
goto:eof

:end