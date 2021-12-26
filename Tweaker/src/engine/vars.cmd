REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

set root=..
set ack=:_FindByString && call src\engine\BatchINIParser ..\skin.ini Name versionFull
for /f "tokens=1,* delims= " %%a in ('echo %versionFull%') do (
    echo %%b>"%temp%\lolalilu"
)
set /p currentVer=<"%temp%\lolalilu"
del "%temp%\lolalilu"

for /f "tokens=1,2 delims=.rv_" %%a in ('echo %currentVer%') do (
    set majorver=%%a
    set revision=%%b
)

cls

REM echo %username%
REM pause | echo [DEBUG] Press any key to continue...