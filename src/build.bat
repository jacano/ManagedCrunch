@echo off

pushd .
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsDevCmd.bat"
popd

call grab_ios_build.bat

msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x86"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x64"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM64"

xcopy /F /R /Y /I .\lib\android\x86\Release\libCrunch.so .\build\MonoAndroid\android\x86\*
xcopy /F /R /Y /I .\lib\android\x64\Release\libCrunch.so .\build\MonoAndroid\android\x86_64\*
xcopy /F /R /Y /I .\lib\android\ARM\Release\libCrunch.so .\build\MonoAndroid\android\armeabi\*
xcopy /F /R /Y /I .\lib\android\ARM\Release\libCrunch.so .\build\MonoAndroid\android\armeabi-v7a\*
xcopy /F /R /Y /I .\lib\android\ARM64\Release\libCrunch.so .\build\MonoAndroid\android\arm64-v8a\*

xcopy /F /R /Y /I .\lib\uwp\Win32\Release\libCrunch.dll .\build\uap10.0\uwp\x86\*
xcopy /F /R /Y /I .\lib\uwp\x64\Release\libCrunch.dll .\build\uap10.0\uwp\x64\*
xcopy /F /R /Y /I .\lib\uwp\ARM\Release\libCrunch.dll .\build\uap10.0\uwp\arm\*

xcopy /F /R /Y /I .\lib\windows\Win32\Release\libCrunch.dll .\build\net45\windows\x86\*
xcopy /F /R /Y /I .\lib\windows\x64\Release\libCrunch.dll .\build\net45\windows\x64\*

xcopy /F /R /Y /I .\lib\ios\Release\libcrunch.a .\build\XamariniOS\ios\*

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU" /p:SourceLinkCreate=true

set /p PACKAGE_VERSION=<version.txt
nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%