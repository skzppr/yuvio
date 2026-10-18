@echo off
if exist "%~dp0uninstall.ps1" (powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0uninstall.ps1") else (powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\uninstall.ps1")
pause
