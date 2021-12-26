REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
    set Screen_16_9_Offset=%Screen_16_9_Offset%
    set Mania_16_9_Offset=150

:_ack
    if "%ack%" == "" (
        goto :_unknown
    ) else (
        goto %ack%
    )

:_unknown
    msg * ERROR: unknown call
    goto :__end

:_SetBorderColorVal
    set rBorderWhite=255
    set gBorderWhite=255
    set bBorderWhite=255

    set rBorderGreen=0
    set gBorderGreen=255
    set bBorderGreen=162

    set rBorderBlue=0
    set gBorderBlue=192
    set bBorderBlue=255

    set rBorderRed=255
    set gBorderRed=0
    set bBorderRed=76

    set rBorderOrange=255
    set gBorderOrange=210
    set bBorderOrange=0

    goto :__end

:_SetOffsetOrigin
    set /a sprite_offset1[0]=^( 2857 - 106 ^)
    set /a sprite_offset1[1]=^( 158 + 1425 ^) - 106
    set    sprite_offset2[0]=3804
    set    sprite_offset2[1]=1430
    set /a sprite_offset3[0]=2135
    set    sprite_offset3[1]=204
    set    sprite_offset4[0]=4370
    set    sprite_offset4[1]=798
    set /a sprite_offset5[0]=^( 1087 - 55 ^)
    set    sprite_offset5[1]=58
    set /a sprite_offset6[0]=1305
    set    sprite_offset6[1]=22
    set /a sprite_offset7[0]=1982
    set    sprite_offset7[1]=507
REM set    sprite_offset8[0]=1512
REM set /a sprite_offset8[1]=262 + 1425

    set posRanking_Panel1_x=1298
    set posRanking_Panel1_y=2478
    set posRanking_Panel2_x=854
    set posRanking_Panel2_y=1770
    set posRanking_Panel3_x=2031
    set posRanking_Panel3_y=1406
    set posRanking_Panel4_x=185
    set posRanking_Panel4_y=2274
    set posRanking_Panel5_x=3108
    set posRanking_Panel5_y=1291
    set posRanking_Panel6_x=1467
    set posRanking_Panel6_y=1056
    set posRanking_Panel7_x=2779
    set posRanking_Panel7_y=22

    set    cropSprite[0]=4096x1536+2+0
    set    cropSprite[1]=3700x2680+0+0
    set    cropSprite[2]=1672x3270+2444+0
    set    cropSprite[3]=3688x432+1+0
    set    cropSprite[4]=3700x1937+0+0
    set    cropSprite[5]=3689x1537+0+0
    set    cropSprite[6]=3686x1536+0+0
REM set    cropSprite[6]=10000x256+0+0
REM set    cropSprite[7]=10000x1400+0+0

    set    letterbox[0]=1
    set    letterbox[1]=0
    set    letterbox[2]=0
    set    isCinema=false
    set    screenX=%screenX%
    set    screenY=%screenY_c%
    set ack=:_KeyToOrig && call src\engine\ManiaOffset
    echo true>src\engine\vars\isDisplayWide

    goto :__end

:_SetOffset16_9
    set /a sprite_offset1[0]=^( 2857 - %Screen_16_9_Offset% ^) - 106
    set /a sprite_offset1[1]=^( 158 + 1425 ^) - 106
    set    sprite_offset2[0]=3804
    set    sprite_offset2[1]=1430
    set /a sprite_offset3[0]=2135 - %Screen_16_9_Offset%
    set    sprite_offset3[1]=204
    set    sprite_offset4[0]=4370
    set    sprite_offset4[1]=798
    set /a sprite_offset5[0]=^( 1087 - 55 ^) - ^( %Screen_16_9_Offset% / 2 ^)
    set    sprite_offset5[1]=58
    set /a sprite_offset6[0]=1305 + ^( %Screen_16_9_Offset% / 2 ^)
    set    sprite_offset6[1]=22
    set /a sprite_offset7[0]=^( 1982 + 3 ^) - %Screen_16_9_Offset%
    set    sprite_offset7[1]=507
REM set    sprite_offset8[0]=1512
REM set /a sprite_offset8[1]=262 + 1425

    set /a posRanking_Panel1_x=1298 - ^( %Screen_16_9_Offset% / 2 ^)
    set posRanking_Panel1_y=2478
    set /a posRanking_Panel2_x=^( 854 + 1 ^) - ^( %Screen_16_9_Offset% / 2 ^)
    set posRanking_Panel2_y=1770
    set /a posRanking_Panel3_x=^( 2031 + 3 ^) - %Screen_16_9_Offset%
    set posRanking_Panel3_y=1406
    set /a posRanking_Panel4_x=^( 185 + ^( %Screen_16_9_Offset% / 2 ^) ^) - 355
    set posRanking_Panel4_y=2104
    set /a posRanking_Panel5_x=3108 - %Screen_16_9_Offset%
    set posRanking_Panel5_y=1291
    set /a posRanking_Panel6_x=^( 1467 - ^( %Screen_16_9_Offset% / 2 ^) ^) + 129
    set posRanking_Panel6_y=1056
    set /a posRanking_Panel7_x=2779 - %Screen_16_9_Offset%
    set posRanking_Panel7_y=22

    set    cropSprite[0]=2732x1536+684+0
    set    cropSprite[1]=2732x2680+0+0
    set    cropSprite[2]=1672x3270+2444+0
    set    cropSprite[3]=2732x432+%Screen_16_9_Offset%+0
    set    cropSprite[4]=2310x1937+0+0
    set    cropSprite[5]=2732x1537+478+0
    set    cropSprite[6]=2732x1536+0+0
REM set    cropSprite[6]=5680x256+2160+0
REM set    cropSprite[7]=5680x1400+2160+0

    set    letterbox[0]=0
    set    letterbox[1]=0
    set    letterbox[2]=0
    set    isCinema=false
    set    screenX=%screenX%
    set    screenY=%screenY%
    set ack=:_KeyTo16_9 && call src\engine\ManiaOffset
    echo false>src\engine\vars\isDisplayWide

    goto :__end

:_cursorHue
    set hueCursor_toOrange=100,100,42.33
    set hueCursor_toGreen=100,100,100
    set hueCursor_toBlue=100,81,116
    set hueCursor_toPurple=100,100,186
    set hueCursor_toRed=100,100,200
    
    goto :__end

:_ReverseArrowHCHue
	set hueReverseArrow_toBlue=100,100,100
	set hueReverseArrow_toGreen=100,100,74
	set hueReverseArrow_toOrange=100,180,15
	set hueReverseArrow_toRed=100,160,185
	
	goto :__end

:__end
    set ack=