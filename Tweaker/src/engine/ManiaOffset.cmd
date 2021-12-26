REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    set x_1keyOrig=556
    set x_2keyOrig=537
    set x_3keyOrig=517
    if /i "%isManiaTypeArrow%" == "true" (
        set x_4keyOrig=424
    ) else (
        set x_4keyOrig=496
    )
    set x_5keyOrig=477
    set x_6keyOrig=457
    set x_7keyOrig=436
    set x_8keyOrig=417
    set x_9keyOrig=397

:_ack
    if "%ack%" == "" (
        goto :_unknown
    ) else (
        goto %ack%
    )

:_unknown
    msg * ERROR: unknown call
    goto :__end

:_KeyTo16_9
    set /a x_1key=%x_1keyOrig% - %Mania_16_9_Offset%
    set /a x_2key=%x_2keyOrig% - %Mania_16_9_Offset%
    set /a x_3key=%x_3keyOrig% - %Mania_16_9_Offset%
    set /a x_4key=%x_4keyOrig% - %Mania_16_9_Offset%
    set /a x_5key=%x_5keyOrig% - %Mania_16_9_Offset%
    set /a x_6key=%x_6keyOrig% - %Mania_16_9_Offset%
    set /a x_7key=%x_7keyOrig% - %Mania_16_9_Offset%
    set /a x_8key=%x_8keyOrig% - %Mania_16_9_Offset%
    set /a x_9key=%x_9keyOrig% - %Mania_16_9_Offset%
    goto :__end

:_KeyToOrig
    set /a x_1key=%x_1keyOrig%
    set /a x_2key=%x_2keyOrig%
    set /a x_3key=%x_3keyOrig%
    set /a x_4key=%x_4keyOrig%
    set /a x_5key=%x_5keyOrig%
    set /a x_6key=%x_6keyOrig%
    set /a x_7key=%x_7keyOrig%
    set /a x_8key=%x_8keyOrig%
    set /a x_9key=%x_9keyOrig%
    goto :__end

:_KeyToLeft
    set x_1key=152
    set x_2key=152
    set x_3key=152
    set x_4key=152
    set x_5key=152
    set x_6key=152
    set x_7key=152
    set x_8key=152
    set x_9key=152
    goto :__end

:_ClearManiaOffset
    set x_1key=
    set x_2key=
    set x_3key=
    set x_4key=
    set x_5key=
    set x_6key=
    set x_7key=
    set x_8key=
    set x_9key=
    goto :__end

:__end
    set ack=
    set x_1keyOrig=
    set x_2keyOrig=
    set x_3keyOrig=
    set x_4keyOrig=
    set x_5keyOrig=
    set x_6keyOrig=
    set x_7keyOrig=
    set x_8keyOrig=
    set x_9keyOrig=