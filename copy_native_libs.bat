@echo off

xcopy /F /R /Y /I output\android\x86\libCrunch.so %1%\x86\*
xcopy /F /R /Y /I output\android\x64\libCrunch.so %1%\x86_64\*
xcopy /F /R /Y /I output\android\ARM\libCrunch.so %1%\armeabi\*
xcopy /F /R /Y /I output\android\ARM\libCrunch.so %1%\armeabi-v7a\*
xcopy /F /R /Y /I output\android\ARM64\libCrunch.so %1%\arm64-v8a\*

xcopy /F /R /Y /I output\uwp\Win32\Crunch.Universal\libCrunch.dll %2%\x86\*
xcopy /F /R /Y /I output\uwp\x64\Crunch.Universal\libCrunch.dll %2%\x64\*
xcopy /F /R /Y /I output\uwp\ARM\Crunch.Universal\libCrunch.dll %2%\arm\*

xcopy /F /R /Y /I output\windows\Win32\libCrunch.dll %3%\x86\*
xcopy /F /R /Y /I output\windows\x64\libCrunch.dll %3%\x64\*

call grab_ios_build.bat
xcopy /F /R /Y /I output\ios\libcrunch.a %4%\ios\*