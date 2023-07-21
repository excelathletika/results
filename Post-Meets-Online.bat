@echo off
REM Simple batch file to post results online.
REM First we copy the files from C:\realtime the directory where
REM Meet Manager posts the results locally.  Then we use GIT to
REM post the results online to a GIT Repo.

REM Establish default values 
set MEET_PATH="C:\MeetResultsWeb\Meets\"
set GIT_PATH="C:\Program Files\Git\bin\git.exe"

REM ============================================================
REM Change this to the year and directory that you wish to post results
REM locally on your computer.  The target location will be created automatically.
REM Please do not use spaces in names. Instead use Pascal case eg: YourMeetName
set MEET_YEAR="2023"
set MEET_CURRENT_DIR="CanWestChallenge"
REM ============================================================
SET TARGET=%MEET_PATH%\%MEET_YEAR%\%MEET_CURRENT_DIR%\

REM Pull any changes made to the remote to ensure we are in sync.
%GIT_PATH% pull -q

REM If the target doesn't exist create it
If not exist %TARGET% (
  ECHO Creating target location...
  MKDIR %TARGET%
)

ECHO Copying files from HyTek...
XCOPY C:\realtime %TARGET%   /s /e /k /y /q

ECHO Pushing results to the web...
%GIT_PATH% add -A
%GIT_PATH% commit -am "Auto-committed on %date%"
%GIT_PATH% push -u origin main
