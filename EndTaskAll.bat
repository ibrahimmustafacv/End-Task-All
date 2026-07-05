@echo off
title End Task All - Free Up Your Frozen PC
color 0A

echo ============================================
echo         END TASK ALL - v1.0
echo ============================================
echo.
echo This tool will FORCE CLOSE all running programs
echo (except Explorer and the Desktop Manager).
echo.
echo WARNING: Any unsaved work will be LOST.
echo Use this only when your PC is frozen or too slow.
echo.
echo ============================================
set /p confirm="Type Y and press Enter to continue, or anything else to cancel: "

if /I "%confirm%"=="Y" (
    echo.
    echo Closing programs, please wait...
    taskkill /F /FI "USERNAME eq %USERNAME%" /FI "IMAGENAME ne explorer.exe" /FI "IMAGENAME ne dwm.exe" /FI "IMAGENAME ne cmd.exe" /FI "IMAGENAME ne taskmgr.exe"
    echo.
    echo Done! Most background programs have been closed.
) else (
    echo.
    echo Cancelled. No programs were closed.
)

echo.
pause
