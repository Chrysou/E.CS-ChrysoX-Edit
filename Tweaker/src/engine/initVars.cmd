REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:: PNG Optimizer and Minimizer.
::      true    -> Use PNG Optimizer and Minimizer while rendering the sprites (More smaller output size)
::      false   -> Disable PNG Optimizer and Minimizer feature (More larger output size but faster)
set PNG_MINIMIZE=true

:: Show a warning if osu! is still running while executing the Tweaker.
::      true    -> Disable the warning.
::      false   -> Enable the warning.
set SKIP_CHECK=false

:: Do sprites rendering process while changing the screen resolution mode.
::      true    -> Enable rendering process on sprites.
::      false   -> Disable/Skip rendering process on sprites.
set RENDER_SPRITE=true

:: Do configuration changes in skin.ini and osu!<pc_username>.cfg files while changing the screen resolution mode.
::      true    -> Disable/skip configuration changes.
::      false   -> Enable configuration changes.
set SKIP_CONFIG_CHANGE=false

:: Do render for Standard Definition sprites only.
::      true    -> Do render for SD sprites only.
::      false   -> Do render for HD and SD sprites.
set isSD=true

:: Adjust objects offset for sprite rendering on 16:9 aspect ratio
set Screen_16_9_Offset=957
