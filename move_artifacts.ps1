<#
https://jacanovsts.visualstudio.com/ManagedXZLZMA/_build/latest?definitionId=2
https://jacanovsts.visualstudio.com/ManagedXZLZMA/_build?buildId=42
#>

function DownloadArtifact([string]$buildId, [string]$artifactName)
{
	$artifactUrl = 'https://jacanovsts.visualstudio.com/ManagedXZLZMA/_apis/build/builds/' + $buildId + '/artifacts?artifactName=' + $artifactName + '&api-version=5.0-preview.3&%24format=zip'
	wget $artifactUrl -OutFile "artifacts/$artifactName.zip"
}

if (Test-Path "artifacts") { Remove-Item "artifacts" -Force -Recurse }
New-Item "artifacts" -type directory -force


DownloadArtifact "42" "android"
DownloadArtifact "42" "ios"
DownloadArtifact "42" "windows"
DownloadArtifact "42" "uwp"

Copy-Item artifacts/windows/* src/ManagedCrunch/ManagedCrunch.Native/build/net45 -Force -Recurse
Copy-Item artifacts/uwp/* src/ManagedCrunch/ManagedCrunch.Native/build/uap10.0 -Force -Recurse
Copy-Item artifacts/android/* src/ManagedCrunch/ManagedCrunch.Native/build/MonoAndroid -Force -Recurse
Copy-Item artifacts/ios/* src/ManagedCrunch/ManagedCrunch.Native/build/XamariniOS -Force -Recurse