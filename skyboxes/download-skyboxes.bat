@echo off
setlocal
cd /d "%~dp0"
echo Model Editor - Poly Haven CC0 Skybox Downloader
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0download-skyboxes.ps1"
if errorlevel 1 (
  echo.
  echo Download failed. Check your internet connection and try again.
  pause
  exit /b 1
)
echo.
echo Done. The four HDR files are now in this skyboxes folder.
echo Upload this folder's contents to your GitHub repository's skyboxes folder.
pause
