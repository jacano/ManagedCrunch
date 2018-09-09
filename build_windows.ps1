. ".\helper.ps1"

PrepareVSEnviroment

pushd src/crunch.Windows/classic

msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64"

xcopy /F /R /Y /I Win32\Release\libcrunch.dll build\x86\*
xcopy /F /R /Y /I x64\Release\libcrunch.dll build\x64\*

popd

if (-not (Test-Path "artifacts")) { New-Item "artifacts" -type directory -force }
if (Test-Path "artifacts/windows") { Remove-Item "artifacts/windows" -Force -Recurse }
New-Item "artifacts/windows" -type directory -force

Move-Item "src/crunch.Windows/classic/build" "artifacts/windows" -Force

