REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    set animIndexFile=src\sprites\animations\index

:_ack
    if "%ack%" == "" (
        goto :_unknown
    ) else (
        goto %ack%
    )

:_unknown
    msg * ERROR: unknown call
    goto :__end

:_generateAnimExecList
(
    echo :: This script was generated automatically by Tweaker. Please be patient!
    echo :: last exectued at [%date%][%time%] by [%username%]
    echo.
    for /f "tokens=1" %%a in ('type %animIndexFile%') do (
        echo set currentAnim=%%a
        echo set ack=_FindByString ^&^& call src\engine\BatchCFGParser "src\sprites\animations\%%a\config.cfg" staticframe animStaticFrame
        echo set ack=_FindByString ^&^& call src\engine\BatchCFGParser "src\sprites\animations\%%a\config.cfg" location animLocation
        echo set ack=_FindByString ^&^& call src\engine\BatchCFGParser "src\sprites\animations\%%a\config.cfg" filenameprefix animFilePrefix
        echo set ack=_changeAnimFile ^&^& call src\engine\DoApply
        echo. 
    )
) > src\engine\vars\_AnimExecList.bat

    goto :__end

:__end
    set animIndexFile=