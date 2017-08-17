pushd .
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsDevCmd.bat"
popd

msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x86"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x64"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM64"

xcopy /F /R /Y /I .\lib\android\x86\Release\libCrunch.so .\ManagedCrunch.Lib\platforms\android\libs\x86\*
xcopy /F /R /Y /I .\lib\android\x64\Release\libCrunch.so .\ManagedCrunch.Lib\platforms\android\libs\x86_64\*
xcopy /F /R /Y /I .\lib\android\ARM\Release\libCrunch.so .\ManagedCrunch.Lib\platforms\android\libs\armeabi-v7a\*
xcopy /F /R /Y /I .\lib\android\ARM64\Release\libCrunch.so .\ManagedCrunch.Lib\platforms\android\libs\arm64-v8a\*

set ARTIFACT_NAME=libcrunch.a
set ARTIFACT_PATH=ManagedCrunch.Lib\platforms\ios\%ARTIFACT_NAME%
set /p DROPBOX_KEY=<secrets\dropboxkey.txt
set AUTHORIZATION_TOKEN="Authorization: Bearer %DROPBOX_KEY%"
set DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/%ARTIFACT_NAME%\"}"
set DROPBOX_URL="https://content.dropboxapi.com/2/files/download"
curl -X POST --header %AUTHORIZATION_TOKEN% --header %DROPBOX_ARGS% -o %ARTIFACT_PATH% %DROPBOX_URL%

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU"

set /p PACKAGE_VERSION=<version.txt
nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%