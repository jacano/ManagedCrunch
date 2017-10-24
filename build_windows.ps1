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

pushd src/crunch.Windows

msbuild classic/crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild classic/crunchlibClassic.vcxproj /p:Configuration="Release" /p:Platform="x64"

xcopy /F /R /Y /I output\windows\Win32\libcrunch.dll %3%\x86\*
xcopy /F /R /Y /I output\windows\x64\libcrunch.dll %3%\x64\*


popd