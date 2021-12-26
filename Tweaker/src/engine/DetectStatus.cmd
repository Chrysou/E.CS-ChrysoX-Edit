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

:_checkAnimationStatus
    set /p isAnimOn=<src\engine\vars\AnimationToggle
    if /I "%isAnimOn%" == "true" (
        set AnimStat=ON
    ) else (
        set AnimStat=OFF
    )

    goto :__end

:_checkOsuHitlightStatus
    set /p isOsuLightOn=<src\engine\vars\OsuHitlightingToggle
    if /I "%isOsuLightOn%" == "true" (
        set OsuHitlightStat=ON
    ) else (
        set OsuHitlightStat=OFF
    )

    goto :__end

:_checkScorebarKiStatus
    set /p isScorebarKiOn=<src\engine\vars\ScorebarKiToggle
    if /I "%isScorebarKiOn%" == "true" (
        set ScorebarKiStat=ON
    ) else (
        set ScorebarKiStat=OFF
    )

    goto :__end

:_checkDisplay
    set file=%1
    set displayCurrentIndicator=^[Active^]
    set isDisplay_3840x2160=
    set isDisplay_2560x1440=
    set isDisplay_1920x1080=
    set isDisplay_1600x900=
    set isDisplay_1366x768=
    set isDisplay_1280x720=
    set isDetected16_9=
    set isDetectedWide=

    set ack=_FindByString && call src\engine\BatchCFGParser %file% WidthFullscreen displayWidth
    set ack=_FindByString && call src\engine\BatchCFGParser %file% HeightFullscreen displayHeight

    :_checkDisplay_3840x2160
        if "%displayWidth%" == "3840" (
            if "%displayHeight%" == "2160" (
                set isDisplay_3840x2160=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "1600" (
                set isDisplay_3840x2160=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplay_2560x1440
        if "%displayWidth%" == "2560" (
            if "%displayHeight%" == "1440" (
                set isDisplay_2560x1440=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "1066" (
                set isDisplay_2560x1440=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplay_1920x1080
        if "%displayWidth%" == "1920" (
            if "%displayHeight%" == "1080" (
                set isDisplay_1920x1080=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "800" (
                set isDisplay_1920x1080=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplay_1600x900
        if "%displayWidth%" == "1600" (
            if "%displayHeight%" == "900" (
                set isDisplay_1600x900=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "666" (
                set isDisplay_1600x900=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplay_1366x768
        if "%displayWidth%" == "1366" (
            if "%displayHeight%" == "768" (
                set isDisplay_1366x768=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "569" (
                set isDisplay_1366x768=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplay_1280x720
        if "%displayWidth%" == "1280" (
            if "%displayHeight%" == "720" (
                set isDisplay_1280x720=%displayCurrentIndicator%
                echo false>src\engine\vars\isDisplayWide
            ) else if "%displayHeight%" == "533" (
                set isDisplay_1280x720=%displayCurrentIndicator%
                echo true>src\engine\vars\isDisplayWide
            )
        )

    :_checkDisplayAspectRatioMode
        set /p isDisplayWide=<src\engine\vars\isDisplayWide
        if /i "%isDisplayWide%" == "true" (
            set isDetected16_9=
            set isDetectedWide=%displayCurrentIndicator%
        ) else (
            set isDetected16_9=%displayCurrentIndicator%
            set isDetectedWide=
        )
    set file=
    set displayWidth=
    set displayHeight=
    set displayCurrentIndicator=

    goto :__end

:_checkColor_Status
    set file=%1
    set isBorderWhite=
    set isBorderGreen=
    set isBorderBlue=
    set isBorderRed=
    set isBorderOrange=
    set isBorderCustom=
    set displayCurrentIndicator=^[Active^]
    set rCol=
    set gCol=
    set bCol=

    set ack=_FindByString && call src\engine\BatchINIParser %file% SliderBorder borderColor

    :_checkColor_Status_Get
        for /f "tokens=1,2,3 delims=, " %%a in ('echo %borderColor%') do (
            echo %%a>"%temp%\lolalilu_rCol"
            echo %%b>"%temp%\lolalilu_gCol"
            echo %%c>"%temp%\lolalilu_bCol"
        )
        set /p rCol=<"%temp%\lolalilu_rCol"
        set /p gCol=<"%temp%\lolalilu_gCol"
        set /p bCol=<"%temp%\lolalilu_bCol"
        del "%temp%\lolalilu_rCol"
        del "%temp%\lolalilu_gCol"
        del "%temp%\lolalilu_bCol"
        
        set isBorderCustom=%displayCurrentIndicator%

        :_checkColor_Status_Get_Init
            if "%rCol%" == "%rBorderWhite%" (
                if "%gCol%" == "%gBorderWhite%" (
                    if "%bCol%" == "%bBorderWhite%" (
                        set isBorderWhite=%displayCurrentIndicator%
                        set isBorderCustom=
                    )
                )
            )

            if "%rCol%" == "%rBorderGreen%" (
                if "%gCol%" == "%gBorderGreen%" (
                    if "%bCol%" == "%bBorderGreen%" (
                        set isBorderGreen=%displayCurrentIndicator%
                        set isBorderCustom=
                    )
                )
            )

            if "%rCol%" == "%rBorderBlue%" (
                if "%gCol%" == "%gBorderBlue%" (
                    if "%bCol%" == "%bBorderBlue%" (
                        set isBorderBlue=%displayCurrentIndicator%
                        set isBorderCustom=
                    )
                )
            )

            if "%rCol%" == "%rBorderRed%" (
                if "%gCol%" == "%gBorderRed%" (
                    if "%bCol%" == "%bBorderRed%" (
                        set isBorderRed=%displayCurrentIndicator%
                        set isBorderCustom=
                    )
                )
            )

            if "%rCol%" == "%rBorderOrange%" (
                if "%gCol%" == "%gBorderOrange%" (
                    if "%bCol%" == "%bBorderOrange%" (
                        set isBorderOrange=%displayCurrentIndicator%
                        set isBorderCustom=
                    )
                )
            )

    set file=
    set borderColor=
    set displayCurrentIndicator=

    goto :__end
    
:_checkManiaNotesType
    set maniaTypeDefault=
    set maniaTypeArrow=
    set displayCurrentIndicator=^[Active^]

    set /p isManiaTypeArrow=<src\engine\vars\isManiaTypeArrow
    if /i "%isManiaTypeArrow%" == "true" (
        set maniaTypeDefault=
        set maniaTypeArrow=%displayCurrentIndicator%
    ) else (
        set maniaTypeDefault=%displayCurrentIndicator%
        set maniaTypeArrow=
    )
    
    set displayCurrentIndicator=
    
    goto :__end

:_checkHitCircleColorScheme
	set isBlueHitCircleActive=
	set isGreenHitCircleActive=
	set isRedHitCircleActive=
	set isOrangeHitCircleActive=
	set isDefaultHitCircleActive=
    set displayCurrentIndicator=^[Active^]

	set /p ActiveHitCircleColorScheme=<src\engine\vars\HitCircleColorScheme
	if /i "%ActiveHitCircleColorScheme%" == "Blue" (
		set isBlueHitCircleActive=%displayCurrentIndicator%
	) else if /i "%ActiveHitCircleColorScheme%" == "Green" (
		set isGreenHitCircleActive=%displayCurrentIndicator%
	) else if /i "%ActiveHitCircleColorScheme%" == "Red" (
		set isRedHitCircleActive=%displayCurrentIndicator%
	) else if /i "%ActiveHitCircleColorScheme%" == "Orange" (
		set isOrangeHitCircleActive=%displayCurrentIndicator%
	) else if /i "%ActiveHitCircleColorScheme%" == "Default" (
		set isDefaultHitCircleActive=%displayCurrentIndicator%
	)

:_checkCursorCurrentColor
	set isCursorColorOrange=
	set isCursorColorGreen=
	set isCursorColorBlue=
	set isCursorColorPurple=
	set isCursorColorRed=
    set displayCurrentIndicator=^[Active^]
	
	set /p ActiveCursorColor=<src\engine\vars\CursorColor
	if /i "%ActiveCursorColor%" == "Orange" (
		set isCursorColorOrange=%displayCurrentIndicator%
	) else if /i "%ActiveCursorColor%" == "Green" (
		set isCursorColorGreen=%displayCurrentIndicator%
	) else if /i "%ActiveCursorColor%" == "Blue" (
		set isCursorColorBlue=%displayCurrentIndicator%
	) else if /i "%ActiveCursorColor%" == "Purple" (
		set isCursorColorPurple=%displayCurrentIndicator%
	) else if /i "%ActiveCursorColor%" == "Red" (
		set isCursorColorRed=%displayCurrentIndicator%
	)

:__end
    set ack=