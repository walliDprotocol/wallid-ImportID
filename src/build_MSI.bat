SET VERSION=1.0
SET WIX_PATH="C:\Program Files (x86)\WiX Toolset v3.10\bin"


:: VS Project generated with qmake -tp vc ImportID.pro

msbuild /p:Configuration=Release /p:Platform=x64

%WIX_PATH%\candle -nologo -arch x64 ImportID.wxs

if %errorlevel% neq 0 exit /b %errorlevel%

%WIX_PATH%\light -nologo -ext WixUIExtension -out MSI\ImportID-%VERSION%.msi ImportID.wixobj

