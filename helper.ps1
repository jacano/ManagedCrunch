function PrepareVSEnviroment()
{
	# https://stackoverflow.com/a/2124759/104185

	$vs2017Folder = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\"
	$vs2017EnvBat = "VsDevCmd.bat"
	
	if (Test-Path  ($vs2017Folder + $vs2017EnvBat))
	{
		pushd $vs2017Folder
		cmd /c $vs2017EnvBat + "&set" |
		foreach {
		  if ($_ -match "=") {
			$v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
		  }
		}
		popd
	}
}