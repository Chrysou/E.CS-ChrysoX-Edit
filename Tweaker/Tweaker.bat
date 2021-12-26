:: Allow the script to read and write Input/Output on UTF-8 char mode
:: but it still cannot display UTF-8 char because the limitation of
:: the Command Console.

@echo off
chcp 65001 && cls

echo Initializing...

REM Always return to current directory
%~d0
cd "%~dp0"

REM +----------------------------------------------------------+
REM | E.CS Tweaker v2.0_stable Closed                          |
REM +----------------------------------------------------------+
REM This script is a tweaker that allow you to modify
REM skin.ini file and replace values that stored on osu!.cfg
REM file.
REM 
REM The script was created together with this skin. Any changes
REM maybe occured.
REM 
REM Creator: justanewbie1

set osuConfigFile=..\..\..\osu!.%username%.cfg
set skinConfigFile=..\skin.ini

call src\engine\vars
call src\engine\CheckIfRipple
set ack=_checkDisplay && call src\engine\DetectStatus "%osuConfigFile%"
set ack=__end && call src\engine\SetOffsets
set msgErr= 
call src\engine\initVars

:_checkIfConfigExist
    if /I not exist "%osuConfigFile%" (
        title=Oopsie...
        echo error_code: OSU_CONFIG_FILE_NOT_FOUND
        echo.
        pause | echo Press any key to exit...
        exit
    ) else if /I not exist "%skinConfigFile%" (
        title=Oopsie...
        echo error_code: SKIN_INI_NOT_FOUND
        echo.
        pause | echo Press any key to exit...
        exit
    ) else (
        if "%SKIP_CHECK%" == "true" (
            goto :_skipCheck
        )
    )

:_checkIfosuRunning
    tasklist | find /i "osu!.exe" > nul
    if "%errorlevel%" == "0" (
        goto :_osuCurrentlyRunning
    ) else (
        goto :_skipCheck
    )

    :_osuCurrentlyRunning
    cls
        title=Oopsie...
        echo error_code: OSU_CURRENTLY_RUNNING
        echo.
        echo WARNING: osu! is currently running!
        echo Please close osu! before using this Tweaker...
        set /p command=Enter "y" to terminate osu! or "i" to ignore^> 
        if /I "%command%" == "Y" (
            taskkill /IM osu!.exe > nul
            echo.
            echo Sending termination signal to osu!, It will takes about 20 seconds. Please wait...
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
        ) else if /I "%command%" == "I" (
            cls
            echo !!WARNING!!
            echo --------------------------------------------------------------------
            echo By ignoring this message and keep continue to run this Tweaker while
            echo osu! is still running, Some changes might not work properly.
            echo.
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            echo|set /p =.
            timeout /t 1 /nobreak>nul
            goto :_main
        )
        set LAST_RUN_OSU=true
        goto :_checkIfosuRunning

    :_skipCheck

:_main
cls
    title=Welcome to E.CS Skin Tweaker! ^| E.CS r%majorver%.%revision% %Ripple%
    echo Welcome to E.CS Skin Tweaker! ^| E.CS r%majorver%.%revision% %Ripple%
    echo ---------------------------------------------------------
    echo What do you want to do?
    echo    1. Change Skin Aspect Ratio
    echo    2. Change Skin Behaviour
    echo    3. Change Tweaker Settings
    REM echo    4. Check for updates
    echo.
    echo    q. Exit
    echo.
    echo.%msgErr%
    set /p command=Confirm: 
    if "%command%" == "1" (
        set msgErr=
        set command=
        goto :_changeRes_command_1
    ) else if "%command%" == "2" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour
    ) else if "%command%" == "3" (
        set msgErr=
        set command=
        cls
        echo Check Notepad app to change the Tweaker settings
        notepad src\engine\initVars.cmd
        echo|set /p =Applying changes... 
        call src\engine\initVars.cmd
        echo|set /p = Applied!
        goto :_main
    ) else if "%command%" == "4" (
        set msgErr=ERROR: INPUT INVALID!
        set command=
        goto :_main
    ) else if /I "%command%" == "q" (
        goto :__end
    ) else (
        set msgErr=ERROR: INPUT INVALID!
        set command=
        goto :_main
    )

:_ChangeSkinINIBehaviour
set ack=_checkAnimationStatus && call src\engine\DetectStatus
set ack=_checkOsuHitlightStatus && call src\engine\DetectStatus
set ack=_checkScorebarKiStatus && call src\engine\DetectStatus
cls
    title=Change skin's behav.
    echo Change skin's behav.
    echo ---------------------------------------------------------
    echo What do you want to change?
    echo    1. Mania playfield position
    echo    2. Mania notes type
    echo    3. Change hitcircle slider border color
    echo    4. Change cursor color
    echo    5. Change hitcircle type
    echo    6. Animation toggle ^[%AnimStat%^]
    echo    7. osu! hitlighting toggle ^[%OsuHitlightStat%^]
    echo    8. Scorebar-ki toggle ^[%ScorebarKiStat%^]
    echo    9. Change hitcircle color scheme
    echo.
    echo    0. Back
    echo    q. Exit
    echo.
    echo.%msgErr%
    set /p command=Confirm: 
    if "%command%" == "1" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_Mania
    ) else if "%command%" == "2" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_ManiaNotesType
    ) else if "%command%" == "3" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_SliderColor
    ) else if "%command%" == "4" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_CursorColor
    ) else if "%command%" == "5" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_HitCircle
    ) else if "%command%" == "6" (
        set msgErr=
        set command=
        echo.
        echo Applying all your setting, it takes about a or two minutes to process.
        echo Please wait...
        set ack=_changeAnimStat && call src\engine\DoApply
        goto :_ChangeSkinINIBehaviour
    ) else if "%command%" == "7" (
        set msgErr=
        set command=
        set ack=_changeOsuHitlightingStat && call src\engine\DoApply
        goto :_ChangeSkinINIBehaviour
    ) else if "%command%" == "8" (
        set msgErr=
        set command=
        set ack=_changeScorebarKiStat && call src\engine\DoApply
        goto :_ChangeSkinINIBehaviour
    ) else if "%command%" == "9" (
        set msgErr=
        set command=
        goto :_ChangeSkinINIBehaviour_HitCircleColorScheme
    ) else if "%command%" == "0" (
        set msgErr=
        set command=
        goto :_main
    ) else if /I "%command%" == "q" (
        goto :__end
    ) else (
        set msgErr=ERROR: INPUT INVALID!
        set command=
        goto :_ChangeSkinINIBehaviour
    )
    
    :_ChangeSkinINIBehaviour_HitCircle
    cls
        title=Change skin's behav. ^> Hitcircle Model
        echo Change skin's behav. ^> Hitcircle Model
        echo ---------------------------------------------------------
        echo Select your hitcircle model:
        echo    1. Waving hitcircle
        echo    2. New-style dashed hitcircle
        echo    3. New-style simplified hitcircle [Default]
        echo       [Recommended for mainstream gameplay style!]
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            set hitcircleModel=1
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set hitcircleModel=2
        ) else if "%command%" == "3" (
            set msgErr=
            set command=
            set hitcircleModel=3
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_HitCircle
        )
        
        :_ChangeSkinINIBehaviour_HitCircle_apply
            set ack=:_doApplyHitcircle && call src\engine\DoApply
            set ack=:_doSpritesOptimizing && call src\engine\OptimizeSprites
            
            goto :_ChangeSkinINIBehaviour_HitCircle
	
	:_ChangeSkinINIBehaviour_HitCircleColorScheme
	set ack=_checkHitCircleColorScheme && call src\engine\DetectStatus
    cls
        title=Change skin's behav. ^> hitcircle color scheme
        echo Change skin's behav. ^> hitcircle color scheme
        echo ---------------------------------------------------------
        echo Select your hitcircle color scheme:
		echo 	1. Blue %isBlueHitCircleActive%
		echo 	2. Green %isGreenHitCircleActive%
		echo 	3. Red %isRedHitCircleActive%
		echo 	4. Orange %isOrangeHitCircleActive%
		echo 	5. Default %isDefaultHitCircleActive%
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
		set ack=_ReverseArrowHCHue && call src\engine\SetOffsets
		if "%command%" == "1" (
            set msgErr=
            set command=
            set hitcircleColor=1
			set ReverseArrowHue=%hueReverseArrow_toBlue%
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set hitcircleColor=2
			set ReverseArrowHue=%hueReverseArrow_toGreen%
        ) else if "%command%" == "3" (
            set msgErr=
            set command=
            set hitcircleColor=3
			set ReverseArrowHue=%hueReverseArrow_toRed%
        ) else if "%command%" == "4" (
            set msgErr=
            set command=
            set hitcircleColor=4
			set ReverseArrowHue=%hueReverseArrow_toOrange%
        ) else if "%command%" == "5" (
            set msgErr=
            set command=
            set hitcircleColor=5
			set ReverseArrowHue=%hueReverseArrow_toBlue%
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_HitCircleColorScheme
        )
        
        :_ChangeSkinINIBehaviour_HitCircleColorScheme_apply
            set ack=:_doApplyHitcircleColorScheme && call src\engine\DoApply
            set ack=:_doSpritesOptimizing && call src\engine\OptimizeSprites
            
            goto :_ChangeSkinINIBehaviour_HitCircleColorScheme
		
    
    :_ChangeSkinINIBehaviour_CursorColor
    set ack=:_cursorHue && call src\engine\SetOffsets
	set ack=:_checkCursorCurrentColor && call src\engine\DetectStatus
    cls
        title=Change skin's behav. ^> Change cursor color
        echo Change skin's behav. ^> Change cursor color
        echo ---------------------------------------------------------
        echo Select the color for cursor:
        echo    1. Orange %isCursorColorOrange%
        echo    2. Green %isCursorColorGreen%
        echo    3. Blue %isCursorColorBlue%
        echo    4. Purple %isCursorColorPurple%
        echo    5. Red %isCursorColorRed%
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            set hueCursor=%hueCursor_toOrange%
			echo Orange>src\engine\vars\CursorColor
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set hueCursor=%hueCursor_toGreen%
			echo Green>src\engine\vars\CursorColor
        ) else if "%command%" == "3" (
            set msgErr=
            set command=
            set hueCursor=%hueCursor_toBlue%
			echo Blue>src\engine\vars\CursorColor
        ) else if "%command%" == "4" (
            set msgErr=
            set command=
            set hueCursor=%hueCursor_toPurple%
			echo Purple>src\engine\vars\CursorColor
        ) else if "%command%" == "5" (
            set msgErr=
            set command=
            set hueCursor=%hueCursor_toRed%
			echo Red>src\engine\vars\CursorColor
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_CursorColor
        )
    
        :_ChangeSkinINIBehaviour_CursorColor_apply
            set ack=:_doRenderSprite_cursor && call src\engine\DoApply
            set ack=:_doSpritesOptimizing && call src\engine\OptimizeSprites
            
            goto :_ChangeSkinINIBehaviour_CursorColor

    :_ChangeSkinINIBehaviour_SliderColor
    set ack=:_SetBorderColorVal && call src\engine\SetOffsets
    set ack=:_checkColor_Status && call src\engine\DetectStatus %skinConfigFile%
    cls
        title=Change skin's behav. ^> Slider border color
        echo Change skin's behav. ^> Slider border color
        echo ---------------------------------------------------------
        echo NOTE: This setting will override "Hitcircle color scheme"
        echo       configuration
        echo.
        echo Select the color for slider border color:
        echo    1. White %isBorderWhite%
        echo    2. Green %isBorderGreen%
        echo    3. Blue %isBorderBlue%
        echo    4. Red %isBorderRed%
        echo    5. Orange %isBorderOrange%
        echo    c. Custom %isBorderCustom%
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            set rColor=%rBorderWhite%
            set gColor=%gBorderWhite%
            set bColor=%bBorderWhite%
            goto :_ChangeSkinINIBehaviour_SliderColor_Change
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set rColor=%rBorderGreen%
            set gColor=%gBorderGreen%
            set bColor=%bBorderGreen%
            goto :_ChangeSkinINIBehaviour_SliderColor_Change
        ) else if "%command%" == "3" (
            set msgErr=
            set command=
            set rColor=%rBorderBlue%
            set gColor=%gBorderBlue%
            set bColor=%bBorderBlue%
            goto :_ChangeSkinINIBehaviour_SliderColor_Change
        ) else if "%command%" == "4" (
            set msgErr=
            set command=
            set rColor=%rBorderRed%
            set gColor=%gBorderRed%
            set bColor=%bBorderRed%
            goto :_ChangeSkinINIBehaviour_SliderColor_Change
        ) else if "%command%" == "5" (
            set msgErr=
            set command=
            set rColor=%rBorderOrange%
            set gColor=%gBorderOrange%
            set bColor=%bBorderOrange%
            goto :_ChangeSkinINIBehaviour_SliderColor_Change
        ) else if /I "%command%" == "c" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour_SliderColorCust
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_SliderColor
        )
        
        :_ChangeSkinINIBehaviour_SliderColor_Change
            echo.
            echo Searching for string, please wait...
            set string=SliderBorder
            set value=%rColor%,%gColor%,%bColor%
            set ack=:_ReplaceValueByString_2 && call "src\engine\BatchINIParser" "%skinConfigFile%" direct 1
            goto :_ChangeSkinINIBehaviour_SliderColor
        
        :_ChangeSkinINIBehaviour_SliderColorCust
        cls
            title=Change skin's behav. ^> Slider border color ^> Custom
            echo Change skin's behav. ^> Slider border color ^> Custom
            echo ---------------------------------------------------------
            echo Enter the RGB color value!
            echo    example:
            echo        128,87,0
            echo Type q to exit
            echo.
            set string=SliderBorder
            set /p value=Value: 
            if /I "%value%" == "q" (
                goto :_ChangeSkinINIBehaviour_SliderColor
            )
            echo.
            echo Looking for the string, please wait...
            set ack=:_ReplaceValueByString_2 && call "src\engine\BatchINIParser" "%skinConfigFile%" direct 1
            goto :_ChangeSkinINIBehaviour_SliderColor

    :_ChangeSkinINIBehaviour_Mania
    cls
        title=Change skin's behav. ^> Mania Playfield
        echo Change skin's behav. ^> Mania Playfield
        echo ---------------------------------------------------------
        echo Which position do you want?
        echo    1. Left
        echo    2. Center
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour_Mania_PosLeft
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour_Mania_PosCenter
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_Mania
        )
    
    :_ChangeSkinINIBehaviour_ManiaNotesType
    set ack=:_checkManiaNotesType && call src\engine\DetectStatus
    cls
        title=Change skin's behav. ^> Mania notes type
        echo Change skin's behav. ^> Mania notes type
        echo ---------------------------------------------------------
        echo Which one you want to choose?
        echo    1. Default %maniaTypeDefault%
        echo    2. Arrow %maniaTypeArrow%
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            set ack=:_changeManiaNotesType_toDefault && call src\engine\DoApply
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set ack=:_changeManiaNotesType_toArrow && call src\engine\DoApply
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_ManiaNotesType
        )
        goto :_ChangeSkinINIBehaviour_ManiaNotesType
    
    :_ChangeSkinINIBehaviour_Mania_PosLeft
    cls
        set ack=_KeyToLeft && call src\engine\ManiaOffset
        set ack=_doApplyCustomManiaPos && call src\engine\DoApply
        goto :_ChangeSkinINIBehaviour_Mania

    :_ChangeSkinINIBehaviour_Mania_PosCenter
    set ack=_checkDisplay && call src\engine\DetectStatus "%osuConfigFile%"
    cls
        title=Change skin's behav. ^> Mania Playfield ^> Selection Center
        echo Change skin's behav. ^> Mania Playfield ^> Selection Center
        echo ---------------------------------------------------------
        echo Which one is your current display aspect ratio?
        echo    1. Native 16:9 %isDetected16_9%
        echo    2. Letterboxed Ultrawide 24:10 %isDetected24_10%
        echo.
        echo    0. Back
        echo    q. Exit
        echo.
        echo.%msgErr%
        set /p command=Confirm: 
        if "%command%" == "1" (
            set msgErr=
            set command=
            set ack=_SetOffset16_9 && call src\engine\SetOffsets
            set ack=_KeyTo16_9 && call src\engine\ManiaOffset
            set ack=_doApplyCustomManiaPos && call src\engine\DoApply
            goto :_ChangeSkinINIBehaviour_Mania_PosCenter
        ) else if "%command%" == "2" (
            set msgErr=
            set command=
            set ack=_SetOffsetOrigin && call src\engine\SetOffsets
            set ack=_KeyToOrig && call src\engine\ManiaOffset
            set ack=_doApplyCustomManiaPos && call src\engine\DoApply
            goto :_ChangeSkinINIBehaviour_Mania_PosCenter
        ) else if "%command%" == "0" (
            set msgErr=
            set command=
            goto :_ChangeSkinINIBehaviour_Mania
        ) else if /I "%command%" == "q" (
            goto :__end
        ) else (
            set msgErr=ERROR: INPUT INVALID!
            set command=
            goto :_ChangeSkinINIBehaviour_Mania_PosCenter
        )


:_osuCFG_editor
    echo Type "!list" for lists all strings and its values
    echo or "!find" for listing current corresponding strings
    echo or "!q" for return to main menu
    echo.
    :_osuCFG_ret
        set /p d=^> 
        if /I "%d%" == "!list" (
            set ack=:_Listing && call src\engine\BatchCFGParser "%osuConfigFile%"
        ) else if /I "%d%" == "!find" (
            set d=
            goto :_osuCFG_find
        ) else if /I "%d%" == "!q" (
            set d=
            goto :_main
        ) else if /I not "%d%" == "" (
            set d=
            goto :_
        )
        set d=
        goto :_osuCFG_ret

    :_osuCFG_find
        set /p e=Find^> 
        if /I "%e%" == "!q" (
            set e=
            goto :_osuCFG_ret
        ) else if /I not "%e%" == "" (
            set ack=:_Listing && call src\engine\BatchCFGParser "%osuConfigFile%" %e%
        )
        set e=
        goto :_osuCFG_find

    :_osuCFG_replace
        set /p e=Find^> 
        if /I "%e%" == "!q" (
            set e=
            goto :_osuCFG_ret
        ) else if /I not "%e%" == "" (
            set ack=:_Listing && call src\engine\BatchCFGParser "%osuConfigFile%" %e%
        )
        set e=
        goto :_osuCFG_find

:_changeRes_command_1
set ack=_checkDisplay && call src\engine\DetectStatus "%osuConfigFile%"
cls
    title=Change Res.
    echo Change Res.
    echo ---------------------------------------------------------
    echo Select your display's resolution:
    echo    1. 3840x2160 %isDisplay_3840x2160%
    echo    2. 2560x1440 %isDisplay_2560x1440%
    echo    3. 1920x1080 %isDisplay_1920x1080%
    echo    4. 1600x900 %isDisplay_1600x900%
    echo    5. 1366x768 %isDisplay_1366x768%
    echo    6. 1280x720 %isDisplay_1280x720%
    echo.
    echo    0. Back
    echo    q. Exit
    echo.
    echo.%msgErr%
    set /p command=Confirm: 
    if "%command%" == "1" (
        set screenX=3840
        set screenY=2160
        set screenY_c=1600
        set msgErr=
    ) else if "%command%" == "2" (
        set screenX=2560
        set screenY=1440
        set screenY_c=1066
        set msgErr=
    ) else if "%command%" == "3" (
        set screenX=1920
        set screenY=1080
        set screenY_c=800
        set msgErr=
    ) else if "%command%" == "4" (
        set screenX=1600
        set screenY=900
        set screenY_c=666
        set msgErr=
    ) else if "%command%" == "5" (
        set screenX=1366
        set screenY=768
        set screenY_c=569
        set msgErr=
    ) else if "%command%" == "6" (
        set screenX=1280
        set screenY=720
        set screenY_c=533
        set msgErr=
    ) else if "%command%" == "0" (
        set msgErr=
        set command=
        goto :_main
    ) else if /I "%command%" == "q" (
        set command=
        goto :__end
    ) else (
        set msgErr=ERROR: INPUT INVALID!
        set command=
        goto :_changeRes_command_1
    )
    set command=

:_changeRes_command_2
set ack=_checkManiaNotesType && call src\engine\DetectStatus "%osuConfigFile%"
cls
    title=Change Res. ^> Select Aspect Ratio
    echo Change Res. ^> Select Aspect Ratio
    echo ---------------------------------------------------------
    echo Select your display's aspect ratio
    echo    1. Native 16:9 %isDetected16_9%
    echo    2. Letterboxed Ultrawide 24:10 [Recommended] %isDetected24_10%
    echo.
    echo.   0. Back
    echo    q. Exit
    echo.
    echo.%msgErr%
    set /p command=Confirm: 
    if "%command%" == "1" (
        set ack=_SetOffset16_9 && call src\engine\SetOffsets
        set    msgErr=
    ) else if "%command%" == "2" (
        set ack=_SetOffsetOrigin && call src\engine\SetOffsets
        set    msgErr=
    ) else if "%command%" == "0" (
        set msgErr=
        goto :_changeRes_command_1
    ) else if /I "%command%" == "q" (
        goto :__end
    ) else (
        set msgErr=ERROR: INPUT INVALID!
        goto :_changeRes_command_1
    )
    set command=
    goto :_renderSprite

:_renderSprite
    if /i "%RENDER_SPRITE%" == "true" (
        set ack=:_doRenderSprite && call src\engine\DoApply
    )
    set ack=:_doSpritesOptimizing && call src\engine\OptimizeSprites

:_applySetting
	if /i not "%SKIP_CONFIG_CHANGE%" == "true" (
		set ack=:_doApplyCFG && call src\engine\DoApply
	)

    if "%errorlevel%" GEQ 1 (
        title=Oopsie... ._.^)
        if "%isRipple%" == "true" (
            set ack=:_ASCIIart_OAO && call src\engine\WorstASCIIArt
            echo Tweaker-chan is OAO-ing...
        ) else (
            set ack=:_ASCIIart_OwO && call src\engine\WorstASCIIArt
            echo Tweaker-chan is OwO-ing...
        )
        echo error_code: %errorlevel%
        echo.
        pause | echo Press any key to exit...
        exit
    ) else (
		title=Patching successful!
		echo Patching successful!
        timeout /t 3 /nobreak>nul
        goto :_main
    )

:__end
	echo Bye!