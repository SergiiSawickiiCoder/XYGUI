@echo off
setlocal

set "ROOT_DIR=%~dp0"
set "PYTHON_EXE="
cd /d "%ROOT_DIR%source_files"

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

call %PYTHON_EXE% -c "import serial, minimalmodbus, PyQt5, pyqtgraph" >nul 2>nul
if errorlevel 1 goto :missing_deps

call %PYTHON_EXE% dps_GUI_program.py
goto :end

:python_not_found
echo Python not found.
echo Install Python 3.13 or 3.12 and then run this file again.
pause
goto :end

:missing_deps
echo Required Python packages are missing for:
echo %PYTHON_EXE%
echo Run "%ROOT_DIR%install_requirements.bat" first.
pause

:end
endlocal
