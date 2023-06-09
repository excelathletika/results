@echo off
REM Simple batch file to post results online

set GIT_PATH="C:\Program Files\Git\bin\git.exe"

%GIT_PATH% add -A
%GIT_PATH% commit -am "Auto-committed on %date%"
%GIT_PATH% push -u origin main

