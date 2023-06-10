echo off
REM Simple batch file to post results online
REM Used to push resutls

XCOPY C:\realtime C:\MeetResultsWeb\Meets\2023\TrialsMeet  /s
RENAME C:\MeetResultsWeb\Meets\2023\TrialsMeet\index.htm C:\:\MeetResultsWeb\Meets\2023\TrialsMeet\index.html  