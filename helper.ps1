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

function ZipAndUploadToDropbox([string]$REMOTE_FOLDER, [string]$ARTIFACT_NAME, [string]$BUILD_DIR)
{
	$DROPBOX_KEY = $env:DROPBOX_KEY
	if([string]::IsNullOrEmpty($DROPBOX_KEY))
	{
		$DROPBOX_KEY = Get-Content ".\secrets\dropboxkey.txt"
	}

	$DROPBOX_URL="https://content.dropboxapi.com/2/files/upload"
	$AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
	$ARTIFACT_REMOTEPATH="/$REMOTE_FOLDER/$ARTIFACT_NAME"
	$DROPBOX_ARGS="Dropbox-API-Arg: {\""path\"":\""$ARTIFACT_REMOTEPATH\"", \""mode\"":\""overwrite\""}"
	$CONTENT_TYPE="Content-Type: application/octet-stream"

	pushd $BUILD_DIR

	Compress-Archive -DestinationPath $ARTIFACT_NAME -Path "*" -Force

	curl.exe -f -X POST --header $AUTHORIZATION_TOKEN --header $CONTENT_TYPE --header $DROPBOX_ARGS --data-binary @$ARTIFACT_NAME $DROPBOX_URL

	popd
}

function DownloadFromDropboxAndUnzip([string]$REMOTE_FOLDER, [string]$ARTIFACT_FOLDER, [string]$ARTIFACT_NAME)
{
	$DROPBOX_KEY = $env:DROPBOX_KEY
	if([string]::IsNullOrEmpty($DROPBOX_KEY))
	{
		$DROPBOX_KEY = Get-Content ".\secrets\dropboxkey.txt"
	}

	$DROPBOX_URL="https://content.dropboxapi.com/2/files/download"
	$AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
	$ARTIFACT_REMOTEPATH="/$REMOTE_FOLDER/$ARTIFACT_NAME"
	$DROPBOX_ARGS="Dropbox-API-Arg: {\""path\"":\""$ARTIFACT_REMOTEPATH\""}"

	New-Item $ARTIFACT_FOLDER -type directory -force

	pushd $ARTIFACT_FOLDER

	curl.exe -f -X POST --header $AUTHORIZATION_TOKEN --header "$DROPBOX_ARGS" -o $ARTIFACT_NAME $DROPBOX_URL

	Expand-Archive -Path $ARTIFACT_NAME -Force

	popd
}