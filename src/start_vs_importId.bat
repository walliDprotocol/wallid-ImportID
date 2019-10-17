:: Get revision number from git history

@set PTEID_DIR_VS=C:\Program Files (x86)\Microsoft Visual Studio 12.0

@set SOLUTION=%~dp0ImportID.sln

set OUTPUT_FILE=%~dp0release_data.wxs

for /f %%i in ('git rev-list --count HEAD') do set REVISION_NUM=%%i
set /a "REVISION_NUM_STRING=%REVISION_NUM%+1000"

echo ^<Include^> > "%OUTPUT_FILE%"

echo ^<?define importidRevisionNumber=%REVISION_NUM_STRING%?^> >> "%OUTPUT_FILE%"

echo ^</Include^> >> "%OUTPUT_FILE%"

@echo [INFO] Opening Visual Studio solution: "%SOLUTION%"
@"%PTEID_DIR_VS%\Common7\IDE\devenv.exe" "%SOLUTION%"