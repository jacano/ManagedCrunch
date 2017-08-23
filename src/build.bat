@echo off

pushd .
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsDevCmd.bat"
popd

set ARTIFACT_NAME=libcrunch.a
set ARTIFACT_PATH=lib\ios\%ARTIFACT_NAME%
if not defined DROPBOX_KEY ( set /p DROPBOX_KEY=<secrets\dropboxkey.txt )
set AUTHORIZATION_TOKEN="Authorization: Bearer %DROPBOX_KEY%"
set DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/%ARTIFACT_NAME%\"}"
set DROPBOX_URL="https://content.dropboxapi.com/2/files/download"
curl -X POST --header %AUTHORIZATION_TOKEN% --header %DROPBOX_ARGS% -o %ARTIFACT_PATH% %DROPBOX_URL%

msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x86"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x64"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM64"

xcopy /F /R /Y /I .\lib\android\x86\Release\libCrunch.so .\build\MonoAndroid\android\x86\*
xcopy /F /R /Y /I .\lib\android\x64\Release\libCrunch.so .\build\MonoAndroid\android\x86_64\*
xcopy /F /R /Y /I .\lib\android\ARM\Release\libCrunch.so .\build\MonoAndroid\android\armeabi-v7a\*
xcopy /F /R /Y /I .\lib\android\ARM64\Release\libCrunch.so .\build\MonoAndroid\android\arm64-v8a\*

xcopy /F /R /Y /I .\lib\uwp\x86\Release\libCrunch.dll .\build\uap10.0\uwp\x86\*
xcopy /F /R /Y /I .\lib\uwp\x64\Release\libCrunch.dll .\build\uap10.0\uwp\x64\*
xcopy /F /R /Y /I .\lib\uwp\ARM\Release\libCrunch.dll .\build\uap10.0\uwp\arm\*

xcopy /F /R /Y /I .\lib\windows\x86\Release\libCrunch.dll .\build\net45\windows\x86\*
xcopy /F /R /Y /I .\lib\windows\x64\Release\libCrunch.dll .\build\net45\windows\x64\*

xcopy /F /R /Y /I .\lib\ios\libcrunch.a .\build\XamariniOS\ios\*

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU" /p:SourceLinkCreate=true

set /p PACKAGE_VERSION=<version.txt
nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%