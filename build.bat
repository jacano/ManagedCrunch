@echo off

call prepare_msbuild.bat

pushd src

msbuild crunch.Classic\crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32" /p:OutputPath="..\..\output\windows\Win32"
msbuild crunch.Classic\crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutputPath="..\..\output\windows\x64"

msbuild crunch.Universal\crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="Win32" /p:OutputPath="..\..\output\uwp\Win32"
msbuild crunch.Universal\crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutputPath="..\..\output\uwp\x64"
msbuild crunch.Universal\crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="ARM" /p:OutputPath="..\..\output\uwp\ARM"

msbuild crunch.Android\crunchlibMobile.Android.vcxproj /p:Configuration="Release" /p:Platform="x86" /p:OutputPath="..\..\output\android\x86"
msbuild crunch.Android\crunchlibMobile.Android.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutputPath="..\..\output\android\x64"
msbuild crunch.Android\crunchlibMobile.Android.vcxproj /p:Configuration="Release" /p:Platform="ARM" /p:OutputPath="..\..\output\android\ARM"
msbuild crunch.Android\crunchlibMobile.Android.vcxproj /p:Configuration="Release" /p:Platform="ARM64" /p:OutputPath="..\..\output\android\ARM64"

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch\ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutputPath="..\..\output\ManagedCrunch"
msbuild ManagedCrunch.iOS\ManagedCrunch.iOS.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutputPath="..\..\output\ManagedCrunch.iOS"

popd

xcopy /F /R /Y /I output\android\x86\Release\libCrunch.so nuget\build\MonoAndroid\android\x86\*
xcopy /F /R /Y /I output\android\x64\Release\libCrunch.so nuget\build\MonoAndroid\android\x86_64\*
xcopy /F /R /Y /I output\android\ARM\Release\libCrunch.so nuget\build\MonoAndroid\android\armeabi\*
xcopy /F /R /Y /I output\android\ARM\Release\libCrunch.so nuget\build\MonoAndroid\android\armeabi-v7a\*
xcopy /F /R /Y /I output\android\ARM64\Release\libCrunch.so nuget\build\MonoAndroid\android\arm64-v8a\*

xcopy /F /R /Y /I output\uwp\Win32\Release\libCrunch.dll nuget\build\uap10.0\uwp\x86\*
xcopy /F /R /Y /I output\uwp\x64\Release\libCrunch.dll nuget\build\uap10.0\uwp\x64\*
xcopy /F /R /Y /I output\uwp\ARM\Release\libCrunch.dll nuget\build\uap10.0\uwp\arm\*

xcopy /F /R /Y /I output\windows\Win32\Release\libCrunch.dll nuget\build\net45\windows\x86\*
xcopy /F /R /Y /I output\windows\x64\Release\libCrunch.dll nuget\build\net45\windows\x64\*

call grab_ios_build.bat
xcopy /F /R /Y /I output\ios\Release\libcrunch.a nuget\build\XamariniOS\ios\*

xcopy /F /R /Y /I output\ManagedCrunch\ManagedCrunch.dll nuget\lib\netstandard1.1\*
xcopy /F /R /Y /I output\ManagedCrunch.iOS\ManagedCrunch.dll nuget\lib\XamariniOS\*

