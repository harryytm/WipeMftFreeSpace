@echo off
cls
set default=1000
call :msg_main
call :msg_currdir

:start
set input=%default%
set /p input=Input(%input%): 

if "%input%" == "0" goto end
SET "var="&for /f "delims=0123456789" %%i in ("%input%") do set var=%%i
if defined var (
	call :msg_main
	cd /d "%input%"\
	if exist "%input%"\ (
		rem echo Changed directory to %input%
	)
	call :msg_currdir
	goto start
) else (
	set default=%input%
)

cls
echo Creating folders...
FOR /L %%i in (2,1,%input%) do (
	title Creating folder %%i...
	md "tmp\WipeMftFreeSpace%%i"
)

cls
title Cleanup
echo Cleaning up...
rd /s /q tmp
call :msg_main
echo Wiped %input% unused MFT record(s).
call :msg_currdir
goto start

:banner
goto :eof

:msg_main
cls
title Wipe MFT free space tool
echo.
echo  Usage:
echo  - Enter number of MFT record to wipe or leave empty to use default
echo  - Enter a valid path to change directory
echo  - Enter 0 to exit
echo.
goto :eof

:msg_currdir
echo Current directory: %cd%
echo.
goto:eof

:end