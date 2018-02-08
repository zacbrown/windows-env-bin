@echo off

:: install chocolatey
if not exist "%ALLUSERSPROFILE%\chocolatey\bin" (
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
) else (
    if not exist "%PROGRAMFILES%\Mozilla Firefox" (
        choco install -y firefox
        choco install -y SublimeText3
        choco install -y ag
        choco install -y git

        git config --global core.editor "'c:/program files/sublime text 3/subl.exe' -w"
    )
)

if defined VS140COMNTOOLS (
    call "%VS140COMNTOOLS%\vsvars32.bat"
)

:: path setup
set PATH=%PATH%;%SystemDrive%\dev\bin

:: app shortcuts
doskey st="C:\Program Files\Sublime Text 3\sublime_text.exe" $*

:: path shortcuts
doskey dev=cd %SystemDrive%\dev
doskey ..=cd ..
doskey ...=cd ..\..\
doskey ....=cd ..\..\..\
doskey touch=copy NUL $*
doskey ls=dir

cd %SystemDrive%\dev