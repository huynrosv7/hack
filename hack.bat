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

cls
echo Dang bat dau vong lap tim kiem va tat app... (Nhan Ctrl+C de dung)
echo.

setlocal enabledelayedexpansion

:loop
echo Dang tim kiem...

:: Check for pcicfgui.exe
tasklist | findstr /i "pcicfgui.exe" >nul
if %errorlevel%==0 (
    echo Phat hien pcicfgui.exe. Dang tat...
    taskkill /f /im pcicfgui.exe >nul
    if %errorlevel% neq 0 (
        echo LOI: Khong a thae tat "pcicfgui.exe". Ly do: Access is denied.
    ) else (
        echo Da tat pcicfgui.exe thanh cong.
    )
)

:: Check for client32.exe
tasklist | findstr /i "client32.exe" >nul
if %errorlevel%==0 (
    echo Phat hien client32.exe. Dang tat...
    taskkill /f /im client32.exe >nul
    if %errorlevel% neq 0 (
        echo LOI: Khong a thae tat "client32.exe". Ly do: Access is denied.
    ) else (
        echo Da tat client32.exe thanh cong.
    )
)

:: Delay for 1 second
:: Dat lenh nay o cuoi cung truoc khi quay lai :loop
timeout /t 1 >nul

goto loop

endlocal
