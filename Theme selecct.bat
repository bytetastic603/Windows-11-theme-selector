@echo off
title Ultimate Windows Theme Panel
:menu
cls
echo ===================================================
echo            WINDOWS SYSTEM THEME SELECTOR          
echo ===================================================
echo  Welcome! Choose which theme style to apply:
echo.
echo  --- STANDARD THEMES ---
echo  [1] Aero (Light Theme)
echo  [2] Aero Dark (Dark Theme)
echo  [3] Windows Spotlight Mode
echo  [4] Glow (Theme A)
echo  [5] Captured Motion (Theme B)
echo  [6] Sunrise (Theme C)
echo  [7] Flow (Theme D)
echo.
echo  --- HIGH CONTRAST THEMES ---
echo  [8] High Contrast #1
echo  [9] High Contrast #2
echo  [10] High Contrast Black
echo  [11] High Contrast White
echo.
echo  [12] Exit Application
echo ===================================================
echo.
set /p choice="Enter your selection number (1-12): "

:: Map standard themes
if "%choice%"=="1" set "theme_path=C:\Windows\Resources\Themes\aero.theme" & goto apply
if "%choice%"=="2" set "theme_path=C:\Windows\Resources\Themes\dark.theme" & goto apply
if "%choice%"=="3" set "theme_path=C:\Windows\Resources\Themes\spotlight.theme" & goto apply
if "%choice%"=="4" set "theme_path=C:\Windows\Resources\Themes\themeA.theme" & goto apply
if "%choice%"=="5" set "theme_path=C:\Windows\Resources\Themes\themeB.theme" & goto apply
if "%choice%"=="6" set "theme_path=C:\Windows\Resources\Themes\themeC.theme" & goto apply
if "%choice%"=="7" set "theme_path=C:\Windows\Resources\Themes\themeD.theme" & goto apply

:: Map Ease of Access themes
if "%choice%"=="8" set "theme_path=C:\Windows\Resources\Ease of Access Themes\hc1.theme" & goto apply
if "%choice%"=="9" set "theme_path=C:\Windows\Resources\Ease of Access Themes\hc2.theme" & goto apply
if "%choice%"=="10" set "theme_path=C:\Windows\Resources\Ease of Access Themes\hcblack.theme" & goto apply
if "%choice%"=="11" set "theme_path=C:\Windows\Resources\Ease of Access Themes\hcwhite.theme" & goto apply

if "%choice%"=="12" exit
goto menu

:apply
cls
echo ===================================================
echo  Initializing Windows Personalization Engine...
echo  Applying selection path...
echo ===================================================
echo.

:: Check if our run_silent.vbs companion is next to the batch file
if exist "run_silent.vbs" (
    cscript //nologo run_silent.vbs "%theme_path%"
) else (
    start "" "%theme_path%"
)

echo Loading color palettes and assets...
:: High Contrast themes sometimes take an extra second to map UI elements
timeout /t 4 /nobreak >nul

echo Closing window interfaces cleanly...
taskkill /f /im SystemSettings.exe >nul 2>&1

goto menu
