. ".\helper.ps1"

PrepareVSEnviroment

pushd src/crunch.Windows/classic

msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64"

xcopy /F /R /Y /I Win32\Release\libcrunch.dll build\x86\*
xcopy /F /R /Y /I x64\Release\libcrunch.dll build\x64\*

popd

New-Item "artifacts" -type directory -force
Move-Item "src/crunch.Windows/classic/build" "artifacts/windows" -Force

