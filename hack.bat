@echo off
color 0A
cls

:: Display title
echo ==========================
echo        Tool by Hoang
echo ==========================
echo.

:: Request key
set /p key="Enter key to continue: "
if "%key%" NEQ "1234" (
    echo Incorrect key! Exiting the program.
    pause
    exit
)

:loop
setlocal enabledelayedexpansion

echo Searching for the applications pcicfgui.exe and client32.exe...

:: Check for pcicfgui.exe
tasklist | findstr /i "pcicfgui.exe" >nul
if %errorlevel%==0 (
    echo Terminating pcicfgui.exe...
    taskkill /f /im pcicfgui.exe
    if %errorlevel% neq 0 (
        echo ERROR: The process "pcicfgui.exe" could not be terminated. Reason: Access is denied.
    )
) else (
    echo pcicfgui.exe not found.
)

:: Check for client32.exe
tasklist | findstr /i "client32.exe" >nul
if %errorlevel%==0 (
    echo Terminating client32.exe...
    taskkill /f /im client32.exe
    if %errorlevel% neq 0 (
        echo ERROR: The process "client32.exe" could not be terminated. Reason: Access is denied.
    )
) else (
    echo client32.exe not found.
)

:: Delay for 3 seconds
echo Searching for the applications... Please wait.
timeout /t 3 >nul

echo.
echo Success! All specified processes have been checked and terminated if found.
pause
endlocal
goto loop