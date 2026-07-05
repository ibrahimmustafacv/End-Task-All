@echo off
title End Task All - Installer
color 0B

echo ============================================
echo     End Task All - Installer
echo ============================================
echo.
echo This will create a desktop shortcut that
echo instantly force-closes all your open programs
echo (useful when your PC freezes or lags).
echo.
echo The shortcut will:
echo   - Run with Administrator rights
echo   - Have a keyboard shortcut: Ctrl+Alt+A
echo   - Show a Windows security confirmation
echo     before running (Yes/No)
echo.
pause

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0CreateShortcut.ps1"

echo.
echo ============================================
echo Done! Shortcut created on your Desktop.
echo Press Ctrl+Alt+A anytime to close all open
echo programs (a confirmation window will appear).
echo ============================================
echo.
pause
