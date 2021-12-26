REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    set input=%1
    set outputvar=%2
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

:_8BitToPercent
    set /a %outputvar%=%input% * 100 / ^(256 - 1^)
    goto :__end

:_PercentTo8Bit
    REM Because batch doesn't support float, so multiply it first before calculation running
    set /a %outputvar%=^(^(%input% * 10^) * ^(256 - 1^)^) / 1000
    goto :__end

:__end
    set ack=
    set input=
    set outputvar=