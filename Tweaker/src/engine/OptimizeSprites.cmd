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

:_doSpritesOptimizing
    if "%PNG_MINIMIZE%" == "true" (
        if /I "%isSD%" == "true" (
            del src\caches\*@2x.png>nul
        )
        cls
        title=Optimizing sprites... ^| Wait a moment...
        echo Optimizing sprites... ^| Wait a moment...
        echo It may take a or two minutes or even more...
        echo.
        for /r %%a in (src\caches\*.png) do (
        REM src\pngquant.exe --force --verbose --speed=1 --quality=90 --floyd=0.5 --strip --output "src\caches\%%~na.png.tmp" "%%a"
        REM del "%%a"
        REM move /Y "src\caches\%%~na.png.tmp" "..\%%~na.png"
            echo ------ Optimizing: %%~na...
            copy "%%a" "src\caches\%%~na.tmp.png">nul
            src\pingo.exe -auto -s9 -strip=3 -multiprocess=1 -srgb -noconversion -verbose=3 "src\caches\%%~na.tmp.png"
            src\pingo.exe -s9 -strip=3 -multiprocess=1 -srgb -noconversion -verbose=3 "src\caches\%%~na.tmp.png"
            del "%%a">nul
            move /Y "src\caches\%%~na.tmp.png" "..\%%~na.png">nul
        )
    ) else (
        if /I "%isSD%" == "true" (
            del src\caches\*@2x.png>nul
        )
        for /r %%a in (src\caches\*.png) do (
            move /Y "%%a" "..\%%~na.png">nul
        )
    )