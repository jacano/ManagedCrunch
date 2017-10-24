function PrepareVSEnviroment()
{
	# https://stackoverflow.com/a/2124759/104185

	pushd "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
	cmd /c "VsDevCmd.bat&set" |
	foreach {
	  if ($_ -match "=") {
		$v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
	  }
	}
	popd
}

PrepareVSEnviroment

pushd src/crunch.Windows/classic

msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64"

xcopy /F /R /Y /I Win32\Release\libcrunch.dll build\x86\*
xcopy /F /R /Y /I x64\Release\libcrunch.dll build\x64\*

popd