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

#Invoke-Expression ".src\ManagedCrunch\"

pushd src

nuget.exe restore ManagedCrunch.sln
msbuild ManagedCrunch/ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU"

popd