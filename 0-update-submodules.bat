@echo off

:: Enable necessary extensions
@setlocal enableextensions

echo ::: UPDATE SUBMODULES BEGIN ::::

echo Get the current directory
set "currentDir=%CD%"

echo Change the current working directory to the script directory
@cd /d "%~dp0"

del desktop.ini /A:H /S

for /r %%i in (desktop.ini) do (
    git rm --cached --force "%%i"
)

git submodule update --remote --merge

echo ::: UPDATE SUBMODULES COMPLETED ::::
pause