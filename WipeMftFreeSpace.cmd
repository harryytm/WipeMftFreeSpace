@echo off
cls
set input=100

:start
title Wipe MFT free space tool
echo Current path: %~dp0
set /p input=Number of MFT record to wipe (%input%, 0 = exit): 
if "%input%" == "0" goto exit
cls
echo Working...

FOR /L %%i in (2,1,%input%) do (
title Creating folder %%i...
md tmp\%%i)
title Cleanup...
rd /s /q tmp
cls
echo Wiped %input% unused MFT record(s).
goto start

:end