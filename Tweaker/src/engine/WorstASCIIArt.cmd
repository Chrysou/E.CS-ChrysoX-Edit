REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_ack
    if "%ack%" == "" (
        goto :_unknown
    ) else (
        goto %ack%
    )

:_unknown
    msg * ERROR: unknown call
    goto :__end

:_ASCIIart_ECS
    echo.
    echo                #############           ###########   #############
    echo               ###                     ###           ###
    echo               ###                     ###           ###
    echo               ###                     ###           ###
    echo               ###########             ###            ############
    echo               ###                     ###                      ###
    echo               ###                     ###                      ###
    echo               ###                     ###                      ###
    echo                #############    ##     ###########  #############
    echo.
    echo                             %currentVer%
    goto :__end

:_ASCIIart_O_O
    echo.
    echo          oooooooo                      oooooooo
    echo        oo        oo                  oo        oo
    echo        oo        oo                  oo        oo
    echo        oo        oo                  oo        oo
    echo        oo        oo                  oo        oo
    echo        oo        oo                  oo        oo
    echo          oooooooo                      oooooooo
    echo                    ___________________
    echo.
    goto :__end

:_ASCIIart_OAO
    echo.
    echo          oooooooo                      oooooooo
    echo        oo        oo       AAAA       oo        oo
    echo        oo        oo      AA  AA      oo        oo
    echo        oo        oo     AA    AA     oo        oo
    echo        oo        oo    AAAAAAAAAA    oo        oo
    echo        oo        oo   AA        AA   oo        oo
    echo          oooooooo    AA          AA    oooooooo
    echo.
    goto :__end

:_ASCIIart_OwO
    echo.
    echo          oooooooo                       oooooooo
    echo        oo        oo                   oo        oo
    echo        oo        oo                   oo        oo
    echo        oo        oo   ww   www   ww   oo        oo
    echo        oo        oo    ww ww ww ww    oo        oo
    echo        oo        oo     www   www     oo        oo
    echo          oooooooo                       oooooooo
    echo.
    goto :__end

:__end
    set ack=