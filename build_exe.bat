@echo off
setlocal

set "ROOT_DIR=%~dp0"
set "SRC_DIR=%ROOT_DIR%source_files"
set "PYTHON_EXE="
cd /d "%ROOT_DIR%"

if exist "%LocalAppData%\Programs\Python\Python313\python.exe" set "PYTHON_EXE=%LocalAppData%\Programs\Python\Python313\python.exe"
if not defined PYTHON_EXE if exist "%LocalAppData%\Programs\Python\Python312\python.exe" set "PYTHON_EXE=%LocalAppData%\Programs\Python\Python312\python.exe"
if not defined PYTHON_EXE if exist "%LocalAppData%\Programs\Python\Python311\python.exe" set "PYTHON_EXE=%LocalAppData%\Programs\Python\Python311\python.exe"

if not defined PYTHON_EXE (
    where py >nul 2>nul
    if %errorlevel%==0 set "PYTHON_EXE=py -3"
)

if not defined PYTHON_EXE (
    where python >nul 2>nul
    if %errorlevel%==0 set "PYTHON_EXE=python"
)

if not defined PYTHON_EXE goto :python_not_found

call %PYTHON_EXE% -m ensurepip --upgrade >nul 2>nul
call %PYTHON_EXE% -m pip install pyinstaller
if errorlevel 1 goto :build_failed

call %PYTHON_EXE% -m PyInstaller ^
    --noconfirm ^
    --clean ^
    --windowed ^
    --name XYGUI ^
    --add-data "%SRC_DIR%\dps_GUI.ui;." ^
    --add-data "%SRC_DIR%\dps5005_limits.ini;." ^
    --add-data "%SRC_DIR%\icon;icon" ^
    "%SRC_DIR%\dps_GUI_program.py"
if errorlevel 1 goto :build_failed

echo.
echo Build complete.
echo EXE folder: "%ROOT_DIR%dist\XYGUI"
pause
goto :end

:python_not_found
echo Python not found.
echo Install Python 3.13 or 3.12 and then run this file again.
pause
goto :end

:build_failed
echo Build failed.
pause

:end
endlocal
