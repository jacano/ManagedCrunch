<#
https://jacanovsts.visualstudio.com/ManagedCrunch/_build/latest?definitionId=1
https://jacanovsts.visualstudio.com/ManagedCrunch/_build?buildId=43
#>

function DownloadAndExpandArtifact([string]$buildId, [string]$artifactName)
{
	$artifactUrl = 'https://jacanovsts.visualstudio.com/ManagedCrunch/_apis/build/builds/' + $buildId + '/artifacts?artifactName=' + $artifactName + '&api-version=5.0-preview.3&%24format=zip'
	wget $artifactUrl -OutFile "artifacts/$artifactName.zip"
	
	Expand-Archive "artifacts/$artifactName.zip" -DestinationPath "artifacts/"
}

if (Test-Path "artifacts") { Remove-Item "artifacts" -Force -Recurse }
New-Item "artifacts" -type directory -force

DownloadAndExpandArtifact "43" "android"
DownloadAndExpandArtifact "43" "ios"
DownloadAndExpandArtifact "43" "windows"
DownloadAndExpandArtifact "43" "uwp"

Copy-Item artifacts/windows/* src/ManagedCrunch/ManagedCrunch.Native/build/net45 -Force -Recurse
Copy-Item artifacts/uwp/* src/ManagedCrunch/ManagedCrunch.Native/build/uap10.0 -Force -Recurse
Copy-Item artifacts/android/* src/ManagedCrunch/ManagedCrunch.Native/build/MonoAndroid -Force -Recurse
Copy-Item artifacts/ios/* src/ManagedCrunch/ManagedCrunch.Native/build/XamariniOS -Force -Recurse