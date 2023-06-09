@echo off
REM Simple batch file to post results online.
REM First we copy the files from C:\realtime the directory where
REM Meet Manager posts the results locally.  Then we use GIT to
REM post the results online to a GIT Repo.
REM Important - The target directory must exist to be successful

set MEET_PATH="C:\MeetResultsWeb\Meets\"
set GIT_PATH="C:\Program Files\Git\bin\git.exe"

REM ============================================================
REM Change this to the year and directory that you wish to post results
REM locally on your computer.
set MEET_YEAR="2023"
set MEET_CURRENT_DIR="TrialsMeet"
REM ============================================================

set TARGET=%MEET_PATH%\%MEET_YEAR%\%MEET_CURRENT_DIR%\

If exist %TARGET% (
  XCOPY C:\realtime %TARGET%   /s /e /k /y
  %GIT_PATH% add -A
  %GIT_PATH% commit -am "Auto-committed on %date%"
  %GIT_PATH% push -u origin main
  ECHO "Exists"
) else (
  ECHO You need to create the target Meet directory: %TARGET%
)

