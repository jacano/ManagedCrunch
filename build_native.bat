@echo off

call prepare_msbuild.bat

pushd src

msbuild crunch.Classic/crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32" /p:OutDir="../../output/windows/Win32/"
msbuild crunch.Classic/crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutDir="../../output/windows/x64/"

msbuild crunch.Universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="Win32" /p:OutDir="../../output/uwp/Win32/"
msbuild crunch.Universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutDir="../../output/uwp/x64/"
msbuild crunch.Universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="ARM" /p:OutDir="../../output/uwp/ARM/"

del /s /f /q crunch.Android\x86
del /s /f /q crunch.Android\x64
del /s /f /q crunch.Android\ARM
del /s /f /q crunch.Android\ARM64

msbuild crunch.Android/crunchlibAndroid.vcxproj /p:Configuration="Release" /p:Platform="x86" /p:OutDir="../../output/android/x86/"
msbuild crunch.Android/crunchlibAndroid.vcxproj /p:Configuration="Release" /p:Platform="x64" /p:OutDir="../../output/android/x64/"
msbuild crunch.Android/crunchlibAndroid.vcxproj /p:Configuration="Release" /p:Platform="ARM" /p:OutDir="../../output/android/ARM/"
msbuild crunch.Android/crunchlibAndroid.vcxproj /p:Configuration="Release" /p:Platform="ARM64" /p:OutDir="../../output/android/ARM64/"

popd

call copy_native_libs.bat src\ManagedCrunch\android src\ManagedCrunch\uwp src\ManagedCrunch\windows src\ManagedCrunch.iOS\ios