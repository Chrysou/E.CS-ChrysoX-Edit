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

:_ListExecution
	set _input=%1
	
	setlocal enabledelayedexpansion
	set _execLists=0
	for /f "tokens=1,* delims= " %%a in ('type %_input%') do (
		if /i "%%a" == "" (
			echo.>nul
		) else if /i "%%a" == "IGNORE" (
			echo.>nul
		) else if /i "%%a" == "TITLE" (
			echo.>nul
		) else (
			set /a _execLists=!_execLists! + 1
		)
	)
	echo !_execLists!
	endlocal
	
	set _input=
	
	goto :__end

:_Execute
	set input=%1
	
	call :_ListExecution %input%>src\engine\vars\_execLists
	set /p _execLists=<src\engine\vars\_execLists && del src\engine\vars\_execLists
REM echo Number of executions in %input% are: %_execLists%

	setlocal enabledelayedexpansion
	set _execRemain=0
	for /f "tokens=1,* delims= " %%a in ('type %input%') do (
		if /i "%%a" == "" (
			echo.>nul
		) else if /i "%%a" == "IGNORE" (
			echo.>nul
		) else if /i "%%a" == "NOLOG" (
			set _noexeclog=true
		) else (
			if /i "%%a" == "TITLE" (
				echo.>nul
			) else if /i "%%a" == "IGNORE" (
				echo.>nul
			) else (
				set /a _execRemain=!_execRemain! + 1
			)
			
			if /i "%%a" == "TITLE" (
				echo echo %%b>src\engine\vars\_execTemp.cmd
			) else (
				echo %%a %%b>src\engine\vars\_execTemp.cmd
			)
			
			if /i not "!_noexeclog!" == "true" (
				if not "!_execRemain!" == "0" (
					echo Executing !_execRemain!/%_execLists%
				)
			)

			echo !_execRemain!>src\engine\vars\_execRemain
			echo !_noexeclog!>src\engine\vars\_noexeclog
			
			endlocal
			call src\engine\vars\_execTemp
			if not "%errorlevel%" == "0" (
				echo.
				echo ------ Unexpected error occured with error level "%errorlevel%" while attempting this command:
                echo ------ on Batch script: %input%
				type src\engine\vars\_execTemp.cmd
				del src\engine\vars\_execTemp.cmd>nul
				del src\engine\vars\_execRemain>nul
				del src\engine\vars\_execLists>nul
				echo.
				pause | echo Press any key to quit...
				goto :__error
			)
			del src\engine\vars\_execTemp.cmd
			setlocal enabledelayedexpansion
			
			set /p _execRemain=<src\engine\vars\_execRemain && del src\engine\vars\_execRemain
			set /p _noexeclog=<src\engine\vars\_noexeclog && del src\engine\vars\_noexeclog
		)
	)
	endlocal
	
    set input=
    
	goto :__end

:__error
	goto :__end

:__end
    set ack=