REM E.CS Skin Tweaker by justanewbie1
REM ===========================================================================
REM Any modifications and contributions are allowed!

:_init
	set wildcards=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789^(^)^{^}^|^-^^:_.,^""''` 

:_ack
	if "%ack%" == "" (
		goto :_unknown
	) else (
		goto %ack%
	)

:_unknown
	msg * ERROR: unknown call
	goto :__end

:_FindByString
	set input=%1
	set string=%2
	set outputvar=%3

	for /f "tokens=1,* delims=: " %%a in ('type %input%') do (
		if /I "%%a" == "%string%" (
		REM echo String found!
		REM echo	%%a= %%b
			echo %%b>"%temp%\lolalilu"
		)
	)
	set /p %outputvar%=<"%temp%\lolalilu"
	del "%temp%\lolalilu"
	set input=
	set string=
	set outputvar=

	goto :__end

:_ReplaceValueBySegmentAndSubSegmentValue
	set input=%1
	set string=%2
	set value=%3
	set segment=%4
	set subsegment=%5
	set subsegment_value=%6
	set output=%7
	set debug=%8

	if /I %output% == direct (
		set isDirect=true
		set output=%input%.tmp
	)

	setlocal enabledelayedexpansion
	set changed=0
	set cur_val=.
	set inSegment=0

	:WriteOut

	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set content=%%a
			for /f "tokens=1,* delims=%wildcards%" %%a in ('echo %%a') do (
				if "%%a" == "[" (
					if /I not "!content!" == "!cur_val!" (
						if "%debug%" == "1" echo Changed: !content!
					)
					set cur_val=!content!
				) else (
					for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
						if "%%a" == "%subsegment%" (
							if "%%b" == "%subsegment_value%" (
								set inSegment=1
								if "%debug%" == "1" echo Currently in Sub-segment Value Found:
								if "%debug%" == "1" echo	!content!
							)
						)
					)
				)
				if "%%a" == "[" (
					set inSegment=0
				)
				if "!inSegment!" == "1" (
					for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
						if not "%%a" == "//" (
							if /I "%%a" == "%string%" (
								echo %string%: %value%
							) else (
								echo %%a: %%b
							)
						)
					)
				) else (
					echo !content!
				)
			)
		)
	) > %output%
	
	set content=
	
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)

	set input=
	set string=
	set value=
	set segment=
	set subsegment=
	set subsegment_value=
	set output=
	set debug=
	set isDirect=
	goto :__end


:_ReplaceValueBySegmentAndSubSegmentValue_inputValue
	set input=%1
	set string=%2
	set value=%value%
	set segment=%3
	set subsegment=%4
	set subsegment_value=%5
	set output=%6
	set debug=%7

	if /I %output% == direct (
		set isDirect=true
		set output=%input%.tmp
	)

	setlocal enabledelayedexpansion
	set changed=0
	set cur_val=.
	set inSegment=0

	:WriteOut

	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set content=%%a
			for /f "tokens=1,* delims=%wildcards%" %%a in ('echo %%a') do (
				if "%%a" == "[" (
					if /I not "!content!" == "!cur_val!" (
						if "%debug%" == "1" echo Changed: !content!
					)
					set cur_val=!content!
				) else (
					for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
						if "%%a" == "%subsegment%" (
							if "%%b" == "%subsegment_value%" (
								set inSegment=1
								if "%debug%" == "1" echo Currently in Sub-segment Value Found:
								if "%debug%" == "1" echo	!content!
							)
						)
					)
				)
				if "%%a" == "[" (
					set inSegment=0
				)
				if "!inSegment!" == "1" (
					for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
						if not "%%a" == "//" (
							if /I "%%a" == "%string%" (
								echo %string%: %value%
							) else (
								echo %%a: %%b
							)
						)
					)
				) else (
					echo !content!
				)
			)
		)
	) > %output%
	
	set content=
	
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)

	set input=
	set string=
	set value=
	set segment=
	set subsegment=
	set subsegment_value=
	set output=
	set debug=
	set isDirect=
	goto :__end

:_ReplaceValueByString_2
	set input=%1
	set output=%2
	set debug=%3

	if /i %output% == direct (
		set isDirect=true
		set output=%input%.tmp
	)

	setlocal enabledelayedexpansion
	set changed=0
	set cur_val=.
	set inSegment=0

	:WriteOut

	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set content=%%a
			for /f "tokens=1,* delims=: " %%a in ('echo %%a') do (
				if /I "%%a" == "%string%" (
					echo %string%: %value%
				) else (
					echo !content!
				)
			)
		)
	) > %output%
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)

	set input=
	set output=
	set debug=
	set isDirect=
	goto :__end

:_EvaluateTemplate
	set input=%1
	set ack=%2
	set varsExec=%3
	set output=%4

	if /i %output% == direct (
		set isDirect=true
		set output=%input%.tmp
	)
	
	setlocal enabledelayedexpansion
	call %varsExec%
	
	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set content=%%a
			for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
				if /i "%%a" == "_templateVer" (
					set _templateVer=%%b
				) else (
					echo !content!
				)
			)
		)
	) > %output%
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)
	
	set input=
	set output=
	set ack=
	set varsExec=
	set isDirect=
	goto :__end

:_ReplaceValue_ReferenceBased
	set input=%1
	set reference=%2
	set solSegment=%3
	set solKey=%4
	set solKeyVal=%5
	set output=%6
	set isDirect=

	if /i "%output%" == "direct" (
		set isDirect=true
		set output=%input%.tmp
	)
	
	setlocal enabledelayedexpansion
	set inSegment=false
	set inKey=false
	set dataFound=false
	set elimSegment=
	set curAVal=
	set curBVal=
	set refSegment=
	set refKey=
	set refKeyVal=
	set refData=
	set refDataVal=
	set currentData=

	:WriteOut
	
	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set content=%%a
			for /f "tokens=1,* delims=%wildcards%" %%a in ('echo !content!') do (
				set elimSegment=%%a
			)
			for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
				set curAVal=%%a
				set curBVal=%%b
			)
			if "!elimSegment!" == "[" (
				if "!curAVal!" == "!solSegment!" (
					set inSegment=true
				)
			) else if "!curAVal!" == "!solKey!" (
				if "!curBVal!" == "!solKeyVal!" (
					set inKey=true
				) else (
					set inSegment=false
					set inKey=false
				)
			)
			
			set dataFound=false
			if "!inSegment!" == "true" (
				if "!inKey!" == "true" (
					for /f "tokens=1,2,3,4,5 delims=;" %%a in ('type %reference%') do (
						set refSegment=%%a
						set refKey=%%b
						set refKeyVal=%%c
						set refData=%%d
						set refDataVal=%%e
						
						if "!refSegment!" == "!solSegment!" (
							if "!refKey!" == "!solKey!" (
								if "!refKeyVal!" == "!solKeyVal!" (
									if "!refData!" == "!curAVal!" (
										set dataFound=true
										set currentData=!curAVal!: !refDataVal!
									)
								)
							)
						)
					)
				)
			)

			if /i "!dataFound!" == "true" (
				echo !currentData!
			) else (
				echo !content!
			)
		)
	) > %output%

	set inSegment=
	set inKey=
	set dataFound=
	set elimSegment=
	set curAVal=
	set curBVal=
	set refSegment=
	set refKey=
	set refKeyVal=
	set refData=
	set refDataVal=
	set currentData=
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)

	set input=
	set reference=
	set solSegment=
	set solKey=
	set solKeyVal=
	set output=
	set isDirect=
	goto :__end

:_ReplaceValue_FullReferenceBased
	set input=%1
	set reference=%2
	set output=%3
	set isDirect=

	if /i "%output%" == "direct" (
		set isDirect=true
		set output=%input%.tmp
	)
	
	setlocal enabledelayedexpansion
	set inSegment=false
	set inKey=false
	set dataFound=false
	set elimSegment=
	set curAVal=
	set curBVal=
	set refSegment=
	set refKey=
	set refKeyVal=
	set refData=
	set refDataVal=
	set currentData=
	set blockValueUpdate=
	set lastSegment=
	set lastKey=
	set lastKeyVal=
    set isBeginning=true

	(
		for /f "tokens=*" %%a in ('type %input%') do (
			set dataFound=false
			set content=%%a
			for /f "tokens=1,* delims=: " %%a in ('echo !content!') do (
				set curAVal=%%a
				set curBVal=%%b
			)

			for /f "tokens=1,* delims=%wildcards%" %%a in ('echo !content!') do (
				set elimSegment=%%a
				if "%%a" == "// " (
					for /f "tokens=1,* delims= " %%a in ('echo !content!') do (
						for /f "tokens=1,* delims=: " %%a in ('echo %%b') do (
							if /i "%%a" == "Reference" (
								set curAVal=%%a
								set curBVal=%%b
							)
						)
					)
				)
			)

			if "!elimSegment!" == "[" (
				set currentSegment=!content!
			) else (
				for /f "tokens=1,2,3,4,5 delims=;" %%a in ('type %reference%') do (
					if /i "%%a" == "!currentSegment!" (
						if /i "%%b" == "!curAVal!" (
							if /i "%%c" == "!curBVal!" (
								set inSegment=true
								set inKey=true
								set blockValueUpdate=false
								set lastSegment=!currentSegment!
								set lastKey=!curAVal!
								set lastKeyVal=!curBVal!
								set solSegment=%%a
								set solKey=%%b
								set solKeyVal=%%c
							)
						)
					)
				)
			)

			if /i "!curAVal!" == "!lastKey!" (
				if /i not "!curBVal!" == "!lastKeyVal!" (
					set blockValueUpdate=true
				)
			)

			for /f "tokens=1,2,3,4,5 delims=;" %%a in ('type %reference%') do (
				set refSegment=%%a
				set refKey=%%b
				set refKeyVal=%%c
				set refData=%%d
				set refDataVal=%%e

				if "!refSegment!" == "!solSegment!" (
					if "!refKey!" == "!solKey!" (
						if "!refKeyVal!" == "!solKeyVal!" (
							if "!refData!" == "!curAVal!" (
								set dataFound=true
								set currentData=!curAVal!: !refDataVal!
							)
						)
					)
				)
			)

			if /i "!dataFound!" == "true" (
				if /i "!blockValueUpdate!" == "true" (
					echo !content!
				) else (
					echo !currentData!
				)
			) else (
                if /i not "!isBeginning!" == "true" (
                    if "!elimSegment!" == "[" (
                        echo.
                    )
                )
				echo !content!
                set isBeginning=false
			)
		)
	)>%output%

	set inSegment=
	set inKey=
	set dataFound=
	set elimSegment=
	set curAVal=
	set curBVal=
	set refSegment=
	set refKey=
	set refKeyVal=
	set refData=
	set refDataVal=
	set currentData=
	set blockValueUpdate=
	set lastSegment=
	set lastKey=
	set lastKeyVal=
	endlocal

	if /i "%isDirect%" == "true" (
		del %input%
		move /Y %output% %input% | echo. > nul
	)

	set input=
	set reference=
	set solSegment=
	set solKey=
	set solKeyVal=
	set output=
	set isDirect=
	goto :__end

:__end
	set wildcards=
	set ack=