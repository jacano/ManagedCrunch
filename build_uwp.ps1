. ".\helper.ps1"

PrepareVSEnviroment

pushd src/crunch.Windows/universal

msbuild crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="x64"
msbuild crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="ARM"

xcopy /F /R /Y /I Win32\Release\libcrunch.dll build\x86\*
xcopy /F /R /Y /I x64\Release\libcrunch.dll build\x64\*
xcopy /F /R /Y /I ARM\Release\libcrunch.dll build\arm\*

popd

if (-not (Test-Path "artifacts")) { New-Item "artifacts" -type directory -force }
if (Test-Path "artifacts/uwp") { Remove-Item "artifacts/uwp" -Force -Recurse }
New-Item "artifacts/uwp" -type directory -force

Move-Item "src/crunch.Windows/universal/build" "artifacts/uwp" -Force

