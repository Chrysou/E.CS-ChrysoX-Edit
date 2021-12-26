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

:_doApplyHitcircle
cls
    title=Rendering sprites... ^| Wait a moment...
    echo Rendering sprites... ^| Wait a moment...
	echo.
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\HitcircleReplace"

    goto :__end

:_doApplyHitcircleColorScheme
	echo Applying changes, Please wait...
	if "%hitcircleColor%" == "1" (
		set _hcColorTemplate=SetHitCircleColorBlue
		echo Blue>src\engine\vars\HitCircleColorScheme
	) else if "%hitcircleColor%" == "2" (
		set _hcColorTemplate=SetHitCircleColorGreen
		echo Green>src\engine\vars\HitCircleColorScheme
	) else if "%hitcircleColor%" == "3" (
		set _hcColorTemplate=SetHitCircleColorRed
		echo Red>src\engine\vars\HitCircleColorScheme
	) else if "%hitcircleColor%" == "4" (
		set _hcColorTemplate=SetHitCircleColorOrange
		echo Orange>src\engine\vars\HitCircleColorScheme
	) else if "%hitcircleColor%" == "5" (
		set _hcColorTemplate=SetHitCircleColorDefault
		echo Default>src\engine\vars\HitCircleColorScheme
	)
    set ack=:_ReplaceValue_FullReferenceBased && call "src\engine\BatchINIParser" "%skinConfigFile%" src\engine\batch\ReferenceLists\%_hcColorTemplate%.ref DIRECT
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\ReverseArrowColorChange"

	goto :__end
    

:_doRenderSprite_cursor
cls
    title=Rendering sprites... ^| Wait a moment...
    echo Rendering sprites... ^| Wait a moment...
	echo.
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\CursorColorChange"

    goto :__end

:_doRenderSprite
cls
    title=Rendering sprites... ^| Wait a moment...
    echo Rendering sprites... ^| Wait a moment...
    echo It may take a or two minutes...
	echo.
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\RenderSprites"

    goto :__end

:_doApplyCustomManiaPos
cls
    title=Applying your settings... ^| Wait a moment...
    echo Applying your settings... ^| Wait a moment...
    echo It may take a or two minutes...
    echo.
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\SetManiaPos"
    
    goto :__end

:_changeOsuHitlightingStat
    if /I "%isOsuLightOn%" == "true" (
        :_setOsuHitlightingOFF
        del ..\lighting@2x.png > nul
        del ..\lighting.png > nul
        copy /Y src\sprites\blank.png ..\lighting.png > nul
        echo false>src\engine\vars\OsuHitlightingToggle
    ) else (
        :_setOsuHitlightingON
        copy /Y src\sprites\lighting@2x.png ..\lighting@2x.png > nul
        src\magick.exe convert "..\lighting@2x.png" -strip -resize 50%% -filter Box "..\lighting.png"
        if /I "%isSD%" == "true" (
            del ..\lighting@2x.png
        )
        echo true>src\engine\vars\OsuHitlightingToggle
    )

    goto :__end

:_changeScorebarKiStat
    if /I "%isScorebarKiOn%" == "true" (
        :_setScorebarKiOFF
        del ..\scorebar-ki@2x.png > nul
        del ..\scorebar-ki.png > nul
        del ..\scorebar-kidanger@2x.png > nul
        del ..\scorebar-kidanger.png > nul
        del ..\scorebar-kidanger2@2x.png > nul
        del ..\scorebar-kidanger2.png > nul
        copy /Y src\sprites\blank.png ..\scorebar-ki.png > nul
        copy /Y src\sprites\blank.png ..\scorebar-kidanger.png > nul
        copy /Y src\sprites\blank.png ..\scorebar-kidanger2.png > nul
        echo false>src\engine\vars\ScorebarKiToggle
    ) else (
        :_setScorebarKiON
        copy /Y src\sprites\scorebar-ki\scorebar-ki@2x.png ..\scorebar-ki@2x.png > nul
        copy /Y src\sprites\scorebar-ki\scorebar-kidanger@2x.png ..\scorebar-kidanger@2x.png > nul
        copy /Y src\sprites\scorebar-ki\scorebar-kidanger2@2x.png ..\scorebar-kidanger2@2x.png > nul
        src\magick.exe convert "..\scorebar-ki@2x.png" -strip -resize 50%% -filter Box "..\scorebar-ki.png"
        src\magick.exe convert "..\scorebar-kidanger@2x.png" -strip -resize 50%% -filter Box "..\scorebar-kidanger.png"
        src\magick.exe convert "..\scorebar-kidanger2@2x.png" -strip -resize 50%% -filter Box "..\scorebar-kidanger2.png"
        if /I "%isSD%" == "true" (
            del ..\scorebar-ki@2x.png
            del ..\scorebar-kidanger@2x.png
            del ..\scorebar-kidanger2@2x.png
        )
        echo true>src\engine\vars\ScorebarKiToggle
    )

    goto :__end

:_changeAnimFile
    echo Processing Animation: %animFilePrefix%
REM echo %animStaticFrame% %animLocation% %animFilePrefix% %currentAnim%

    if /I "%isAnimOn%" == "true" (
        REM If isAnimOn is true, deactivates all animation, then return isAnimOn to false
        del "%animLocation%\%animFilePrefix%-*" > nul
        copy "src\sprites\animations\%currentAnim%\%animFilePrefix%-%animStaticFrame%@2x.png" "%animLocation%\%animFilePrefix%-0@2x.png" > nul
        src\magick.exe convert "%animLocation%\%animFilePrefix%-0@2x.png" -strip -resize 50%% -filter Box "%animLocation%\%animFilePrefix%-0.png"
        if /I "%isSD%" == "true" (
            del "%animLocation%\%animFilePrefix%-0@2x.png" > nul
        )
    ) else (
        REM If isAnimOn is false, activates all animation, then return isAnimOn to true
        REM Clear all remaining .png cached files
        if /I exist "src\caches\*.png" (
            del src\caches\*.png
        ) > nul
        
        for /r %%a in ("src\sprites\animations\%currentAnim%\%animFilePrefix%*@2x.png") do (
        REM echo %%~na
            copy "%%a" "src\caches\" > nul
            for /f "tokens=1,3 delims=@." %%a in ('echo %%~nxa') do (
                src\magick.exe convert "src\caches\%%a@2x.%%b" -strip -resize 50%% -filter Box "src\caches\%%a.%%b"
                if /I "%isSD%" == "true" (
                    del "src\caches\%%a@2x.%%b"
                )
            )
        )
        REM Remove file with *static* filename
        if /I exist "src\caches\%animFilePrefix%-static@2x.*" (
            del src\caches\%animFilePrefix%-static*
        )
        
        move "src\caches\*.png" "%animLocation%" > nul
    )
    
    goto :__end

:_changeAnimStat
    if /I "%isAnimOn%" == "true" (
        :_setAnimStaticON
            REM GENERATE INTERPRETED SCRIPT THEN EXECUTE THEMSELF
                set ack=_generateAnimExecList && call src\engine\GenerateAnimationList
                call src\engine\vars\_AnimExecList.bat
        echo false>src\engine\vars\AnimationToggle
    ) else (
        :_setAnimStaticOFF
            REM GENERATE INTERPRETED SCRIPT THEN EXECUTE THEMSELF
                set ack=_generateAnimExecList && call src\engine\GenerateAnimationList
                call src\engine\vars\_AnimExecList.bat
            echo true>src\engine\vars\AnimationToggle
    )
    
    goto :__end

:_changeManiaNotesType_toArrow
cls
    title=Applying your settings... ^| Wait a moment...
    echo Applying your settings... ^| Wait a moment...
    echo It may takes a few minutes to complete...
    echo.
    echo true>src\engine\vars\isManiaTypeArrow
    set ack=_checkDisplay && call src\engine\DetectStatus "%osuConfigFile%"
    set ack=_checkManiaNotesType && call src\engine\DetectStatus "%osuConfigFile%"
    if /i "%isDisplayWide%" == "true" (
        set ack=_KeyToOrig && call src\engine\ManiaOffset
    ) else (
        set ack=_KeyTo16_9 && call src\engine\ManiaOffset
    )
    set ack=:_ReplaceValue_FullReferenceBased && src\engine\BatchINIParser ..\skin.ini src\engine\batch\ReferenceLists\SetManiaToArrow.ref DIRECT
    
    goto :__end

:_changeManiaNotesType_toDefault
cls
    title=Applying your settings... ^| Wait a moment...
    echo Applying your settings... ^| Wait a moment...
    echo It may takes a few minutes to complete...
    echo.
    echo false>src\engine\vars\isManiaTypeArrow
    set ack=_checkDisplay && call src\engine\DetectStatus "%osuConfigFile%"
    set ack=_checkManiaNotesType && call src\engine\DetectStatus "%osuConfigFile%"
    if /i "%isDisplayWide%" == "true" (
        set ack=_KeyToOrig && call src\engine\ManiaOffset
    ) else (
        set ack=_KeyTo16_9 && call src\engine\ManiaOffset
    )
    set ack=:_ReplaceValue_FullReferenceBased && src\engine\BatchINIParser ..\skin.ini src\engine\batch\ReferenceLists\SetManiaToDefault.ref DIRECT
    
    goto :__end

:_doApplyCFG
cls
    title=Applying your settings... ^| Wait a moment...
    echo Applying your settings... ^| Wait a moment...
    echo It may take a or two minutes...
    echo.
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\ApplyCFGConfigs"
    set ack=:_Execute && call src\engine\BatchExecution "src\engine\batch\SetManiaPos"

    goto :__end

:__end
    set ack=