@echo off
if exist "%~dp0install.ps1" (powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1") else (powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\install.ps1")
pause
