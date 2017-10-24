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

msbuild universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="Win32"
msbuild universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="x64"
msbuild universal/crunchlibUniversal.vcxproj /p:Configuration="Release" /p:Platform="ARM"

xcopy /F /R /Y /I output\uwp\Win32\libcrunch.dll %2%\x86\*
xcopy /F /R /Y /I output\uwp\x64\libcrunch.dll %2%\x64\*
xcopy /F /R /Y /I output\uwp\ARM\libcrunch.dll %2%\arm\*

popd