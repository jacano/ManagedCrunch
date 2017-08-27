@echo off

set /p PACKAGE_VERSION=<version.txt

xcopy /F /R /Y /I ..\output\android\x86\Release\libCrunch.so .\build\MonoAndroid\android\x86\*
xcopy /F /R /Y /I ..\output\android\x64\Release\libCrunch.so .\build\MonoAndroid\android\x86_64\*
xcopy /F /R /Y /I ..\output\android\ARM\Release\libCrunch.so .\build\MonoAndroid\android\armeabi\*
xcopy /F /R /Y /I ..\output\android\ARM\Release\libCrunch.so .\build\MonoAndroid\android\armeabi-v7a\*
xcopy /F /R /Y /I ..\output\android\ARM64\Release\libCrunch.so .\build\MonoAndroid\android\arm64-v8a\*

xcopy /F /R /Y /I ..\output\uwp\Win32\Release\libCrunch.dll .\build\uap10.0\uwp\x86\*
xcopy /F /R /Y /I ..\output\uwp\x64\Release\libCrunch.dll .\build\uap10.0\uwp\x64\*
xcopy /F /R /Y /I ..\output\uwp\ARM\Release\libCrunch.dll .\build\uap10.0\uwp\arm\*

xcopy /F /R /Y /I ..\output\windows\Win32\Release\libCrunch.dll .\build\net45\windows\x86\*
xcopy /F /R /Y /I ..\output\windows\x64\Release\libCrunch.dll .\build\net45\windows\x64\*

call grab_ios_build.bat
xcopy /F /R /Y /I ..\output\ios\Release\libcrunch.a .\build\XamariniOS\ios\*

xcopy /F /R /Y /I ..\output\ManagedCrunch\bin\Release\netstandard1.1\ManagedCrunch.dll .\lib\netstandard1.1\*
xcopy /F /R /Y /I ..\output\ManagedCrunch.iOS\bin\Release\ManagedCrunch.dll .\lib\XamariniOS\*

nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%