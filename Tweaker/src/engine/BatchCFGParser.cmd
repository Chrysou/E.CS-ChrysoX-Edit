REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    :: nothing

:_ack
    if "%ack%" == "" (
        goto :_unknown
    ) else (
        goto %ack%
    )

:_unknown
    msg * ERROR: unknown call
    goto :__end

:_FindByString
    set input=%1
    set string=%2
    set outputvar=%3

    for /f "tokens=1,* delims== " %%a in ('type %input%') do (
        if /I "%%a" == "%string%" (
        REM echo String found!
        REM echo    %%a= %%b
            echo %%b>"%temp%\lolalilu"
        )
    )
    set /p %outputvar%=<"%temp%\lolalilu"
    del "%temp%\lolalilu"
    set input=
    set string=
    set outputvar=

    goto :__end

:_Listing
    set input=%1
    set string=%2
    set value=%3
    set output=%4

    if /i %output% == direct (
        set isDirect=true
        set output=%input%.tmp
    )

    echo Lists of data in: %input%
    echo.
    if not "%string%" == "" (
        for /f "tokens=1,* delims== " %%a in ('type %input%') do (
            setlocal enabledelayedexpansion
                echo %%a | find /I "%string%" > nul
                if "!errorlevel!" == "0" (
                    echo String : %%a
                    echo Value  : %%b
                    echo ---------------------------------------------------------
                )
            endlocal
        )
    ) else (
        for /f "tokens=1,* delims== " %%a in ('type %input%') do (
            setlocal enabledelayedexpansion
                set value=%%b
                for /f "tokens=1,* delims= " %%a in ('echo %%a') do (
                    if not "%%a" == "#" (
                        echo String : %%a
                        echo Value  : !value!
                        echo ---------------------------------------------------------
                    )
                )
            endlocal
        )
    )
    echo. && echo Done.

    set input=
    set string=
    set value=
    set output=
    set isDirect=

    goto :__end 

:_replaceValue
    set input=%1
    set string=%2
    set value=%3
    set output=%4

    if /i %output% == direct (
        set isDirect=true
        set output=%input%.tmp
    )

    if /i exist %output% del %output%

    for /f "tokens=*" %%a in ('type %input%') do (
        for /f "tokens=1,* delims== " %%a in ('echo %%a') do (
            if /i "%%a" == "%string%" (
                echo %string% = %value%
            ) else if /i "%%a" == "#" (
                echo # %%b
            ) else (
                echo %%a = %%b
            )
        )
    ) >> %output%

    if /i "%isDirect%" == "true" (
        del %input%
        move /Y %output% %input% | echo. > nul
    )

    set input=
    set string=
    set value=
    set output=
    set isDirect=
    goto :__end
    
:__end
    set ack=