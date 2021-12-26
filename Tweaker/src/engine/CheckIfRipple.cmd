REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    set isRipple=false
    set Ripple=
    find "51.15.222.176" "%systemroot%\system32\drivers\etc\hosts" > nul
    if "%errorlevel%" == "0" (
        echo Hey Dude, You are currently using Ripple server!
        goto :_confirmRipple
    )
    goto :__end

:_confirmRipple
    set isRipple=true
    set Ripple=^[osu!Ripple^]
    goto :__end

:__end
    set ack=