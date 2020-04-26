@echo off
cls
set input=100

:start
title Wipe MFT free space tool
echo Current path: %~dp0
echo.
echo  - Enter number of MFT record to wipe or leave empty to use default
echo  - Enter 0 to exit
echo.
set /p input=Input(%input%): 

if "%input%" == "0" goto exit

cls
echo Creating folders...
FOR /L %%i in (2,1,%input%) do (
	title Creating folder %%i...
	md tmp\WipeMftFreeSpace%%i
)

cls
title Cleanup
echo Cleaning up...
rd /s /q tmp
cls
echo Wiped %input% unused MFT record(s).
echo.
goto start

:end